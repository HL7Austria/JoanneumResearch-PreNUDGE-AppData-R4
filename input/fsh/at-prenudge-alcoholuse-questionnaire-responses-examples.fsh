Instance: AlcoholResponseDaily
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example

* questionnaire = Canonical(AtPrenudgeQuestionnaireAlcoholUse)
* status = #completed
* subject = Reference(Patient/example)
* authored = 2026-02-26
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-alc-2026-02-26-001"

* item[0]
  * linkId = "alcohol-frequency"
  * answer[0].valueCoding.system = "http://snomed.info/sct"
  * answer[=].valueCoding.code = #69620002
  * answer[=].valueCoding.display = "Daily"

Instance: AlcoholResponseNever
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example

* questionnaire = Canonical(AtPrenudgeQuestionnaireAlcoholUse)
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
      * answer[0].valueString = "Ich bin als Kind in ein Fass hausgemachten Schnaps gefallen. Zählt das?"