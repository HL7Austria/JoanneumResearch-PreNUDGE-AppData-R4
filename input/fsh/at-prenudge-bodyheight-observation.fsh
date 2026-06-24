Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

Profile: AtPrenudgeObservationBodyHeight
Parent: AtPrenudgeObservation
Id: at-prenudge-bodyheight-observation
Title: "AT PreNUDGE Observation Body Height"
Description: "This FHIR profile defines a body height Observation based on the FHIR R4 Vital Signs body height concept. Body height is represented using LOINC 8302-2 and UCUM cm."

* category 1..*
* category = $observation-category#vital-signs "Vital Signs"

* code = http://loinc.org#8302-2 "Body height"

* value[x] 0..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.unit = "cm"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #cm

* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this observation was derived"

* obeys body-height-range

Invariant: body-height-range
Severity: #error
Description: "Body height must be between 50 and 250 cm."
Expression: "value.empty() or (value.ofType(Quantity).value >= 50 and value.ofType(Quantity).value <= 250)"