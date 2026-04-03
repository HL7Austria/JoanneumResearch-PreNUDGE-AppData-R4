Profile: AtPrenudgeObservationBloodGlucose
Parent: AtPrenudgeObservation
Id: at-prenudge-bloodglucose-observation
Title: "AT PreNUDGE Observation Blood Glucose (only in mg/dL)"
Description: "This FHIR profile is defining the Blood Glucose Observation, similar to the Observation Social History - Alcohol Use from the IPS. The blood glucose option only allows values inbetween 0 and 999 mg/dL."

* code = http://loinc.org#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"

* value[x] 1..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.unit = "mg/dL"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #mg/dL

* component 1..*
* component ^short = "Mandatory meal context and other component results"
* component ^slicing.discriminator[0].type = #pattern
* component ^slicing.discriminator[0].path = "code"
* component ^slicing.rules = #open
* component contains mealContext 1..1

* component[mealContext] ^sliceName = "mealContext"
* component[mealContext].code 1..1
* component[mealContext].code = http://snomed.info/sct#309602000 "Temporal periods relating to feeding and eating"

* component[mealContext].value[x] 1..1
* component[mealContext].value[x] only CodeableConcept
* component[mealContext].valueCodeableConcept from AtPrenudgeValueSetBloodglucoseMealcontextSnomedVS (required)

* obeys bloodglucose-range

Invariant: bloodglucose-range
Severity: #error
Description: "Blood glucose must be inbetween 0 and 999 mg/dL."
Expression: "value.ofType(Quantity).value >= 0 and value.ofType(Quantity).value <= 999"