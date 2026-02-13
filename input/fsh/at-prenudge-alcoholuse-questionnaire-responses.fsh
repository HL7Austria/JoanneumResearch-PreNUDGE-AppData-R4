Instance: AlcoholResponseDaily
InstanceOf: QuestionnaireResponse
Usage: #example

* questionnaire = Canonical(AtPrenudgeQuestionnaireAlcoholUse)
* status = #completed
* subject = Reference(Patient/example)
* authored = 2026-02-13

* item[0]
  * linkId = "alcohol-frequency"
  * answer[0].valueCoding.system = "http://snomed.info/sct"
  * answer[=].valueCoding.code = #69620002
  * answer[=].valueCoding.display = "Täglich oder fast jeden Tag im letzten Jahr"

Instance: AlcoholResponseNever
InstanceOf: QuestionnaireResponse
Usage: #example

* questionnaire = Canonical(AtPrenudgeQuestionnaireAlcoholUse)
* status = #completed
* subject = Reference(Patient/example)
* authored = 2026-02-13

* item[0]
  * linkId = "alcohol-frequency"
  * answer[0].valueCoding.system = "http://snomed.info/sct"
  * answer[=].valueCoding.code = #783261004
  * answer[=].valueCoding.display = "Nie oder lediglich einige wenige Schlucke in meinem Leben"