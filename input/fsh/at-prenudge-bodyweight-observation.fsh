Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

Profile: AtPrenudgeObservationBodyWeight
Parent: AtPrenudgeObservation
Id: at-prenudge-bodyweight-observation
Title: "AT PreNUDGE Observation Body Weight"
Description: "This FHIR profile defines a body weight Observation based on the FHIR R4 Vital Signs body weight concept. Body weight is represented using LOINC 29463-7 and UCUM kg."

* category 1..*
* category = $observation-category#vital-signs "Vital Signs"

* code = http://loinc.org#29463-7 "Body weight"

* value[x] 0..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.unit = "kg"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #kg

* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this observation was derived"

* obeys body-weight-range

Invariant: body-weight-range
Severity: #error
Description: "Body weight must be between 20 and 300 kg."
Expression: "value.empty() or (value.ofType(Quantity).value >= 20 and value.ofType(Quantity).value <= 300)"