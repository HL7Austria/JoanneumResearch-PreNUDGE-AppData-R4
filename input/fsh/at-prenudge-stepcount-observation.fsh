Profile: AtPrenudgeObservationStepCount
Parent: AtPrenudgeObservation
Id: at-prenudge-stepcount-observation
Title: "AT PreNUDGE Observation Step Count"
Description: "This FHIR profile is defining the Step Count Observation. The step count only allows values inbetween 0 and 150,000 steps per 24 hours."

* code = http://loinc.org#41950-7 "Number of steps in 24 hour Measured"

* value[x] 1..1 MS
* value[x] only Quantity
* valueQuantity.value 1..1 MS
* valueQuantity.unit = "{steps}/d"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #{steps}/d

* obeys stepcount-range

Invariant: stepcount-range
Severity: #error
Description: "Step count must be inbetween 0 and 150,000."
Expression: "value.ofType(Quantity).value >= 0 and value.ofType(Quantity).value <= 150000"
