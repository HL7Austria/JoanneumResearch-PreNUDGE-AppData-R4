Instance: nutrition-fruitportions-normal-example
InstanceOf: AtPrenudgeObservationNutritionFruitPortions
Usage: #example
Title: "Nutrition Fruit Portions O mapped from Q - Normal Example"
Description: "Example of 3 daily fruit portions, derived from a questionnaire response (daily eater, DH2 = 3)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-nut-fv-2026-06-01-001"
* status = #final
* code = http://loinc.org#80457-5 "Fruit servings 24 hour Estimated"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-01"
* issued = "2026-06-01T09:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 3
  * unit = "Portionen"
  * system = "http://unitsofmeasure.org"
  * code = #{serving}
* note[+].text = "Selbstberichtet: täglich 3 Portionen Obst."
* derivedFrom = Reference(QuestionnaireResponse/nutrition-fruitvegetable-response-daily-example)

Instance: nutrition-fruitportions-high-example
InstanceOf: AtPrenudgeObservationNutritionFruitPortions
Usage: #example
Title: "Nutrition Fruit Portions O mapped from Q - High Intake Example"
Description: "Example of 5 daily fruit portions, indicating high fruit intake."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-nut-fp-2026-06-02-001"
* status = #final
* code = http://loinc.org#80457-5 "Fruit servings 24 hour Estimated"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-02"
* issued = "2026-06-02T09:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 5
  * unit = "Portionen"
  * system = "http://unitsofmeasure.org"
  * code = #{serving}
* note[+].text = "Selbstberichtet: hoher Obstkonsum, 5 Portionen täglich."
