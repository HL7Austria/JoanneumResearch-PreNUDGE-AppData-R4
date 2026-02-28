Instance: stepcount-response-normal-example
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "Step Count QuestionnaireResponse - Normal Example"
Description: "Beispiel einer normalen Schrittzahl (8,432 Schritte) als QuestionnaireResponse."

* questionnaire = Canonical(StepCountQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-02-28T20:00:00Z"

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
Title: "Step Count QuestionnaireResponse - Low Example"
Description: "Beispiel einer niedrigen Schrittzahl (2,150 Schritte) als QuestionnaireResponse."

* questionnaire = Canonical(StepCountQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-02-28T20:15:00Z"

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
