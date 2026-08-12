Instance: nutrition-vegetableportions-normal-example
InstanceOf: AtPrenudgeObservationNutritionVegetablePortions
Usage: #example
Title: "Nutrition Vegetable Portions O mapped from Q - Normal Example"
Description: "Example of 2 daily vegetable and salad portions, derived from a questionnaire response (daily eater, DH4 = 2)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-nut-fv-2026-06-01-001"
* status = #final
* code = http://loinc.org#80459-1 "Vegetable servings 24 hour Estimated"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-01"
* issued = "2026-06-01T09:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 2
  * unit = "Portionen"
  * system = "http://unitsofmeasure.org"
  * code = #{serving}
* note[+].text = "Selbstberichtet: täglich 2 Portionen Gemüse oder Salat."
* derivedFrom = Reference(QuestionnaireResponse/nutrition-fruitvegetable-response-daily-example)

Instance: nutrition-vegetableportions-high-example
InstanceOf: AtPrenudgeObservationNutritionVegetablePortions
Usage: #example
Title: "Nutrition Vegetable Portions O mapped from Q - High Intake Example"
Description: "Example of 4 daily vegetable and salad portions, indicating high vegetable intake."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-nut-vp-2026-06-02-001"
* status = #final
* code = http://loinc.org#80459-1 "Vegetable servings 24 hour Estimated"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-02"
* issued = "2026-06-02T09:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 4
  * unit = "Portionen"
  * system = "http://unitsofmeasure.org"
  * code = #{serving}
* note[+].text = "Selbstberichtet: hoher Gemüsekonsum, 4 Portionen täglich."

Instance: nutrition-vegetableportions-not-stated-example
InstanceOf: AtPrenudgeObservationNutritionVegetablePortions
Usage: #example
Title: "Nutrition Vegetable Portions O mapped from Q - Not Stated Example"
Description: "Example derived from the universal ATHIS answer 'Keine Angabe' to DH3."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-nut-fv-2026-06-03-metadata"
* status = #final
* code = http://loinc.org#80459-1 "Vegetable servings 24 hour Estimated"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-03"
* issued = "2026-06-03T09:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* dataAbsentReason = http://terminology.hl7.org/CodeSystem/data-absent-reason#asked-declined "Asked But Declined"
* derivedFrom = Reference(QuestionnaireResponse/nutrition-fruitvegetable-response-metadata-example)
