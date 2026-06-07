// ==============================================================================
// Observation profile for sitting / resting hours per day.
//
// Observation code rationale (LOINC-first, consistent with IG pattern):
//   LOINC 87705-0 "Sedentary activity 24 hour"
//   — component Sedentary activity, property NRat, time 24H, scale Qn,
//   example units h/d. Status: TRIAL (no Active LOINC code exists for this
//   exact concept of wearable-derived daily sedentary/sitting hours).
//   Definition: lying down, sitting, or expending 1.0–1.5 METs.
//   Sleep time must be subtracted by the originating app before recording
//   the value (see documentation page and mandatory Hinweis note).
//
// UCUM unit: h (hours per day, waking sedentary time, sleep excluded)
// Range: 0..24 (enforced by invariant sitting-hours-range)
//
// Source differentiation (follows AtPrenudgeObservationSleepDuration pattern):
//   method = SCT#87982008 "Manual"    → questionnaire-derived (EHIS-PAQ Q9 / ATHIS PE9)
//   method = SCT#8359006  "Automated" → wearable-derived
//   derivedFrom → QuestionnaireResponse (questionnaire source only)
//   device      → Device reference    (wearable source only, MS)
// ==============================================================================

Alias: $loinc = http://loinc.org

Profile: AtPrenudgeObservationSittingHours
Parent: AtPrenudgeObservation
Id: at-prenudge-sitting-hours-observation
Title: "AT PreNUDGE Observation Sitting Hours"
Description: "This FHIR profile defines the Sitting Hours Observation recording the average number of sitting or resting hours per day (excluding sleep). Applicable for both automated wearable measurements (method = Automated) and self-reported values derived from EhisPaqSittingHoursQuestionnaire via SittingHoursQuestionnaireResponseToObservation (method = Manual). Sleep hours must be subtracted by the originating app before recording the value."

// LOINC 87705-0 "Sedentary activity 24 hour"
// Status TRIAL; best available LOINC code for wearable-derived daily
// sitting/sedentary hours. See header comment for rationale.
* code = $loinc#87705-0 "Sedentary activity 24 hour"

* value[x] 1..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.unit = "h"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #h

* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this observation was derived"

* obeys sitting-hours-range

Invariant: sitting-hours-range
Severity: #error
Description: "Sitting hours per day must be between 0 and 24."
Expression: "value.ofType(Quantity).value >= 0 and value.ofType(Quantity).value <= 24"
