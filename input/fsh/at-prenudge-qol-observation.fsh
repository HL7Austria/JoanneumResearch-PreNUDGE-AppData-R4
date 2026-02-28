Profile: AtPrenudgeObservationWHOQOLBrefScore
Parent: AtPrenudgeObservation
Id:  at-prenudge-whoqol-bref-score-observation
Title: " AT PreNUDGE Observation WHOQOL-BREF Score"
Description: "Observation profile for recording WHOQOL-BREF domain scores. The overall score is represented in Observation.value, individual domain scores are recorded as components."

* code = http://snomed.info/sct#405152002

* value[x] 0..0
* value[x] ^short = "Not used. All scores are represented as components."

* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this score was calculated"

* component 5..5 MS
* component ^short = "WHOQOL-BREF scores: general and four domain scores"
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #closed

* component contains
    generalized 1..1 MS and
    physical 1..1 MS and
    psychological 1..1 MS and
    relationships 1..1 MS and
    environment 1..1 MS

* component[generalized].code = http://snomed.info/sct#60132005 "Generalized"
* component[generalized].value[x] only Quantity
* component[generalized].valueQuantity.value 1..1 MS
* component[generalized].valueQuantity.unit = "score"
* component[generalized].valueQuantity.system = "http://unitsofmeasure.org"
* component[generalized].valueQuantity.code = #{score}

* component[physical].code = http://snomed.info/sct#19388002 "Physical"
* component[physical].value[x] only Quantity
* component[physical].valueQuantity.value 1..1 MS
* component[physical].valueQuantity.unit = "score"
* component[physical].valueQuantity.system = "http://unitsofmeasure.org"
* component[physical].valueQuantity.code = #{score}

* component[psychological].code = http://snomed.info/sct#60224009 "Psychologic"
* component[psychological].value[x] only Quantity
* component[psychological].valueQuantity.value 1..1 MS
* component[psychological].valueQuantity.unit = "score"
* component[psychological].valueQuantity.system = "http://unitsofmeasure.org"
* component[psychological].valueQuantity.code = #{score}

* component[relationships].code = http://snomed.info/sct#272151006 "Relationships"
* component[relationships].value[x] only Quantity
* component[relationships].valueQuantity.value 1..1 MS
* component[relationships].valueQuantity.unit = "score"
* component[relationships].valueQuantity.system = "http://unitsofmeasure.org"
* component[relationships].valueQuantity.code = #{score}

* component[environment].code = http://snomed.info/sct#276339004 "Environment"
* component[environment].value[x] only Quantity
* component[environment].valueQuantity.value 1..1 MS
* component[environment].valueQuantity.unit = "score"
* component[environment].valueQuantity.system = "http://unitsofmeasure.org"
* component[environment].valueQuantity.code = #{score}

* obeys whoqol-score-range

Invariant: whoqol-score-range
Severity: #error
Description: "All WHOQOL-BREF component score values must be between 0 and 100."
Expression: "component.value.ofType(Quantity).value.all($this >= 0 and $this <= 100)"