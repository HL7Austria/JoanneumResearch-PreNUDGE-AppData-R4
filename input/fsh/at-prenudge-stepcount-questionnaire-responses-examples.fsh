Instance: StepCountResponseActive
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example

* questionnaire = Canonical(StepCountQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = 2026-02-26
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-steps-2026-02-26-001"

* item[0]
  * linkId = "step-count-today"
  * answer[0].valueInteger = 12345

Instance: StepCountResponseExtreme
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example

* questionnaire = Canonical(StepCountQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = 2026-02-27
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-steps-2026-02-27-001"

* item[0]
  * linkId = "step-count-today"
  * answer[0].valueInteger = 133519
  * item[+]
    * linkId = "comment"
    * answer[0].valueString = "Könnte bitte jemand überprüfen ob das ein Weltrekord wäre?"