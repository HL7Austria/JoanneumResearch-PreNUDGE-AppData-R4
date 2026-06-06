// ==============================================================================
// Observation profile for muscle-strengthening exercise sessions per week.
//
// Observation code justification (LOINC-first, consistent with IG pattern):
//   LOINC 82291-6 "Frequency of muscle-strengthening physical activity"
//   — property NRat (numeric rate), scale Qn, unit /wk, active, member of
//   Physical Activity panel 82287-4 — directly encodes the measured concept.
//   Adjacent code 82290-8 covers aerobic frequency only; 82291-6 is the
//   correct muscle-strengthening counterpart.
//
// UCUM unit: {sessions}/wk
//   Follows the annotation-unit convention used in this IG ({steps}/d for step
//   count). "Sessions" covers both questionnaire-reported days per week (one
//   session per day assumed) and wearable-counted discrete exercise bouts.
//
// Source differentiation (follows AtPrenudgeObservationSleepDuration pattern):
//   method = SCT#87982008 "Manual"    → questionnaire-derived (Questionnaire B)
//   method = SCT#8359006  "Automated" → wearable-derived
//   method is bound (required) to the existing prenudge-observation-method VS.
//   derivedFrom → QuestionnaireResponse (questionnaire source only)
//   device      → Device reference    (wearable source only, MS)
// ==============================================================================

Profile: AtPrenudgeObservationMuscleStrengthening
Parent: AtPrenudgeObservation
Id: at-prenudge-muscle-strengthening-observation
Title: "AT PreNUDGE Observation Muscle Strengthening Sessions"
Description: "This FHIR profile defines the Muscle Strengthening Sessions Observation recording the number of muscle-strengthening exercise sessions (e.g. weight training, resistance exercises with weights, resistance bands, or bodyweight) per week. Applicable for both automated wearable measurements (method = Automated) and self-reported values derived from MuscleStrengtheningQuantityQuestionnaire (method = Manual). The value must be 0 or greater."

// LOINC 82291-6 "Frequency of muscle-strengthening physical activity"
// Active; unit /wk; Physical Activity panel 82287-4. See header comment.
* code = http://loinc.org#82291-6 "Frequency of muscle-strengthening physical activity"

* value[x] 1..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.unit = "{sessions}/wk"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #{sessions}/wk

* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this observation was derived"

* obeys muscle-strengthening-range

Invariant: muscle-strengthening-range
Severity: #error
Description: "Muscle strengthening sessions per week must be 0 or greater."
Expression: "value.ofType(Quantity).value >= 0"
