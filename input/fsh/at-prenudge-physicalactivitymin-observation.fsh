// ==============================================================================
// Two-layer source discrimination rationale:
//   LAYER 1 — Observation.method (data origin):
//     Distinguishes whether data came from a wearable/sensor (8359006 Automated)
//     or a questionnaire/self-report (87982008 Manual). Bound to the existing
//     prenudge-observation-method ValueSet (do NOT recreate). Both values are
//     valid for every component combination below — no invariant restricts a
//     component to one method value, except pa-wearable-01 (see below).
//   LAYER 2 — component[classificationMethod] (intensity classification algorithm):
//     Carries the specific algorithm/technique used to classify activity intensity
//     (e.g. heart-rate zones, MET look-up, MET calculated, self-report).
//     This component is only meaningful when method = Automated or when the
//     patient explicitly tagged the classification method in a manual report.
//     See pa-manual-comp-01 for permitted-combinations constraint. Its permitted
//     codes are independent of which aggregate flavor(s) (see below) are present:
//     classificationMethod describes how moderate/vigorous intensity itself was
//     classified, not how the aggregate was computed.
//
// classificationMethod component follows the mealContext pattern from
//   at-prenudge-bloodglucose-observation.fsh exactly:
//   - SNOMED CT discriminator code  (mealContext uses 309602000 "Temporal
//     periods relating to feeding and eating"; here we use 246501002 "Technique")
//   - value[x] only CodeableConcept
//   - Required binding to a dedicated ValueSet
//
// Two aggregate components (added because a plain, unweighted moderate+vigorous
//   sum is sometimes needed alongside — or instead of — the WHO/IPAQ weighted
//   score; either, both, or neither may be present, independent of moderate/
//   vigorous being individually distinguishable):
//   - aggregateActivity          — plain sum, NO ×2 vigorous weighting (pa-agg-02).
//                                  Reuses LOINC 101691-4 "Duration of physical
//                                  activity" (see panel-level collision comment
//                                  below): a plain, literal duration concept with
//                                  no weighting semantics of its own — the natural
//                                  fit for an unweighted total.
//   - aggregateActivityWeighted  — WHO/IPAQ moderate-equivalent sum, ×2 vigorous
//                                  weighting (pa-agg-01). SNOMED CT 68130003
//                                  "Physical activity" (generic observable-entity
//                                  concept), kept deliberately distinct from the
//                                  panel code since this is a derived/transformed
//                                  metric, not a plain restatement of duration.
// ==============================================================================

Alias: $loinc    = http://loinc.org
Alias: $SCT      = http://snomed.info/sct
Alias: $UCUM     = http://unitsofmeasure.org
Alias: $prenudgeBase = https://fhir.hl7.at/prenudge/appdata/r4/StructureDefinition/at-prenudge-observation
Alias: $methodVS      = https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-observation-method
Alias: $classMethodVS = https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-physical-activity-classification-method-vs

// ---------------------------------------------------------------------------
// Invariants - TODO: check
// ---------------------------------------------------------------------------

Invariant: pa-panel-01
Description: "At least one activity component must be present"
Severity: #error
Expression: "component.exists()"
// Sending only component[aggregateActivity] (or only aggregateActivityWeighted) satisfies this invariant.

/// pa-agg-01 — conditional WEIGHTED aggregate formula check
//
// Antecedent: at least one of moderateActivity (77592-4) or vigorousActivity
//   (77593-2) is present.
//
// Consequent: aggregateActivityWeighted (SNOMED CT 68130003 "Physical activity")
//   SHOULD equal
//     iif(moderate present, moderateValue, 0)
//   + (iif(vigorous present, vigorousValue, 0) × 2)
//
// Passes silently when:
//   • only aggregateActivityWeighted is present (antecedent false → implies true)
//   • both moderate and vigorous are absent (same reason)
// Warns when:
//   • moderate or vigorous is present and the aggregate value is wrong
//   • moderate or vigorous is present and aggregateActivityWeighted is absent
//     (aggregate value empty → equality empty → implies empty → warning)
//
// Vigorous ×2 weighting rationale (WHO/IPAQ): 1 min vigorous ≡ 2 min moderate
//   at the metabolic-equivalent level. Aggregate is expressed in moderate-
//   equivalent minutes to allow cross-source comparison.
Invariant: pa-agg-01
Description: "When moderateActivity or vigorousActivity are present, aggregateActivityWeighted SHOULD equal moderateActivity (or 0) + (vigorousActivity × 2, or 0)"
Severity: #warning
Expression: """
(component.where(code.coding.where(code = '77592-4').exists()).exists()
 or component.where(code.coding.where(code = '77593-2').exists()).exists())
implies
component.where(code.coding.where(code = '68130003').exists()).value.ofType(Quantity).value =
  iif(component.where(code.coding.where(code = '77592-4').exists()).exists(),
      component.where(code.coding.where(code = '77592-4').exists()).value.ofType(Quantity).value,
      0)
  + (iif(component.where(code.coding.where(code = '77593-2').exists()).exists(),
         component.where(code.coding.where(code = '77593-2').exists()).value.ofType(Quantity).value,
         0) * 2)
"""

/// pa-agg-02 — conditional UNWEIGHTED aggregate formula check
//
// Same antecedent as pa-agg-01: at least one of moderateActivity (77592-4) or
//   vigorousActivity (77593-2) is present.
//
// Consequent: aggregateActivity (LOINC 101691-4 "Duration of physical activity")
//   SHOULD equal
//     iif(moderate present, moderateValue, 0) + iif(vigorous present, vigorousValue, 0)
//   — a plain arithmetic sum with NO ×2 vigorous weighting (unlike pa-agg-01).
//
// Passes silently when only aggregateActivity is present, or when both moderate
//   and vigorous are absent — the same standalone-total case used by the
//   questionnaire-only scenarios where intensity cannot be distinguished.
// Warns when moderate or vigorous is present and aggregateActivity is absent or wrong.
Invariant: pa-agg-02
Description: "When moderateActivity or vigorousActivity are present, aggregateActivity SHOULD equal moderateActivity (or 0) + vigorousActivity (or 0), with no intensity weighting"
Severity: #warning
Expression: """
(component.where(code.coding.where(code = '77592-4').exists()).exists()
 or component.where(code.coding.where(code = '77593-2').exists()).exists())
implies
component.where(code.coding.where(code = '101691-4').exists()).value.ofType(Quantity).value =
  iif(component.where(code.coding.where(code = '77592-4').exists()).exists(),
      component.where(code.coding.where(code = '77592-4').exists()).value.ofType(Quantity).value,
      0)
  + iif(component.where(code.coding.where(code = '77593-2').exists()).exists(),
        component.where(code.coding.where(code = '77593-2').exists()).value.ofType(Quantity).value,
        0)
"""

// pa-wearable-01 (architectural decision): when method = Automated (SCT 8359006),
//   aggregateActivityWeighted MUST be present.
// TODO: check if we need this
Invariant: pa-wearable-01
Description: "When method is Automated, aggregateActivityWeighted must be present"
Severity: #error
Expression: "method.coding.exists(system = 'http://snomed.info/sct' and code = '8359006') implies component.where(code.coding.where(code = '68130003').exists()).exists()"

// pa-manual-comp-01 (architectural decision): when method = Manual (SCT 87982008),
//   classificationMethod (discriminator SCT 246501002) must be absent OR = self-rp.
Invariant: pa-manual-comp-01
Description: "When method is Manual, classificationMethod component must be absent or carry only code self-rp"
Severity: #warning
Expression: """
method.coding.exists(system = 'http://snomed.info/sct' and code = '87982008')
implies (
  component.where(code.coding.where(code = '246501002').exists()).empty()
  or component.where(code.coding.where(code = '246501002').exists())
             .value.ofType(CodeableConcept).coding.where(code = 'self-rp').exists()
)
"""

// ---------------------------------------------------------------------------
// Profile
// ---------------------------------------------------------------------------

Profile:        AtPrenudgeObservationPhysicalActivity
Parent:         AtPrenudgeObservation
Id:             at-prenudge-physical-activity-minutes-observation
Title:          "AT PreNUDGE Observation Physical Activity Minutes"
Description:    """Observation profile for recording physical activity duration as a panel
(moderate, vigorous, and two alternative aggregate components) derived from either a
wearable device or the EHIS-PAQ/ATHIS questionnaire (Q7/PE7).

Two aggregate flavors may be sent independently of each other:
  - aggregateActivity          — plain/unweighted total: moderateActivity (or 0) +
                                  vigorousActivity (or 0). Also used standalone when
                                  moderate/vigorous cannot be distinguished at all
                                  (e.g. a single questionnaire total). See pa-agg-02.
  - aggregateActivityWeighted  — WHO/IPAQ moderate-equivalent total: moderateActivity
                                  (or 0) + (vigorousActivity × 2, or 0). See pa-agg-01.
Both, either, or neither aggregate MAY be present; pa-panel-01 only requires that at
least one component (of any kind) exists. Sending only an aggregate (without
moderateActivity/vigorousActivity) is valid and expected whenever the source cannot
distinguish intensity levels at all (e.g. a single questionnaire total). However,
whenever a source CAN distinguish moderate from vigorous activity, it SHOULD send
moderateActivity and vigorousActivity individually (in addition to any aggregate) —
sending only a pre-computed aggregate discards information a consumer might need.
This cannot be enforced by an invariant (an instance cannot express "the source
could have distinguished this but chose not to"), so it is stated here as
implementation guidance rather than a machine-checkable rule.

Example component combinations (not exhaustive):
  (a) aggregateActivity only              — questionnaire source, no intensity split (Q7/PE7)
  (b) moderate only                       — manual source; vigorous implicitly 0,
                                             aggregates SHOULD equal moderateActivity
                                             (pa-agg-01/pa-agg-02 warning if absent)
  (c) moderate + aggregateActivityWeighted — partial wearable or manual source
  (d) vigorous + aggregateActivityWeighted — partial wearable source
  (e) moderate + vigorous + aggregateActivityWeighted            — full wearable source
  (g) moderate + vigorous + aggregateActivity + aggregateActivityWeighted — full wearable
      source reporting both aggregate flavors side by side"""

* obeys pa-panel-01
* obeys pa-agg-01
* obeys pa-agg-02
* obeys pa-wearable-01
* obeys pa-manual-comp-01

// Panel code (LOINC 101691-4 "Duration of physical activity")
// Note: 101691-4 COLLISION — this same code is also used for component[aggregateActivity]
//   (see below). obs-7 is not violated here because Observation.value[x] is absent on
//   this panel-level Observation; the value lives exclusively in the components.
//   Design decision: keep 101691-4 at the panel level (most appropriate LOINC for the
//   concept) and reuse it at the aggregateActivity (plain) component level, since that
//   component is the closest semantic match — a plain, unweighted duration, exactly
//   like the panel concept itself. A comment in that component slice documents the
//   collision. aggregateActivityWeighted deliberately uses a distinct code (SNOMED CT
//   68130003) instead, since it is a derived/transformed metric, not a plain duration.
* code = $loinc#101691-4 "Duration of physical activity"

// LAYER 1 — method: origin of data (wearable sensor vs. questionnaire / self-report)
// Bound (required) to prenudge-observation-method — do NOT recreate this ValueSet.
//   SCT 8359006 = Automated (wearable / sensor source)
//   SCT 87982008 = Manual   (questionnaire / self-report)
// Both values are valid regardless of which aggregate component(s) are sent.
* method 1..1 MS
* method from $methodVS (required)

// ---------------------------------------------------------------------------
// Component slicing — Open, discriminated by pattern:code
// Follows the same slicing discriminator used in at-prenudge-bloodglucose-observation.fsh
// ---------------------------------------------------------------------------
* component ^slicing.discriminator[0].type = #pattern
* component ^slicing.discriminator[0].path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false
* component ^short = "Physical activity duration components"
* component ^definition = "Panel components: moderateActivity, vigorousActivity, aggregateActivity (unweighted, min/wk), aggregateActivityWeighted (WHO/IPAQ weighted, min/wk) and classificationMethod (CodeableConcept)."

* component contains
    moderateActivity          0..1 and
    vigorousActivity          0..1 and
    aggregateActivity         0..1 and
    aggregateActivityWeighted 0..1 and
    classificationMethod      0..1 MS

// --- moderateActivity ---
* component[moderateActivity].code = $loinc#77592-4 "Moderate physical activity [IPAQ]"
* component[moderateActivity].value[x] only Quantity
* component[moderateActivity].valueQuantity.unit = "min/wk"
* component[moderateActivity].valueQuantity.system = "http://unitsofmeasure.org"
* component[moderateActivity].valueQuantity.code = #min/wk

// --- vigorousActivity ---
* component[vigorousActivity].code = $loinc#77593-2 "Vigorous physical activity [IPAQ]"
* component[vigorousActivity].value[x] only Quantity
* component[vigorousActivity].valueQuantity.unit = "min/wk"
* component[vigorousActivity].valueQuantity.system = "http://unitsofmeasure.org"
* component[vigorousActivity].valueQuantity.code = #min/wk

// --- aggregateActivity (plain / unweighted total) ---
// 101691-4 COLLISION (see panel-level comment above).
// This component reuses the panel code 101691-4 because it is the closest semantic
// match: a plain, unweighted duration of physical activity, with no WHO/IPAQ
// weighting formula implied — exactly what the panel-level concept itself means.
// obs-7 is harmless here (no root value[x] present on the panel Observation).
// pa-agg-02 FHIRPath references code='101691-4' to locate this component.
* component[aggregateActivity].code = $loinc#101691-4 "Duration of physical activity"
* component[aggregateActivity].value[x] only Quantity
* component[aggregateActivity].valueQuantity.unit = "min/wk"
* component[aggregateActivity].valueQuantity.system = "http://unitsofmeasure.org"
* component[aggregateActivity].valueQuantity.code = #min/wk

// --- aggregateActivityWeighted (WHO/IPAQ ×2-vigorous weighted total) ---
// SNOMED CT 68130003 "Physical activity" — a generic observable-entity concept chosen
// because no LOINC/SNOMED code represents the WHO/IPAQ moderate-equivalent weighted
// sum used here. (LOINC 77594-0/77595-7 "Total physical activity [IPAQ]" apply a
// different, MET-based weighting that also includes walking, so they do not fit.)
// Deliberately kept distinct from the panel's LOINC 101691-4: this is a derived/
// transformed metric (×2 vigorous), not a plain restatement of duration, so it does
// NOT reuse the panel code the way aggregateActivity (plain) does above.
// pa-agg-01 FHIRPath references code='68130003' to locate this component.
// pa-wearable-01 also references code='68130003' to require this component for Automated sources.
* component[aggregateActivityWeighted].code = $SCT#68130003 "Physical activity"
* component[aggregateActivityWeighted].value[x] only Quantity
* component[aggregateActivityWeighted].valueQuantity.unit = "min/wk"
* component[aggregateActivityWeighted].valueQuantity.system = "http://unitsofmeasure.org"
* component[aggregateActivityWeighted].valueQuantity.code = #min/wk

// --- classificationMethod ---
// Follows the mealContext pattern from at-prenudge-bloodglucose-observation.fsh:
//   component code:  SNOMED CT 246501002 "Technique" (component discriminator)
//                    (mealContext uses 309602000 "Temporal periods relating to feeding
//                     and eating"; here the analogous concept for intensity classification
//                     technique is 246501002 "Technique")
//   value[x]:        only CodeableConcept (no Quantity)
//   binding:         required to prenudge-physical-activity-classification-method-vs
//
// Permitted codes per method value (see pa-manual-comp-01), independent of which
// aggregate component(s) are also present:
//   method = Automated (SCT 8359006): component SHOULD be present;
//            any code (hrz, met-lu, met-cal, self-rp) is valid.
//   method = Manual    (SCT 87982008): component MUST be absent
//            OR carry only code self-rp.
* component[classificationMethod].code = $SCT#246501002 "Technique"
* component[classificationMethod].value[x] only CodeableConcept
* component[classificationMethod].value[x] from $classMethodVS (required)
