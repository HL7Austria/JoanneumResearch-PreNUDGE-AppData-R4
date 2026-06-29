Alias: $athis = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers

Instance: nutrition-sugarsalty-daily-example
InstanceOf: AtPrenudgeObservationNutritionSugarSaltyFrequency
Usage: #example
Title: "Nutrition Sugar Salty Frequency O mapped from Q - Daily Example"
Description: "Example of daily consumption of sugary, fatty, and salty foods, derived from a questionnaire response (DH6 = code#1)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-nut-ss-2026-06-01-001"
* status = #final
* code = http://snomed.info/sct#364395008 "Pattern of food and drink intake (observable entity)"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-01"
* issued = "2026-06-01T09:15:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueCodeableConcept
  * coding[+] = $athis#diet-daily-or-more "Täglich oder mehrmals täglich"
* note[+].text = "Selbstberichtet: täglicher Konsum zuckerhaltiger und fettreicher Lebensmittel."
* derivedFrom = Reference(QuestionnaireResponse/nutrition-sugarsalty-response-daily-example)

Instance: nutrition-sugarsalty-rare-example
InstanceOf: AtPrenudgeObservationNutritionSugarSaltyFrequency
Usage: #example
Title: "Nutrition Sugar Salty Frequency O mapped from Q - Rare Example"
Description: "Example of less-than-once-weekly consumption of sugary, fatty, and salty foods (DH6 = code#4)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-nut-ss-2026-06-02-001"
* status = #final
* code = http://snomed.info/sct#364395008 "Pattern of food and drink intake (observable entity)"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-02"
* issued = "2026-06-02T09:15:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueCodeableConcept
  * coding[+] = $athis#diet-less-than-once-per-week "Weniger als einmal pro Woche"
* note[+].text = "Selbstberichtet: seltener Konsum zuckerhaltiger und fettreicher Lebensmittel."
* derivedFrom = Reference(QuestionnaireResponse/nutrition-sugarsalty-response-rare-example)
