// Two Observation instances demonstrating both valid sources for
// AtPrenudgeObservationSittingHours:
//
//   (a) Wearable-derived      — method = Automated; device reference
//   (b) Questionnaire-derived — method = Manual; derivedFrom QR example
//
// Both examples record 6 hours 0 minutes (6.0 h) of sitting/resting per day
// (sleep excluded) on 2026-06-06. They are consistent with
// sitting-hours-ehis-paq-response-example (Q9-hours=6, Q9-minutes=0 → 6.0 h).
//
// Pattern follows at-prenudge-sleep-duration-observation-examples.fsh exactly.

Alias: $SCT   = http://snomed.info/sct
Alias: $loinc = http://loinc.org

// ─────────────────────────────────────────────────────────────────────────────
// (a) WEARABLE-DERIVED — method = Automated
//
// Source: fitness tracker / accelerometer measuring daily sedentary time.
// Sleep hours have been subtracted by the originating app as required.
//
// Invariant: sitting-hours-range ✓  (6.0 is between 0 and 24)
// ─────────────────────────────────────────────────────────────────────────────
Instance: sitting-hours-wearable-example
InstanceOf: AtPrenudgeObservationSittingHours
Usage: #example
Title: "Sitting Hours O – Wearable Automated Example"
Description: "Example of an automatically measured sitting/resting duration (6.0 h per day, sleep excluded) derived from a wearable device."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value  = "obs-sh-2026-06-06-001"
* status = #final
* code = $loinc#87705-0 "Sedentary activity 24 hour"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-06"
* issued = "2026-06-06T08:00:00+02:00"
* method = $SCT#8359006 "Automated"
* device = Reference(Device/device-wearable-example)
* valueQuantity
  * value = 6
  * unit  = "h"
  * system = "http://unitsofmeasure.org"
  * code  = #h
* note[+].text = "Automatisch vom Wearable gemessen. Schlafstunden wurden von der App vor dem Eintragen abgezogen."


// ─────────────────────────────────────────────────────────────────────────────
// (b) QUESTIONNAIRE-DERIVED — method = Manual
//
// Source: EhisPaqSittingHoursQuestionnaire response (Q9-hours=6, Q9-minutes=0).
// StructureMap SittingHoursQuestionnaireResponseToObservation applied:
//   6 + (0 / 60) = 6.0 h
//
// Invariant: sitting-hours-range ✓  (6.0 is between 0 and 24)
// ─────────────────────────────────────────────────────────────────────────────
Instance: sitting-hours-questionnaire-derived-example
InstanceOf: AtPrenudgeObservationSittingHours
Usage: #example
Title: "Sitting Hours O mapped from EHIS-PAQ Q9 / ATHIS PE9 – Example"
Description: "Example of a self-reported sitting/resting duration (6.0 h per day, sleep excluded) derived from EhisPaqSittingHoursQuestionnaire via SittingHoursQuestionnaireResponseToObservation."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value  = "obs-sh-2026-06-06-002"
* status = #final
* code = $loinc#87705-0 "Sedentary activity 24 hour"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-06T09:00:00+02:00"
* issued = "2026-06-06T09:00:00+02:00"
* method = $SCT#87982008 "Manual"
* valueQuantity
  * value = 6
  * unit  = "h"
  * system = "http://unitsofmeasure.org"
  * code  = #h
* note[+].text = "Selbstberichtet. Schlafstunden vom Befragten gemäß Fragebogenanweisung ausgeschlossen."
* derivedFrom = Reference(QuestionnaireResponse/sitting-hours-ehis-paq-response-example)
