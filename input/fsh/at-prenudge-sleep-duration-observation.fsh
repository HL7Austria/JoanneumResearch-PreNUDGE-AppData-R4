Profile: AtPrenudgeObservationSleepDuration
Parent: AtPrenudgeObservation
Id: at-prenudge-sleep-duration-observation
Title: "AT PreNUDGE Observation Sleep Duration"
Description: "This FHIR profile defines the Sleep Duration Observation recording average nightly sleep in hours. Applicable for both automated wearable measurements (method = automated) and self-reported values derived from a questionnaire (method = manual)."

* code = http://loinc.org#93832-4 "Sleep duration"

* value[x] 1..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.unit = "h"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #h

* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this observation was derived"

* obeys sleep-duration-range

Invariant: sleep-duration-range
Severity: #error
Description: "Sleep duration must be between 0 and 24 hours."
Expression: "value.ofType(Quantity).value >= 0 and value.ofType(Quantity).value <= 24"
