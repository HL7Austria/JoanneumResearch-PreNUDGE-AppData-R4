Instance: bloodglucose-response-normal-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Blood Glucose Q - Normal Example"
Description: "Example of a normal fasting blood glucose measurement (95 mg/dL)."

* questionnaire = Canonical(BloodGlucoseQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-02-28T07:30:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-bg-2026-02-28-001"

* item[0]
  * linkId = "blood-glucose-now"
  * text = "Wie hoch ist Ihr Blutzucker aktuell (mg/dL)?"
  * answer[0]
    * valueQuantity
      * value = 95
      * unit = "mg/dL"
      * system = "http://unitsofmeasure.org"
      * code = #mg/dL
    * item[+]
      * linkId = "datetime"
      * answer[0].valueDateTime = "2026-02-22T08:30:00+01:00" 
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Nüchtern gemessen."

Instance: bloodglucose-response-elevated-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Blood Glucose Q - Elevated Example"
Description: "Example of an elevated fasting blood glucose measurement (142 mg/dL), indicating diabetes mellitus."

* questionnaire = Canonical(BloodGlucoseQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-02-28T07:45:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-bg-2026-02-28-002"

* item[0]
  * linkId = "blood-glucose-now"
  * text = "Wie hoch ist Ihr Blutzucker aktuell (mg/dL)?"
  * answer[0]
    * valueQuantity
      * value = 142
      * unit = "mg/dL"
      * system = "http://unitsofmeasure.org"
      * code = #mg/dL
    * item[+]
      * linkId = "datetime"
      * answer[0].valueDateTime = "2026-02-24T08:30:00+01:00" 
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Patient berichtet, gestern Abend spät gegessen zu haben."