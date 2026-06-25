Instance: bmi-questionnaire-response-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "BMI Questionnaire Response Example"
Description: "Example of a BMI questionnaire response with body height, body weight and a calculated BMI value."

* questionnaire = Canonical(BmiQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-20T09:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-bmi-2026-03-20-001"

* item[0]
  * linkId = "bmi"

  * item[0]
    * linkId = "height-cm"
    * answer[0].valueDecimal = 180

  * item[+]
    * linkId = "weight-kg"
    * answer[0].valueDecimal = 81

  * item[+]
    * linkId = "bmi-kg-m2"
    * answer[0].valueDecimal = 25.0

  * item[+]
    * linkId = "comment"
    * answer[0].valueString = "Selbstberichtete Werte."