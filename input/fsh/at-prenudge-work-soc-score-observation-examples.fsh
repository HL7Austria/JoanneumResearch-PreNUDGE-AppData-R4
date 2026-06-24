Alias: $workability = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-workability

Instance: work-soc-score-example
InstanceOf: AtPrenudgeObservationWorkSocScore
Usage: #example
Title: "Work-SoC Score O mapped from Q - Example"
Description: "Example of a calculated Work-SoC category score observation derived from the WorkSocQuestionnaire."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-work-soc-2026-03-20-001"
* status = #final
* code = $workability#work-soc-category-score "Work-SoC category score"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-20T09:00:00Z"
* issued = "2026-03-20T09:10:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* derivedFrom = Reference(QuestionnaireResponse/work-soc-response-example)

// Example source item values:
// Item 1 = 2, Item 2 = 5, Item 3 = 3, Item 4 = 3, Item 5 = 6,
// Item 6 = 2, Item 7 = 4, Item 8 = 4, Item 9 = 4

// Comprehensibility = (Item 1 + Item 3 + Item 6 + Item 9) / 4 = 2.75
* component[comprehensibility]
  * code = $workability#work-soc-comprehensibility "Work-SoC comprehensibility score"
  * valueQuantity
    * value = 2.75
    * unit = "score"
    * system = "http://unitsofmeasure.org"
    * code = #{score}

// Manageability = (Item 4 + Item 7) / 2 = 3.5
* component[manageability]
  * code = $workability#work-soc-manageability "Work-SoC manageability score"
  * valueQuantity
    * value = 3.5
    * unit = "score"
    * system = "http://unitsofmeasure.org"
    * code = #{score}

// Meaningfulness = (Item 2 + Item 5 + Item 8) / 3 = 5
* component[meaningfulness]
  * code = $workability#work-soc-meaningfulness "Work-SoC meaningfulness score"
  * valueQuantity
    * value = 5
    * unit = "score"
    * system = "http://unitsofmeasure.org"
    * code = #{score}