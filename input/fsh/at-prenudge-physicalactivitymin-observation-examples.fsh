// Six Observation instances covering every valid component combination
// described in the at-prenudge-physicalactivitymin-observation profile:
//
//   (a) aggregate only           — questionnaire / manual source
//   (b) moderate only            — manual; aggregate absent → pa-agg-01 WARNING
//   (c) moderate + aggregate     — manual; vigorous implicitly 0
//   (d) vigorous + aggregate     — partial wearable (automated)
//   (e) all three                — full wearable (automated)
//   (f) EHIS-PAQ Q7 mapped       — aggregate only; derivedFrom QR example
//
// Invariant evaluation summary per instance — see inline comments.
// Instances are self-contained; no dependency on other example files.

Alias: $loinc   = http://loinc.org
Alias: $SCT     = http://snomed.info/sct
Alias: $classCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-physical-activity-classification-method-cs

// ═════════════════════════════════════════════════════════════════════════════
// (a) AGGREGATE ONLY — manual / questionnaire source
//
// Source:  any self-report that provides only a total activity figure.
// Values:  aggregateActivity = 200 min/wk
//
// pa-panel-01  : ✓  component.exists() — aggregateActivity present
// pa-agg-01    : ✓  antecedent (moderateActivity.exists() or vigorousActivity.exists()) = false
//                   → implies = true; invariant passes silently, no warning
// pa-wearable-01: ✓  method = Manual (SCT 87982008) → antecedent false, N/A
// pa-manual-comp-01: ✓  classificationMethod absent → implies = true
// ═════════════════════════════════════════════════════════════════════════════
Instance:   physical-activity-minutes-aggregate-only-example
InstanceOf: at-prenudge-physical-activity-minutes-observation
Usage:      #example
Title:      "Physical Activity Minutes O - (a) Aggregate Only (Manual)"
Description: """Scenario (a): only component[aggregateActivity] is present.
Typical for a questionnaire-derived observation that asks only for total activity
time without splitting moderate and vigorous.  pa-agg-01 passes silently because
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

// aggregateActivity = 200 min/wk (total self-reported leisure time)
// LOINC 101691-4 reused at component level — see profile collision comment.
* component[+]
  * code                    = $loinc#101691-4 "Duration of physical activity"
  * valueQuantity.value     = 200
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// moderateActivity     : absent (not reported)
// vigorousActivity     : absent (not reported)
// classificationMethod : absent — method = Manual; pa-manual-comp-01 satisfied


// ═════════════════════════════════════════════════════════════════════════════
// (b) MODERATE ONLY — manual source, aggregate absent → pa-agg-01 WARNING
//
// Source:  questionnaire or self-report capturing moderate activity only;
//          vigorous = implicitly 0.
// Values:  moderateActivity = 150 min/wk
//
// pa-panel-01  : ✓  component.exists() — moderateActivity present
// pa-agg-01    : ⚠  WARNING — antecedent true (moderateActivity present);
//                   consequent checks aggregateActivity.value = 150 + (0×2) = 150
//                   but aggregateActivity is absent → LHS empty → implies empty
//                   → severity #warning fires; aggregate should be added
// pa-wearable-01: ✓  method = Manual → antecedent false, N/A
// pa-manual-comp-01: ✓  classificationMethod absent → implies = true
// ═════════════════════════════════════════════════════════════════════════════
Instance:   physical-activity-minutes-moderate-only-example
InstanceOf: at-prenudge-physical-activity-minutes-observation
Usage:      #example
Title:      "Physical Activity Minutes O - (b) Moderate Only (Manual, pa-agg-01 warning)"
Description: """Scenario (b): only component[moderateActivity] is present; aggregate absent.
pa-agg-01 fires a WARNING because moderateActivity is present but aggregateActivity
is not.  The aggregate should equal moderateActivity + (0 × 2) = 150 min/wk;
a sender should add component[aggregateActivity] = 150 min/wk to suppress the warning.
This scenario may arise when a source captures moderate activity but omits the aggregate."""

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

// aggregateActivity    : absent → pa-agg-01 WARNING (see description)
// vigorousActivity     : absent
// classificationMethod : absent — method = Manual; pa-manual-comp-01 satisfied


// ═════════════════════════════════════════════════════════════════════════════
// (c) MODERATE + AGGREGATE — manual source, vigorous implicitly 0
//
// Source:  questionnaire that reports moderate activity; sender derives aggregate.
// Values:  moderateActivity = 90 min/wk
//          aggregateActivity = 90 min/wk  (= 90 + (0 × 2))
//
// pa-panel-01  : ✓  component.exists()
// pa-agg-01    : ✓  90 = 90 + (0 × 2) = 90  ✓
// pa-wearable-01: ✓  method = Manual → N/A
// pa-manual-comp-01: ✓  classificationMethod absent → implies = true
// ═════════════════════════════════════════════════════════════════════════════
Instance:   physical-activity-minutes-moderate-aggregate-example
InstanceOf: at-prenudge-physical-activity-minutes-observation
Usage:      #example
Title:      "Physical Activity Minutes O - (c) Moderate + Aggregate (Manual)"
Description: """Scenario (c): component[moderateActivity] and component[aggregateActivity] present;
vigorousActivity absent (implicitly 0).  aggregateActivity = moderateActivity + (0 × 2) = 90 min/wk.
pa-agg-01 is satisfied.  Typical for a structured questionnaire that reports
moderate-intensity activity separately and includes the computed aggregate."""

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

// aggregateActivity = 90 min/wk (= 90 + 0×2)
* component[+]
  * code                    = $loinc#101691-4 "Duration of physical activity"
  * valueQuantity.value     = 90
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// vigorousActivity     : absent
// classificationMethod : absent — method = Manual; pa-manual-comp-01 satisfied


// ═════════════════════════════════════════════════════════════════════════════
// (d) VIGOROUS + AGGREGATE — partial wearable / automated source
//
// Source:  wearable that classifies intensity via heart-rate zones but does not
//          separately compute moderate-intensity minutes.
// Values:  vigorousActivity  = 75 min/wk
//          aggregateActivity = 150 min/wk  (= 0 + (75 × 2))
//          classificationMethod = hrz (Heart Rate Zones)
//
// pa-panel-01  : ✓  component.exists()
// pa-agg-01    : ✓  150 = 0 + (75 × 2) = 150  ✓
// pa-wearable-01: ✓  method = Automated AND aggregateActivity present
// pa-manual-comp-01: ✓  method = Automated → antecedent false, N/A
// ═════════════════════════════════════════════════════════════════════════════
Instance:   physical-activity-minutes-vigorous-aggregate-example
InstanceOf: at-prenudge-physical-activity-minutes-observation
Usage:      #example
Title:      "Physical Activity Minutes O - (d) Vigorous + Aggregate (Automated, HRZ)"
Description: """Scenario (d): component[vigorousActivity] and component[aggregateActivity] present;
moderateActivity absent (implicitly 0).  aggregateActivity = 0 + (vigorousActivity × 2) = 150 min/wk.
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

// aggregateActivity = 0 + (75 × 2) = 150 min/wk
* component[+]
  * code                    = $loinc#101691-4 "Duration of physical activity"
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

// moderateActivity : absent (wearable did not compute moderate bouts separately)


// ═════════════════════════════════════════════════════════════════════════════
// (e) ALL THREE COMPONENTS — full wearable / automated source
//
// Source:  wearable with full MET-based activity classification.
// Values:  moderateActivity  = 120 min/wk
//          vigorousActivity  =  60 min/wk
//          aggregateActivity = 240 min/wk  (= 120 + (60 × 2))
//          classificationMethod = met-cal (MET Value Calculated)
//
// pa-panel-01  : ✓  component.exists()
// pa-agg-01    : ✓  240 = 120 + (60 × 2) = 240  ✓
// pa-wearable-01: ✓  method = Automated AND aggregateActivity present
// pa-manual-comp-01: ✓  method = Automated → antecedent false, N/A
// ═════════════════════════════════════════════════════════════════════════════
Instance:   physical-activity-minutes-all-components-example
InstanceOf: at-prenudge-physical-activity-minutes-observation
Usage:      #example
Title:      "Physical Activity Minutes O - (e) All Three Components (Automated, MET-Cal)"
Description: """Scenario (e): all three Quantity components present.
moderateActivity = 120 min/wk, vigorousActivity = 60 min/wk,
aggregateActivity = 120 + (60 × 2) = 240 min/wk.
classificationMethod = met-cal (MET estimated from accelerometer / VO2 proxy).
This is the richest Observation variant, produced by a full wearable pipeline
that computes both intensity levels and the WHO/IPAQ weighted aggregate."""

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

// aggregateActivity = 120 + (60 × 2) = 240 min/wk
* component[+]
  * code                    = $loinc#101691-4 "Duration of physical activity"
  * valueQuantity.value     = 240
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// classificationMethod = met-cal (MET Value Calculated from raw sensor data)
// Automated source → all classificationMethod codes permitted (pa-manual-comp-01 N/A).
* component[+]
  * code                    = $SCT#246501002 "Technique"
  * valueCodeableConcept    = $classCS#met-cal "MET Value Calculated"


// ═════════════════════════════════════════════════════════════════════════════
// (f) EHIS-PAQ Q7 MAPPED — aggregate only; derivedFrom QuestionnaireResponse
//
// Source:  PhysicalActivityMinutesQtoO StructureMap
//          applied to physical-activity-ehispaq-response-example (Q7 = 2h30min).
// Values:  aggregateActivity = 150 min/wk  (= (2 × 60) + 30)
//
// Mapping formula (StructureMap):
//   aggregateMinutes = (Q7-hours × 60) + Q7-minutes
//                    = (2 × 60) + 30 = 150 min/wk
// No intensity weighting applied — Q7 reports total leisure time, not
// intensity-split data. The ×2 WHO/IPAQ weighting is only meaningful when
// separate moderate and vigorous durations are known (scenarios d and e).
//
// pa-panel-01  : ✓  aggregateActivity present
// pa-agg-01    : ✓  antecedent false → implies = true; passes silently
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
Q7/PE7 answer: 2 Stunden + 30 Minuten → aggregateActivity = (2×60)+30 = 150 min/wk.
No intensity weighting is applied because Q7 does not separate moderate from
vigorous activity.  derivedFrom links back to the source QuestionnaireResponse.
classificationMethod is absent; pa-manual-comp-01 is satisfied by absence."""

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

// aggregateActivity = 150 min/wk
// Derived directly from Q7: (Q7-hours × 60) + Q7-minutes = (2×60)+30 = 150.
// LOINC 101691-4 reused at component level — see profile collision comment.
* component[+]
  * code                    = $loinc#101691-4 "Duration of physical activity"
  * valueQuantity.value     = 150
  * valueQuantity.unit      = "min/wk"
  * valueQuantity.system    = "http://unitsofmeasure.org"
  * valueQuantity.code      = #min/wk

// moderateActivity     : absent — Q7 does not separate intensity levels
// vigorousActivity     : absent — Q7 does not separate intensity levels
// classificationMethod : absent — method = Manual; pa-manual-comp-01 satisfied by absence
//   (StructureMap does not set classificationMethod; consuming system may add
//    self-rp post-transform if explicit classification documentation is required)