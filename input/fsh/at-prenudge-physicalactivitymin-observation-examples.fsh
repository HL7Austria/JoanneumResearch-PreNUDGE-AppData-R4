// Seven Observation instances covering every valid component combination
// described in the at-prenudge-physicalactivitymin-observation profile.
// aggregateActivity was split into two flavors:
//   - aggregateActivity (plain)  — LOINC 101691-4 "Duration of physical activity"
//     (same code as the panel — the closest semantic match, since this is a plain,
//     unweighted duration). No ×2 weighting; used whenever there is no moderate/
//     vigorous split to weight, i.e. standalone questionnaire totals (scenarios a,
//     f), OR as the sum moderateActivity + vigorousActivity when both are known
//     (pa-agg-02, scenario g).
//   - aggregateActivityWeighted  — SNOMED CT 68130003 "Physical activity" (kept
//     distinct from the panel code, since this is a derived/transformed metric).
//     WHO/IPAQ ×2-vigorous weighted sum; only ever meaningful once moderate/
//     vigorous are (at least partially) known (pa-agg-01, scenarios c, d, e, g).
// Scenarios (c)-(e) below only populate the weighted flavor — they now also
// trigger the new pa-agg-02 WARNING (plain aggregateActivity absent while
// moderate/vigorous is present). This is intentional and documented
// per-scenario below; scenario (g) is the new example showing both aggregate
// flavors sent together with no warnings.
//
//   (a) aggregate only           — questionnaire / manual source, no intensity split (aggregateActivity, plain)
//   (b) moderate only            — manual; both aggregates absent → pa-agg-01 + pa-agg-02 WARNING
//   (c) moderate + aggregate     — manual; vigorous implicitly 0 (aggregateActivityWeighted only)
//   (d) vigorous + aggregate     — partial wearable, automated (aggregateActivityWeighted only)
//   (e) all three                — full wearable, automated (aggregateActivityWeighted only)
//   (f) EHIS-PAQ Q7 mapped       — aggregate only, no intensity split; derivedFrom QR example (aggregateActivity, plain)
//   (g) all components, both aggregates — full wearable, automated; demonstrates
//       aggregateActivity + aggregateActivityWeighted sent side by side (pa-agg-01
//       and pa-agg-02 both satisfied cleanly)
//
// Invariant evaluation summary per instance — see inline comments.
// Instances are self-contained; no dependency on other example files.

Alias: $loinc   = http://loinc.org
Alias: $SCT     = http://snomed.info/sct
Alias: $classCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-physical-activity-classification-method-cs

// ═════════════════════════════════════════════════════════════════════════════
// (a) AGGREGATE ONLY — manual / questionnaire source
//
// Source:  any self-report that provides only a total activity figure, with no
//          moderate/vigorous split — mapped to the plain aggregateActivity, not
//          aggregateActivityWeighted, for the same reason as scenario (f): no ×2
//          weighting is applicable when there is no intensity split to weight.
// Values:  aggregateActivity (plain) = 200 min/wk
//
// pa-panel-01  : ✓  component.exists() — aggregateActivity present
// pa-agg-01    : ✓  antecedent (moderateActivity.exists() or vigorousActivity.exists()) = false
//                   → implies = true; invariant passes silently, no warning
// pa-agg-02    : ✓  same antecedent = false → passes silently, no warning
// pa-wearable-01: ✓  method = Manual (SCT 87982008) → antecedent false, N/A
// pa-manual-comp-01: ✓  classificationMethod absent → implies = true
// ═════════════════════════════════════════════════════════════════════════════
Instance:   physical-activity-minutes-aggregate-only-example
InstanceOf: at-prenudge-physical-activity-minutes-observation
Usage:      #example
Title:      "Physical Activity Minutes O - (a) Aggregate Only (Manual)"
Description: """Scenario (a): only component[aggregateActivity] (plain) is present.
Typical for a questionnaire-derived observation that asks only for total activity
time without splitting moderate and vigorous — the value carries no WHO/IPAQ
weighting, so it belongs on the plain aggregateActivity component rather than
aggregateActivityWeighted.  pa-agg-01 and pa-agg-02 both pass silently because
neither moderate nor vigorous is present."""

* meta.profile = "https://fhir.hl7.at/prenudge/appdata/r4/StructureDefinition/at-prenudge-physical-activity-minutes-observation"
* identifier[+]
  * system = "https://www.joanneum.at"
  * value  = "obs-pa-a-2026-03-24-001"
* status            = #final
* code              = $loinc#101691-4 "Duration of physical activity"
* subject           = Reference(Patient/example)
* effectiveDateTime = "2026-03-24T08:00:00+01:00"
* issued            = "2026-03-24T08:00:00+01:00"
* method            = $SCT#87982008 "Manual"

// aggregateActivity (plain) = 200 min/wk (total self-reported leisure time)
// LOINC 101691-4 reused at component level — see profile collision comment.
* component[+]
  * code                    = $loinc#101691-4 "Duration of physical activity"
  * valueQuantity.value     = 200
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// moderateActivity          : absent (not reported)
// vigorousActivity          : absent (not reported)
// aggregateActivityWeighted : absent — antecedent false, pa-agg-01 N/A
// classificationMethod      : absent — method = Manual; pa-manual-comp-01 satisfied


// ═════════════════════════════════════════════════════════════════════════════
// (b) MODERATE ONLY — manual source, both aggregates absent → pa-agg-01 + pa-agg-02 WARNING
//
// Source:  questionnaire or self-report capturing moderate activity only;
//          vigorous = implicitly 0.
// Values:  moderateActivity = 150 min/wk
//
// pa-panel-01  : ✓  component.exists() — moderateActivity present
// pa-agg-01    : ⚠  WARNING — antecedent true (moderateActivity present);
//                   consequent checks aggregateActivityWeighted.value = 150 + (0×2) = 150
//                   but aggregateActivityWeighted is absent → LHS empty → implies empty
//                   → severity #warning fires; aggregateActivityWeighted should be added
// pa-agg-02    : ⚠  WARNING — same antecedent true; consequent checks
//                   aggregateActivity.value = 150 + 0 = 150 but aggregateActivity is
//                   absent → LHS empty → implies empty → severity #warning fires;
//                   aggregateActivity should be added
// pa-wearable-01: ✓  method = Manual → antecedent false, N/A
// pa-manual-comp-01: ✓  classificationMethod absent → implies = true
// ═════════════════════════════════════════════════════════════════════════════
Instance:   physical-activity-minutes-moderate-only-example
InstanceOf: at-prenudge-physical-activity-minutes-observation
Usage:      #example
Title:      "Physical Activity Minutes O - (b) Moderate Only (Manual, pa-agg-01 + pa-agg-02 warning)"
Description: """Scenario (b): only component[moderateActivity] is present; both aggregates absent.
pa-agg-01 and pa-agg-02 each fire a WARNING because moderateActivity is present but
the corresponding aggregate is not. aggregateActivityWeighted should equal
moderateActivity + (0 × 2) = 150 min/wk; aggregateActivity (plain) should equal
moderateActivity + 0 = 150 min/wk. A sender should add whichever aggregate(s) it
supports to suppress the corresponding warning.
This scenario may arise when a source captures moderate activity but omits the aggregates."""

* meta.profile = "https://fhir.hl7.at/prenudge/appdata/r4/StructureDefinition/at-prenudge-physical-activity-minutes-observation"
* identifier[+]
  * system = "https://www.joanneum.at"
  * value  = "obs-pa-b-2026-03-24-001"
* status            = #final
* code              = $loinc#101691-4 "Duration of physical activity"
* subject           = Reference(Patient/example)
* effectiveDateTime = "2026-03-24T08:00:00+01:00"
* issued            = "2026-03-24T08:00:00+01:00"
* method            = $SCT#87982008 "Manual"

// moderateActivity = 150 min/wk
* component[+]
  * code                    = $loinc#77592-4 "Moderate physical activity [IPAQ]"
  * valueQuantity.value     = 150
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// aggregateActivityWeighted : absent → pa-agg-01 WARNING (see description)
// aggregateActivity (plain) : absent → pa-agg-02 WARNING (see description)
// vigorousActivity          : absent
// classificationMethod      : absent — method = Manual; pa-manual-comp-01 satisfied


// ═════════════════════════════════════════════════════════════════════════════
// (c) MODERATE + AGGREGATE — manual source, vigorous implicitly 0
//
// Source:  questionnaire that reports moderate activity; sender derives the
//          weighted aggregate only (does not send the plain aggregate).
// Values:  moderateActivity = 90 min/wk
//          aggregateActivityWeighted = 90 min/wk  (= 90 + (0 × 2))
//
// pa-panel-01  : ✓  component.exists()
// pa-agg-01    : ✓  90 = 90 + (0 × 2) = 90  ✓
// pa-agg-02    : ⚠  WARNING — antecedent true (moderateActivity present);
//                   aggregateActivity (plain) is absent → implies empty → warning
//                   (sender only computed the weighted flavor here; see scenario (g)
//                   for both flavors sent together)
// pa-wearable-01: ✓  method = Manual → N/A
// pa-manual-comp-01: ✓  classificationMethod absent → implies = true
// ═════════════════════════════════════════════════════════════════════════════
Instance:   physical-activity-minutes-moderate-aggregate-example
InstanceOf: at-prenudge-physical-activity-minutes-observation
Usage:      #example
Title:      "Physical Activity Minutes O - (c) Moderate + Weighted Aggregate (Manual, pa-agg-02 warning)"
Description: """Scenario (c): component[moderateActivity] and component[aggregateActivityWeighted] present;
vigorousActivity and the plain aggregateActivity are absent (vigorous implicitly 0).
aggregateActivityWeighted = moderateActivity + (0 × 2) = 90 min/wk. pa-agg-01 is satisfied;
pa-agg-02 fires a WARNING because the plain aggregateActivity was not also sent.
Typical for a structured questionnaire that reports moderate-intensity activity
separately and includes only the WHO/IPAQ-weighted aggregate."""

* meta.profile = "https://fhir.hl7.at/prenudge/appdata/r4/StructureDefinition/at-prenudge-physical-activity-minutes-observation"
* identifier[+]
  * system = "https://www.joanneum.at"
  * value  = "obs-pa-c-2026-03-24-001"
* status            = #final
* code              = $loinc#101691-4 "Duration of physical activity"
* subject           = Reference(Patient/example)
* effectiveDateTime = "2026-03-24T08:00:00+01:00"
* issued            = "2026-03-24T08:00:00+01:00"
* method            = $SCT#87982008 "Manual"

// moderateActivity = 90 min/wk
* component[+]
  * code                    = $loinc#77592-4 "Moderate physical activity [IPAQ]"
  * valueQuantity.value     = 90
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// aggregateActivityWeighted = 90 min/wk (= 90 + 0×2)
// SNOMED CT 68130003 "Physical activity" — see profile comment on this component.
* component[+]
  * code                    = $SCT#68130003 "Physical activity"
  * valueQuantity.value     = 90
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// vigorousActivity          : absent
// aggregateActivity (plain) : absent → pa-agg-02 WARNING (see description)
// classificationMethod      : absent — method = Manual; pa-manual-comp-01 satisfied


// ═════════════════════════════════════════════════════════════════════════════
// (d) VIGOROUS + AGGREGATE — partial wearable / automated source
//
// Source:  wearable that classifies intensity via heart-rate zones but does not
//          separately compute moderate-intensity minutes.
// Values:  vigorousActivity          = 75 min/wk
//          aggregateActivityWeighted = 150 min/wk  (= 0 + (75 × 2))
//          classificationMethod = hrz (Heart Rate Zones)
//
// pa-panel-01  : ✓  component.exists()
// pa-agg-01    : ✓  150 = 0 + (75 × 2) = 150  ✓
// pa-agg-02    : ⚠  WARNING — antecedent true (vigorousActivity present);
//                   aggregateActivity (plain) is absent → implies empty → warning
// pa-wearable-01: ✓  method = Automated AND aggregateActivityWeighted present
// pa-manual-comp-01: ✓  method = Automated → antecedent false, N/A
// ═════════════════════════════════════════════════════════════════════════════
Instance:   physical-activity-minutes-vigorous-aggregate-example
InstanceOf: at-prenudge-physical-activity-minutes-observation
Usage:      #example
Title:      "Physical Activity Minutes O - (d) Vigorous + Weighted Aggregate (Automated, HRZ, pa-agg-02 warning)"
Description: """Scenario (d): component[vigorousActivity] and component[aggregateActivityWeighted] present;
moderateActivity and the plain aggregateActivity are absent (moderate implicitly 0).
aggregateActivityWeighted = 0 + (vigorousActivity × 2) = 150 min/wk. pa-agg-01 is satisfied;
pa-agg-02 fires a WARNING because the plain aggregateActivity was not also sent.
classificationMethod = hrz (Heart Rate Zones, moderate 50–70% HRmax; vigorous >70% HRmax).
Typical for a wearable that identifies only vigorous bouts via heart rate but does not
separately count moderate bouts."""

* meta.profile = "https://fhir.hl7.at/prenudge/appdata/r4/StructureDefinition/at-prenudge-physical-activity-minutes-observation"
* identifier[+]
  * system = "https://www.joanneum.at"
  * value  = "obs-pa-d-2026-03-24-001"
* status            = #final
* code              = $loinc#101691-4 "Duration of physical activity"
* subject           = Reference(Patient/example)
* effectiveDateTime = "2026-03-24T08:00:00+01:00"
* issued            = "2026-03-24T08:00:00+01:00"
* method            = $SCT#8359006 "Automated"
* device            = Reference(Device/device-wearable-example)

// vigorousActivity = 75 min/wk
// Vigorous ×2 weighting (WHO/IPAQ): 1 min vigorous ≡ 2 min moderate-equivalent.
* component[+]
  * code                    = $loinc#77593-2 "Vigorous physical activity [IPAQ]"
  * valueQuantity.value     = 75
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// aggregateActivityWeighted = 0 + (75 × 2) = 150 min/wk
// SNOMED CT 68130003 "Physical activity" — see profile comment on this component.
* component[+]
  * code                    = $SCT#68130003 "Physical activity"
  * valueQuantity.value     = 150
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// classificationMethod = hrz (Heart Rate Zones)
// Follows mealContext pattern from at-prenudge-bloodglucose-observation.fsh:
//   component code = SCT 246501002 "Technique"; value = CodeableConcept.
// Automated source → any classificationMethod code is permitted (pa-manual-comp-01 N/A).
* component[+]
  * code                        = $SCT#246501002 "Technique"
  * valueCodeableConcept        = $classCS#hrz "Heart Rate Zones"

// moderateActivity          : absent (wearable did not compute moderate bouts separately)
// aggregateActivity (plain) : absent → pa-agg-02 WARNING (see description)


// ═════════════════════════════════════════════════════════════════════════════
// (e) MODERATE + VIGOROUS + WEIGHTED AGGREGATE — full wearable / automated source
//
// Source:  wearable with full MET-based activity classification; sender only
//          computes the WHO/IPAQ-weighted aggregate (see scenario (g) for both).
// Values:  moderateActivity          = 120 min/wk
//          vigorousActivity          =  60 min/wk
//          aggregateActivityWeighted = 240 min/wk  (= 120 + (60 × 2))
//          classificationMethod = met-cal (MET Value Calculated)
//
// pa-panel-01  : ✓  component.exists()
// pa-agg-01    : ✓  240 = 120 + (60 × 2) = 240  ✓
// pa-agg-02    : ⚠  WARNING — antecedent true (moderate and vigorous present);
//                   aggregateActivity (plain) is absent → implies empty → warning
// pa-wearable-01: ✓  method = Automated AND aggregateActivityWeighted present
// pa-manual-comp-01: ✓  method = Automated → antecedent false, N/A
// ═════════════════════════════════════════════════════════════════════════════
Instance:   physical-activity-minutes-all-components-example
InstanceOf: at-prenudge-physical-activity-minutes-observation
Usage:      #example
Title:      "Physical Activity Minutes O - (e) Moderate + Vigorous + Weighted Aggregate (Automated, MET-Cal, pa-agg-02 warning)"
Description: """Scenario (e): moderateActivity, vigorousActivity and aggregateActivityWeighted
are present; the plain aggregateActivity is absent.
moderateActivity = 120 min/wk, vigorousActivity = 60 min/wk,
aggregateActivityWeighted = 120 + (60 × 2) = 240 min/wk.
classificationMethod = met-cal (MET estimated from accelerometer / VO2 proxy).
pa-agg-01 is satisfied; pa-agg-02 fires a WARNING because the plain aggregateActivity
was not also sent. Produced by a wearable pipeline that computes both intensity
levels and only the WHO/IPAQ weighted aggregate — see scenario (g) for a pipeline
that also sends the plain aggregate."""

* meta.profile = "https://fhir.hl7.at/prenudge/appdata/r4/StructureDefinition/at-prenudge-physical-activity-minutes-observation"
* identifier[+]
  * system = "https://www.joanneum.at"
  * value  = "obs-pa-e-2026-03-24-001"
* status            = #final
* code              = $loinc#101691-4 "Duration of physical activity"
* subject           = Reference(Patient/example)
* effectiveDateTime = "2026-03-24T08:00:00+01:00"
* issued            = "2026-03-24T08:00:00+01:00"
* method            = $SCT#8359006 "Automated"
* device            = Reference(Device/device-wearable-example)

// moderateActivity = 120 min/wk
* component[+]
  * code                    = $loinc#77592-4 "Moderate physical activity [IPAQ]"
  * valueQuantity.value     = 120
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// vigorousActivity = 60 min/wk
// Vigorous ×2 weighting (WHO/IPAQ): 1 min vigorous ≡ 2 min moderate-equivalent.
* component[+]
  * code                    = $loinc#77593-2 "Vigorous physical activity [IPAQ]"
  * valueQuantity.value     = 60
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// aggregateActivityWeighted = 120 + (60 × 2) = 240 min/wk
// SNOMED CT 68130003 "Physical activity" — see profile comment on this component.
* component[+]
  * code                    = $SCT#68130003 "Physical activity"
  * valueQuantity.value     = 240
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// classificationMethod = met-cal (MET Value Calculated from raw sensor data)
// Automated source → all classificationMethod codes permitted (pa-manual-comp-01 N/A).
* component[+]
  * code                    = $SCT#246501002 "Technique"
  * valueCodeableConcept    = $classCS#met-cal "MET Value Calculated"

// aggregateActivity (plain) : absent → pa-agg-02 WARNING (see description)


// ═════════════════════════════════════════════════════════════════════════════
// (f) EHIS-PAQ Q7 MAPPED — aggregate only; derivedFrom QuestionnaireResponse
//
// Source:  PhysicalActivityMinutesQtoO StructureMap
//          applied to physical-activity-ehispaq-response-example (Q7 = 2h30min).
// Values:  aggregateActivity (plain) = 150 min/wk  (= (2 × 60) + 30)
//
// Mapping formula:
//   Questionnaire calculatedExpression on Q7-total-minutes computes
//   (Q7-hours × 60) + Q7-minutes = (2 × 60) + 30 = 150 min/wk.
//   PhysicalActivityMinutesQtoO reads Q7-total-minutes directly (no evaluate()).
// No intensity weighting applied — Q7 reports total leisure time, not
// intensity-split data, so the value is mapped to the plain aggregateActivity
// (LOINC 101691-4), not aggregateActivityWeighted: the ×2 WHO/IPAQ weighting
// is only meaningful — and only ever applied by the map — when separate moderate
// and vigorous durations are known (scenarios d, e and g).
// aggregateActivityWeighted is not populated by the StructureMap; a receiving
// system may copy aggregateActivity's value into it post-transform if it needs
// that component too, since no distinct weighted formula applies here.
//
// pa-panel-01  : ✓  aggregateActivity present
// pa-agg-01    : ✓  antecedent false → implies = true; passes silently
// pa-agg-02    : ✓  same antecedent false → passes silently
// pa-wearable-01: ✓  method = Manual → N/A
// pa-manual-comp-01: ✓  classificationMethod absent → implies = true
// ═════════════════════════════════════════════════════════════════════════════
Instance:   physical-activity-minutes-ehispaq-q7-mapped-example
InstanceOf: at-prenudge-physical-activity-minutes-observation
Usage:      #example
Title:      "Physical Activity Minutes O - (f) EHIS-PAQ/ATHIS Q7/PE7 Mapped (Aggregate Only)"
Description: """Scenario (f): Observation produced by applying
PhysicalActivityMinutesQtoO to
physical-activity-ehispaq-response-example.
Q7/PE7 answer: 2 Stunden + 30 Minuten → aggregateActivity (plain) = (2×60)+30 = 150 min/wk.
No intensity weighting is applied because Q7 does not separate moderate from
vigorous activity, so the value goes on the plain aggregateActivity component
rather than aggregateActivityWeighted.  derivedFrom links back to the source
QuestionnaireResponse.  classificationMethod is absent; pa-manual-comp-01 is
satisfied by absence."""

* meta.profile = "https://fhir.hl7.at/prenudge/appdata/r4/StructureDefinition/at-prenudge-physical-activity-minutes-observation"
* identifier[+]
  * system = "https://www.joanneum.at"
  * value  = "obs-pa-f-2026-03-24-001"
* status            = #final
* code              = $loinc#101691-4 "Duration of physical activity"
* subject           = Reference(Patient/example)
* effectiveDateTime = "2026-03-24T08:00:00+01:00"
* issued            = "2026-03-24T08:00:00+01:00"
* method            = $SCT#87982008 "Manual"
* derivedFrom[+]    = Reference(QuestionnaireResponse/physical-activity-ehispaq-response-example)

// aggregateActivity (plain) = 150 min/wk
// Read from Q7-total-minutes (calculatedExpression result): (2×60)+30 = 150.
// LOINC 101691-4 reused at component level — see profile collision comment.
* component[+]
  * code                    = $loinc#101691-4 "Duration of physical activity"
  * valueQuantity.value     = 150
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// moderateActivity          : absent — Q7 does not separate intensity levels
// vigorousActivity          : absent — Q7 does not separate intensity levels
// aggregateActivityWeighted : absent — antecedent false, pa-agg-01 N/A
// classificationMethod      : absent — method = Manual; pa-manual-comp-01 satisfied by absence
//   (StructureMap does not set classificationMethod; consuming system may add
//    self-rp post-transform if explicit classification documentation is required)


// ═════════════════════════════════════════════════════════════════════════════
// (g) ALL COMPONENTS, BOTH AGGREGATES — full wearable / automated source
//
// Source:  wearable with full MET-based activity classification that computes
//          both aggregate flavors: the plain sum and the WHO/IPAQ weighted sum.
// Values:  moderateActivity          = 120 min/wk
//          vigorousActivity          =  60 min/wk
//          aggregateActivity         = 180 min/wk  (= 120 + 60, unweighted)
//          aggregateActivityWeighted = 240 min/wk  (= 120 + (60 × 2))
//          classificationMethod = met-cal (MET Value Calculated)
//
// pa-panel-01  : ✓  component.exists()
// pa-agg-01    : ✓  240 = 120 + (60 × 2) = 240  ✓
// pa-agg-02    : ✓  180 = 120 + 60 = 180  ✓
// pa-wearable-01: ✓  method = Automated AND aggregateActivityWeighted present
// pa-manual-comp-01: ✓  method = Automated → antecedent false, N/A
// ═════════════════════════════════════════════════════════════════════════════
Instance:   physical-activity-minutes-both-aggregates-example
InstanceOf: at-prenudge-physical-activity-minutes-observation
Usage:      #example
Title:      "Physical Activity Minutes O - (g) Both Aggregates (Automated, MET-Cal)"
Description: """Scenario (g): moderateActivity, vigorousActivity and BOTH aggregate
components are present. moderateActivity = 120 min/wk, vigorousActivity = 60 min/wk;
aggregateActivity (plain) = 120 + 60 = 180 min/wk; aggregateActivityWeighted =
120 + (60 × 2) = 240 min/wk. classificationMethod = met-cal (MET estimated from
accelerometer / VO2 proxy). pa-agg-01 and pa-agg-02 are both satisfied — the richest
Observation variant, produced by a wearable pipeline that reports the raw combined
minutes alongside the WHO/IPAQ moderate-equivalent aggregate for consumers that
need either figure."""

* meta.profile = "https://fhir.hl7.at/prenudge/appdata/r4/StructureDefinition/at-prenudge-physical-activity-minutes-observation"
* identifier[+]
  * system = "https://www.joanneum.at"
  * value  = "obs-pa-g-2026-03-24-001"
* status            = #final
* code              = $loinc#101691-4 "Duration of physical activity"
* subject           = Reference(Patient/example)
* effectiveDateTime = "2026-03-24T08:00:00+01:00"
* issued            = "2026-03-24T08:00:00+01:00"
* method            = $SCT#8359006 "Automated"
* device            = Reference(Device/device-wearable-example)

// moderateActivity = 120 min/wk
* component[+]
  * code                    = $loinc#77592-4 "Moderate physical activity [IPAQ]"
  * valueQuantity.value     = 120
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// vigorousActivity = 60 min/wk
* component[+]
  * code                    = $loinc#77593-2 "Vigorous physical activity [IPAQ]"
  * valueQuantity.value     = 60
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// aggregateActivity (plain) = 120 + 60 = 180 min/wk — no ×2 vigorous weighting.
// LOINC 101691-4 reused at component level — see profile collision comment.
* component[+]
  * code                    = $loinc#101691-4 "Duration of physical activity"
  * valueQuantity.value     = 180
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// aggregateActivityWeighted = 120 + (60 × 2) = 240 min/wk
// SNOMED CT 68130003 "Physical activity" — see profile comment on this component.
* component[+]
  * code                    = $SCT#68130003 "Physical activity"
  * valueQuantity.value     = 240
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// classificationMethod = met-cal (MET Value Calculated from raw sensor data)
// Automated source → all classificationMethod codes permitted (pa-manual-comp-01 N/A).
* component[+]
  * code                    = $SCT#246501002 "Technique"
  * valueCodeableConcept    = $classCS#met-cal "MET Value Calculated"
