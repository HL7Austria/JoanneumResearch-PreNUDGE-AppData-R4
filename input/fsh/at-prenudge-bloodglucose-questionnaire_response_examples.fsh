Instance: bloodglucose-response-normal-example
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "Blood Glucose QuestionnaireResponse - Normal Example"
Description: "Beispiel einer normalen Nüchtern-Blutzucker-Messung (95 mg/dL) als QuestionnaireResponse."

* questionnaire = Canonical(BloodGlucoseQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-02-28T07:30:00Z"

* item[0]
  * linkId = "blood-glucose-now"
  * text = "Wie hoch ist Ihr Blutzucker aktuell?"
  * answer[0]
    * valueQuantity
      * value = 95
      * unit = "mg/dL"
      * system = "http://unitsofmeasure.org"
      * code = #mg/dL
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Nüchtern gemessen."

Instance: bloodglucose-response-elevated-example
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "Blood Glucose QuestionnaireResponse - Elevated Example"
Description: "Beispiel einer erhöhten Nüchtern-Blutzucker-Messung (142 mg/dL) als QuestionnaireResponse."

* questionnaire = Canonical(BloodGlucoseQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-02-28T07:45:00Z"

* item[0]
  * linkId = "blood-glucose-now"
  * text = "Wie hoch ist Ihr Blutzucker aktuell?"
  * answer[0]
    * valueQuantity
      * value = 142
      * unit = "mg/dL"
      * system = "http://unitsofmeasure.org"
      * code = #mg/dL
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Patient berichtet, gestern Abend spät gegessen zu haben."