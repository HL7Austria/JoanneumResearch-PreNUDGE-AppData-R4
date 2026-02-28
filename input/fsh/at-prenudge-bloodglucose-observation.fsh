Profile: AtPrenudgeObservationBloodGlucose
Parent: AtPrenudgeObservation
Id: at-prenudge-bloodglucose-observation
Title: "AT PreNUDGE Observation Blood Glucose (only in mg/dL)"
Description: "This FHIR profile is defining the Blood Glucose Observation, similar to the Observation Social History - Alcohol Use from the IPS. The blood glucose option only allowes values inbetween 12 and 1200 mg/dL."

* code = http://loinc.org#1556-0 "Fasting glucose [Mass/volume] in Capillary blood"

* value[x] 1..1 MS
* value[x] only Quantity
* valueQuantity.value 1..1 MS
* valueQuantity.unit = "mg/dL"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mg/dL

* obeys bloodglucose-range

Invariant: bloodglucose-range
Severity: #error
Description: "Blood glucose must be inbetween 12 and 1200 mg/dL."
Expression: "value.ofType(Quantity).value >= 12 and value.ofType(Quantity).value <= 1200"