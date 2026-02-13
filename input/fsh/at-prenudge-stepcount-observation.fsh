Profile: AtPrenudgeObservationStepCount
Parent: AtPrenudgeObservation
Id: at-prenudge-stepcount-observation
Title: "AT PreNUDGE Observation Step Count"
Description: "This FHIR profile is defining the Step Count Observation, similar to the Observation Social History - Alcohol Use from the IPS. The step count option only allowes values inbetween 0 and 300 000."

* code = http://loinc.org#41950-7 "Number of steps in 24 hour Measured"
* valueInteger 1..1
* obeys stepcount-range

Invariant: stepcount-range
Severity: #error
Description: "Step count must be inbetween 0 and 300 000."
Expression: "valueInteger >= 0 and valueInteger <= 300000"