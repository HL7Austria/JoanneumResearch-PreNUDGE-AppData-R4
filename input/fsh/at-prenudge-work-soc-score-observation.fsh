Alias: $workability = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-workability

Profile: AtPrenudgeObservationWorkSocScore
Parent: AtPrenudgeObservation
Id: at-prenudge-work-soc-score-observation
Title: "AT PreNUDGE Observation Work-SoC Category Score"
Description: "This FHIR profile defines the calculated work-related sense of coherence (Work-SoC) category score observation. It contains the category scores for comprehensibility, manageability and meaningfulness as Observation components. The raw Work-SoC item answers are represented in the source QuestionnaireResponse."

* code = $workability#work-soc-category-score "Work-SoC category score"

* value[x] 0..0

* component 3..3
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #closed
* component contains
    comprehensibility 1..1 and
    manageability 1..1 and
    meaningfulness 1..1

* component[comprehensibility].code = $workability#work-soc-comprehensibility "Work-SoC comprehensibility score"
* component[comprehensibility].value[x] 1..1
* component[comprehensibility].value[x] only Quantity
* component[comprehensibility].valueQuantity ^short = "Calculated category score: (Item 1 + Item 3 + Item 6 + Item 9) / 4"

* component[manageability].code = $workability#work-soc-manageability "Work-SoC manageability score"
* component[manageability].value[x] 1..1
* component[manageability].value[x] only Quantity
* component[manageability].valueQuantity ^short = "Calculated category score: (Item 4 + Item 7) / 2"

* component[meaningfulness].code = $workability#work-soc-meaningfulness "Work-SoC meaningfulness score"
* component[meaningfulness].value[x] 1..1
* component[meaningfulness].value[x] only Quantity
* component[meaningfulness].valueQuantity ^short = "Calculated category score: (Item 2 + Item 5 + Item 8) / 3"

* derivedFrom MS
* derivedFrom ^short = "QuestionnaireResponse or other source this Work-SoC score observation was derived from"