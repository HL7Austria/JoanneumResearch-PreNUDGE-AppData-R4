Instance: AlcoholResponseDaily
InstanceOf: AtPrenudgeQuestionnaireResponse
Title: "Alcohol Use Q - Daily"
Usage: #example
Description: "Example  of an alcohol use observation for a daily drinker."

* questionnaire = Canonical(AlcoholUseQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = 2026-02-20
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-alc-2026-02-20-001"

* item[0]
  * linkId = "alcohol-frequency"
  * answer[0].valueCoding.system = "http://snomed.info/sct"
  * answer[=].valueCoding.code = #69620002
  * answer[=].valueCoding.display = "Daily"

Instance: AlcoholResponseNever
InstanceOf: AtPrenudgeQuestionnaireResponse
Title: "Alcohol Use Q - Non-Drinker"
Usage: #example
Description: "Example  of an alcohol use observation for a lifetime non-drinker."

* questionnaire = Canonical(AlcoholUseQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = 2026-02-27
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-alc-2026-02-27-001"

* item[0]
  * linkId = "alcohol-frequency"
  * answer[0]
    * valueCoding.system = "http://snomed.info/sct"
    * valueCoding.code = #783261004
    * valueCoding.display = "Lifetime non-drinker of alcohol"
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Ich trinke zwar nicht, bin aber als Kind in ein Fass hausgemachten Schnaps gefallen. Zählt das?"