// Two Observation instances demonstrating both valid sources for
// AtPrenudgeObservationMuscleStrengthening:
//
//   (a) Questionnaire-derived — method = Manual; derivedFrom QuestionnaireResponse B
//   (b) Wearable-derived      — method = Automated; device reference
//
// Pattern follows at-prenudge-sleep-duration-observation-examples.fsh exactly.

Alias: $SCT  = http://snomed.info/sct
Alias: $loinc = http://loinc.org

// ─────────────────────────────────────────────────────────────────────────────
// (a) QUESTIONNAIRE-DERIVED — method = Manual
//
// Source: MuscleStrengtheningQuantityQuestionnaire response (3 sessions/wk).
// StructureMap MuscleStrengtheningQuestionnaireResponseToObservation applied.
//
// Invariant: muscle-strengthening-range ✓  (3 is between 0 and 7)
// ─────────────────────────────────────────────────────────────────────────────
Instance: muscle-strengthening-questionnaire-derived-example
InstanceOf: AtPrenudgeObservationMuscleStrengthening
Usage: #example
Title: "Muscle Strengthening Sessions O mapped from Q - Example"
Description: "Example of a self-reported muscle strengthening sessions count (3 sessions per week) derived from MuscleStrengtheningQuantityQuestionnaire."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-ms-2026-06-01-001"
* status = #final
* code = $loinc#82291-6 "Frequency of muscle-strengthening physical activity"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-01T10:00:00+02:00"
* issued = "2026-06-01T10:00:00+02:00"
* method = $SCT#87982008 "Manual"
* valueQuantity
  * value = 3
  * unit = "{sessions}/wk"
  * system = "http://unitsofmeasure.org"
  * code = #{sessions}/wk
* note[+].text = "Selbstberichtet. Krafttraining Montag, Mittwoch, Freitag."
* derivedFrom = Reference(QuestionnaireResponse/muscle-strengthening-quantity-response-example)


// ─────────────────────────────────────────────────────────────────────────────
// (b) WEARABLE-DERIVED — method = Automated
//
// Source: fitness tracker detecting strength-training sessions automatically.
//
// Invariant: muscle-strengthening-range ✓  (5 is between 0 and 7)
// ─────────────────────────────────────────────────────────────────────────────
Instance: muscle-strengthening-wearable-derived-example
InstanceOf: AtPrenudgeObservationMuscleStrengthening
Usage: #example
Title: "Muscle Strengthening Sessions O - Wearable Automated Example"
Description: "Example of an automatically detected muscle strengthening sessions count (5 sessions per week) measured by a wearable fitness tracker."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-ms-2026-06-01-002"
* status = #final
* code = $loinc#82291-6 "Frequency of muscle-strengthening physical activity"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-01T10:00:00+02:00"
* issued = "2026-06-01T10:00:00+02:00"
* method = $SCT#8359006 "Automated"
* device = Reference(Device/device-wearable-example)
* valueQuantity
  * value = 5
  * unit = "{sessions}/wk"
  * system = "http://unitsofmeasure.org"
  * code = #{sessions}/wk
* note[+].text = "Automatisch vom Wearable erkannte Krafttrainings-Einheiten."


// ─────────────────────────────────────────────────────────────────────────────
// (c) EHIS-PAQ Q8 / ATHIS PE8 DERIVED — method = Manual
//
// Source: muscle-strengthening-ehis-paq-response-example (3 Tage pro Woche).
// StructureMap MuscleStrengtheningEhisPaqQuestionnaireResponseToObservation applied.
// activity-3-days → 3 {sessions}/wk
//
// Invariant: muscle-strengthening-range ✓  (3 >= 0)
// ─────────────────────────────────────────────────────────────────────────────
Instance: muscle-strengthening-ehis-paq-derived-example
InstanceOf: AtPrenudgeObservationMuscleStrengthening
Usage: #example
Title: "Muscle Strengthening Sessions O mapped from EHIS-PAQ Q8 / ATHIS PE8 - Example"
Description: "Example of a self-reported muscle strengthening sessions count (3 sessions per week) derived from EhisPaqMuscleStrengtheningQuestionnaire via MuscleStrengtheningEhisPaqQuestionnaireResponseToObservation. ATHIS code activity-3-days is translated to the numeric value 3."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-ms-ehis-2026-06-01-001"
* status = #final
* code = $loinc#82291-6 "Frequency of muscle-strengthening physical activity"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-01T10:00:00+02:00"
* issued = "2026-06-01T10:00:00+02:00"
* method = $SCT#87982008 "Manual"
* valueQuantity
  * value = 3
  * unit = "{sessions}/wk"
  * system = "http://unitsofmeasure.org"
  * code = #{sessions}/wk
* note[+].text = "Selbstberichtet. Krafttraining Montag, Mittwoch, Freitag."
* derivedFrom = Reference(QuestionnaireResponse/muscle-strengthening-ehis-paq-response-example)
