// ==============================================================================
// Two-layer source discrimination rationale:
//   LAYER 1 — Observation.method (data origin):
//     Distinguishes whether data came from a wearable/sensor (8359006 Automated)
//     or a questionnaire/self-report (87982008 Manual). Bound to the existing
//     prenudge-observation-method ValueSet (do NOT recreate).
//   LAYER 2 — component[classificationMethod] (intensity classification algorithm):
//     Carries the specific algorithm/technique used to classify activity intensity
//     (e.g. heart-rate zones, MET look-up, MET calculated, self-report).
//     This component is only meaningful when method = Automated or when the
//     patient explicitly tagged the classification method in a manual report.
//     See pa-manual-comp-01 for permitted-combinations constraint.
//
// classificationMethod component follows the mealContext pattern from
//   at-prenudge-bloodglucose-observation.fsh exactly:
//   - SNOMED CT discriminator code  (mealContext uses 309602000 "Temporal
//     periods relating to feeding and eating"; here we use 246501002 "Technique")
//   - value[x] only CodeableConcept
//   - Required binding to a dedicated ValueSet
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
// Sending only component[aggregateActivity] satisfies this invariant.

/// pa-agg-01 — conditional aggregate formula check
//
// Antecedent: at least one of moderateActivity (77592-4) or vigorousActivity
//   (77593-2) is present.
//
// Consequent: aggregateActivity SHOULD equal
//     iif(moderate present, moderateValue, 0)
//   + (iif(vigorous present, vigorousValue, 0) × 2)
//
// Passes silently when:
//   • only aggregateActivity is present (antecedent false → implies true)
//   • both moderate and vigorous are absent (same reason)
// Warns when:
//   • moderate or vigorous is present and the aggregate value is wrong
//   • moderate or vigorous is present and aggregateActivity is absent
//     (aggregate value empty → equality empty → implies empty → warning)
//
// Vigorous ×2 weighting rationale (WHO/IPAQ): 1 min vigorous ≡ 2 min moderate
//   at the metabolic-equivalent level. Aggregate is expressed in moderate-
//   equivalent minutes to allow cross-source comparison.
Invariant: pa-agg-01
Description: "When moderateActivity or vigorousActivity are present, aggregateActivity SHOULD equal moderateActivity (or 0) + (vigorousActivity × 2, or 0)"
Severity: #warning
Expression: """
(component.where(code.coding.where(code = '77592-4').exists()).exists()
 or component.where(code.coding.where(code = '77593-2').exists()).exists())
implies
component.where(code.coding.where(code = '101691-4').exists()).value.ofType(Quantity).value =
  iif(component.where(code.coding.where(code = '77592-4').exists()).exists(),
      component.where(code.coding.where(code = '77592-4').exists()).value.ofType(Quantity).value,
      0)
  + (iif(component.where(code.coding.where(code = '77593-2').exists()).exists(),
         component.where(code.coding.where(code = '77593-2').exists()).value.ofType(Quantity).value,
         0) * 2)
"""

// pa-wearable-01 (architectural decision): when method = Automated (SCT 8359006),
//   aggregateActivity MUST be present.
// TODO: check if we need this
Invariant: pa-wearable-01
Description: "When method is Automated, aggregateActivity must be present"
Severity: #error
Expression: "method.coding.exists(system = 'http://snomed.info/sct' and code = '8359006') implies component.where(code.coding.where(code = '101691-4').exists()).exists()"

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
(moderate, vigorous, aggregate components) derived from either a wearable device or
the EHIS-PAQ/ATHIS questionnaire (Q7/PE7). Supports four valid component combinations:
  (a) aggregate only           — questionnaire source (Q7/PE7 → aggregateActivity)
  (b) moderate only            — manual source; vigorous implicitly 0,
                                 aggregate = moderateActivity (pa-agg-01 warning
                                 if aggregateActivity absent)
  (c) moderate + aggregate     — partial wearable or manual source
  (d) vigorous + aggregate     — partial wearable source
  (e) all three                — full wearable source. """

* obeys pa-panel-01
* obeys pa-agg-01
* obeys pa-wearable-01
* obeys pa-manual-comp-01

// Panel code (LOINC 101691-4 "Duration of physical activity")
// Note: 101691-4 COLLISION — this same code is also used for component[aggregateActivity]
//   (see below). obs-7 is not violated here because Observation.value[x] is absent on
//   this panel-level Observation; the value lives exclusively in the components.
//   Design decision: keep 101691-4 at the panel level (most appropriate LOINC for the
//   concept) and reuse it at the aggregate component level to avoid introducing an
//   unrelated code. A comment in each component slice documents the collision.
* code = $loinc#101691-4 "Duration of physical activity"

// LAYER 1 — method: origin of data (wearable sensor vs. questionnaire / self-report)
// Bound (required) to prenudge-observation-method — do NOT recreate this ValueSet.
//   SCT 8359006 = Automated (wearable / sensor source)
//   SCT 87982008 = Manual   (questionnaire / self-report)
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
* component ^definition = "Panel components: moderateActivity, vigorousActivity, aggregateActivity (min/wk) and classificationMethod (CodeableConcept)."

* component contains
    moderateActivity      0..1 and
    vigorousActivity      0..1 and
    aggregateActivity     0..1 and
    classificationMethod  0..1 MS

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

// --- aggregateActivity ---
// 101691-4 COLLISION (see panel-level comment above).
// The aggregate component reuses the panel code 101691-4 because no dedicated
// "total physical activity duration" LOINC exists with broader precision than
// 101691-4 itself. obs-7 is harmless here (no root value[x] present).
// pa-agg-01 FHIRPath references code='101691-4' to locate this component.
// pa-wearable-01 also references code='101691-4' to require this component for Automated sources.
* component[aggregateActivity].code = $loinc#101691-4 "Duration of physical activity"
* component[aggregateActivity].value[x] only Quantity
* component[aggregateActivity].valueQuantity.unit = "min/wk"
* component[aggregateActivity].valueQuantity.system = "http://unitsofmeasure.org"
* component[aggregateActivity].valueQuantity.code = #min/wk

// --- classificationMethod ---
// Follows the mealContext pattern from at-prenudge-bloodglucose-observation.fsh:
//   component code:  SNOMED CT 246501002 "Technique" (component discriminator)
//                    (mealContext uses 309602000 "Temporal periods relating to feeding
//                     and eating"; here the analogous concept for intensity classification
//                     technique is 246501002 "Technique")
//   value[x]:        only CodeableConcept (no Quantity)
//   binding:         required to prenudge-physical-activity-classification-method-vs
//
// Permitted codes per method value (see pa-manual-comp-01):
//   method = Automated (SCT 8359006): component SHOULD be present;
//            any code (hrz, met-lu, met-cal, self-rp) is valid.
//   method = Manual    (SCT 87982008): component MUST be absent
//            OR carry only code self-rp.
* component[classificationMethod].code = $SCT#246501002 "Technique"
* component[classificationMethod].value[x] only CodeableConcept
* component[classificationMethod].value[x] from $classMethodVS (required)