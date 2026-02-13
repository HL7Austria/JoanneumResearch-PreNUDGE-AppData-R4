Profile: AtPrenudgeObservationBloodGlucose
Parent: AtPrenudgeObservation
Id: at-prenudge-bloodglucose-observation
Title: "AT PreNUDGE Observation Blood Glucose (only in mg/dL)"
Description: "This FHIR profile is defining the Blood Glucose Observation, similar to the Observation Social History - Alcohol Use from the IPS. The blood glucose option only allowes values inbetween 12 and 1200 mg/dL."

* code = http://loinc.org#1556-0 "Fasting glucose [Mass/volume] in Capillary blood"
* valueInteger 1..1
* obeys bloodglucose-range

Invariant: bloodglucose-range
Severity: #error
Description: "Blood glucose must be inbetween 12 and 1200 mg/dL."
Expression: "valueInteger >= 12 and valueInteger <= 1200"