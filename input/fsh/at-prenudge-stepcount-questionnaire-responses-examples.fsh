Instance: stepcount-response-normal-example
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "Step Count Q - Normal Example"
Description: "Beispiel einer normalen Schrittzahl (8,432 Schritte) als QuestionnaireResponse."

* questionnaire = Canonical(StepCountQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-02-28T20:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-sc-2026-02-28-001"

* item[0]
  * linkId = "step-count-today"
  * text = "Wie viele Schritte sind Sie heute gegangen?"
  * answer[0]
    * valueQuantity
      * value = 8432
      * unit = "{steps}/d"
      * system = "http://unitsofmeasure.org"
      * code = #{steps}/d
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Normaler Arbeitstag mit Spaziergang in der Mittagspause."

Instance: stepcount-response-low-example
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "Step Count Q - High Example"
Description: "Beispiel einer hohen Schrittzahl (133,519 Schritte) als QuestionnaireResponse."

* questionnaire = Canonical(StepCountQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-02-28T20:15:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-sc-2026-02-28-002"

* item[0]
  * linkId = "step-count-today"
  * text = "Wie viele Schritte sind Sie heute gegangen?"
  * answer[0]
    * valueQuantity
      * value = 133519
      * unit = "{steps}/d"
      * system = "http://unitsofmeasure.org"
      * code = #{steps}/d
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Könnte bitte jemand überprüfen ob das ein Weltrekord wäre?"