Instance: StepCountResponseActive
InstanceOf: QuestionnaireResponse
Usage: #example

* questionnaire = Canonical(StepCountQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = 2026-02-13

* item[0]
  * linkId = "step-count-today"
  * answer[0].valueInteger = 12345

Instance: StepCountResponseExtreme
InstanceOf: QuestionnaireResponse
Usage: #example

* questionnaire = Canonical(StepCountQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = 2026-02-14

* item[0]
  * linkId = "step-count-today"
  * answer[0].valueInteger = 285000