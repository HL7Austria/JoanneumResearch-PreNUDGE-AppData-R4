Alias: $athis = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers

Instance: nutrition-fruitvegetable-response-daily-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Nutrition Fruit & Veg Q - Daily Eater Example"
Description: "Example response for a daily fruit and vegetable eater: fruit daily (DH1), 3 portions of fruit (DH2), vegetables daily (DH3), 2 portions of vegetables (DH4)."

* questionnaire = Canonical(NutritionFruitVegetableQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-06-01T09:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-nut-fv-2026-06-01-001"

* item[+]
  * linkId = "DH1"
  * text = "Zunächst geht es um Obst, das können frische oder gefrorene, getrocknete oder pürierte Früchte sein. Nicht gemeint sind Obstsäfte.\n\nDH1 - Wie oft essen Sie Obst?"
  * answer[+]
    * valueCoding = $athis#diet-daily-or-more "Täglich oder mehrmals täglich"
    * item[+]
      * linkId = "DH1-comment"
      * answer[+].valueString = "Esse jeden Morgen Obst zum Frühstück."

* item[+]
  * linkId = "DH2"
  * text = "DH2: Wie viele Portionen Obst essen Sie pro Tag? Eine Portion entspricht einer Handvoll Obst.\n\nEine Handvoll Obst kann sein:\n- 1 Apfel, 1 Banane, 1 Pfirsich, 2 Zwetschken, 2 Mandarinen, 2 Kiwis, 3 Marillen, 7 Erdbeeren, eine halbe Grapefruit\n- drei große Löffel ungezuckerter Obstsalat\n- bei halben Portionen aufrunden."
  * answer[+]
    * valueInteger = 3
    * item[+]
      * linkId = "DH2-comment"
      * answer[+].valueString = "Apfel, Banane und Beeren täglich."

* item[+]
  * linkId = "DH3"
  * text = "Und nun zum Gemüse, das kann frisch oder gefroren, roh oder gekocht sein. Kartoffeln, Gemüsesäfte oder Gemüsesuppen zählen nicht dazu.\n\nDH3: Wie oft essen Sie Gemüse oder Salat?"
  * answer[+]
    * valueCoding = $athis#diet-daily-or-more "Täglich oder mehrmals täglich"
    * item[+]
      * linkId = "DH3-comment"
      * answer[+].valueString = "Salat zum Mittagessen, Gemüse zum Abendessen."

* item[+]
  * linkId = "DH4"
  * text = "DH4: Wie viele Portionen Gemüse oder Salat essen Sie pro Tag? Eine Portion entspricht einer Handvoll Gemüse oder Salat.\n\nEine Handvoll Gemüse oder Salat kann sein:\n- 2 Brokkoli-Stämme, 8 Karfiol-Rosen, 4 gehäufte Suppenlöffel Kraut oder Spinat\n- 3 gehäufte Suppenlöffel gedünstetes Gemüse\n- ein mittlerer Paradeiser, ein 5 cm großes Stück Gurke\n- bei halben Portionen aufrunden."
  * answer[+]
    * valueInteger = 2
    * item[+]
      * linkId = "DH4-comment"
      * answer[+].valueString = "Meist Salat und gedünstetes Gemüse."

Instance: nutrition-fruitvegetable-response-nondaily-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Nutrition Fruit & Veg Q - Non-Daily Eater Example"
Description: "Example response for a non-daily fruit and vegetable eater: fruit 4–6 times per week (DH1, DH2 not enabled), vegetables 1–3 times per week (DH3, DH4 not enabled)."

* questionnaire = Canonical(NutritionFruitVegetableQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-06-02T09:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-nut-fv-2026-06-02-001"

* item[+]
  * linkId = "DH1"
  * text = "Zunächst geht es um Obst, das können frische oder gefrorene, getrocknete oder pürierte Früchte sein. Nicht gemeint sind Obstsäfte.\n\nDH1 - Wie oft essen Sie Obst?"
  * answer[+]
    * valueCoding = $athis#diet-4-6-per-week "4 bis 6 Mal pro Woche"
    * item[+]
      * linkId = "DH1-comment"
      * answer[+].valueString = "Esse Obst meistens, aber nicht jeden Tag."

* item[+]
  * linkId = "DH3"
  * text = "Und nun zum Gemüse, das kann frisch oder gefroren, roh oder gekocht sein. Kartoffeln, Gemüsesäfte oder Gemüsesuppen zählen nicht dazu.\n\nDH3: Wie oft essen Sie Gemüse oder Salat?"
  * answer[+]
    * valueCoding = $athis#diet-1-3-per-week "1 bis 3 Mal pro Woche"
    * item[+]
      * linkId = "DH3-comment"
      * answer[+].valueString = "Gemüse hauptsächlich am Wochenende."
