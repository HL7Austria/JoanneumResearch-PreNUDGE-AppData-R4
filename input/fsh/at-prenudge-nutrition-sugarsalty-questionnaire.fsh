Alias: $athis = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers

Instance: NutritionSugarSaltyQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/NutritionSugarSaltyQuestionnaire"
* name = "NutritionSugarSaltyQuestionnaire"
* title = "Konsumhäufigkeit fett-, zucker- und salzreicher Lebensmittel"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "Questionnaire based on ATHIS 2025 question DH6 (STATISTIK AUSTRIA) to self-report the weekly consumption frequency of sugary, fatty, and salty foods and energy-dense drinks."

* item[+]
  * linkId = "DH6"
  * text = "DH6: Wie oft konsumieren Sie fett-, zucker- und salzreiche Lebensmittel, wie Süßigkeiten, Mehlspeisen, Knabbereien und trinken Sie energiereiche Getränke wie Limonaden?\n\nDazu zählen: zuckerhaltige Erfrischungsgetränke (\"Softdrinks\") wie Cola, Fanta, Sprite, Eistee, Energy-Drinks; zuckerhaltige Limonaden; zuckerhaltige Sirup-Getränke.\n\nNicht dazu zählen: Erfrischungsgetränke mit ausschließlich künstlichen Süßstoffen; Diät-, Light- und Zero-Getränke; gezuckerter Tee oder Kaffee."
  * type = #choice
  * required = true
  * repeats = false
  * answerOption[+].valueCoding = $athis#diet-daily-or-more "Täglich oder mehrmals täglich"
  * answerOption[+].valueCoding = $athis#diet-4-6-per-week "4 bis 6 Mal pro Woche"
  * answerOption[+].valueCoding = $athis#diet-1-3-per-week "1 bis 3 Mal pro Woche"
  * answerOption[+].valueCoding = $athis#diet-less-than-once-per-week "Weniger als einmal pro Woche"
  * answerOption[+].valueCoding = $athis#diet-never "Nie"
  * item[+]
    * linkId = "DH6-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string
