Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

Profile: AtPrenudgeObservationBodyMassIndex
Parent: AtPrenudgeObservation
Id: at-prenudge-bmi-observation
Title: "AT PreNUDGE Observation Body Mass Index"
Description: "This FHIR profile defines a Body Mass Index (BMI) Observation based on the FHIR R4 Vital Signs BMI concept. BMI is represented using LOINC 39156-5 and UCUM kg/m2."

* category 1..*
* category = $observation-category#vital-signs "Vital Signs"

* code = http://loinc.org#39156-5 "Body mass index (BMI) [Ratio]"

* value[x] 0..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.unit = "kg/m2"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #kg/m2

* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this observation was derived"

* obeys bmi-range

Invariant: bmi-range
Severity: #error
Description: "BMI must be between 5 and 100 kg/m2."
Expression: "value.empty() or (value.ofType(Quantity).value >= 5 and value.ofType(Quantity).value <= 100)"