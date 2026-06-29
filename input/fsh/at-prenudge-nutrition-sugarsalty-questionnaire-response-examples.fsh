Alias: $athis = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers

Instance: nutrition-sugarsalty-response-daily-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Nutrition Sugar Salty Q - Daily Consumption Example"
Description: "Example response for daily or multiple-times-daily consumption of sugary, fatty, and salty foods (DH6 = code#1)."

* questionnaire = Canonical(NutritionSugarSaltyQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-06-01T09:15:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-nut-ss-2026-06-01-001"

* item[+]
  * linkId = "DH6"
  * text = "DH6: Wie oft konsumieren Sie fett-, zucker- und salzreiche Lebensmittel, wie Süßigkeiten, Mehlspeisen, Knabbereien und trinken Sie energiereiche Getränke wie Limonaden?"
  * answer[+]
    * valueCoding = $athis#diet-daily-or-more "Täglich oder mehrmals täglich"
    * item[+]
      * linkId = "DH6-comment"
      * answer[+].valueString = "Trinke täglich Cola und esse Kekse."

Instance: nutrition-sugarsalty-response-rare-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Nutrition Sugar Salty Q - Rare Consumption Example"
Description: "Example response for less-than-once-weekly consumption of sugary, fatty, and salty foods (DH6 = code#4)."

* questionnaire = Canonical(NutritionSugarSaltyQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-06-02T09:15:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-nut-ss-2026-06-02-001"

* item[+]
  * linkId = "DH6"
  * text = "DH6: Wie oft konsumieren Sie fett-, zucker- und salzreiche Lebensmittel, wie Süßigkeiten, Mehlspeisen, Knabbereien und trinken Sie energiereiche Getränke wie Limonaden?"
  * answer[+]
    * valueCoding = $athis#diet-less-than-once-per-week "Weniger als einmal pro Woche"
    * item[+]
      * linkId = "DH6-comment"
      * answer[+].valueString = "Versuche, Süßigkeiten zu vermeiden."
