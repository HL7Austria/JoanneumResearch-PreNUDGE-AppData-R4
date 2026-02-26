Instance: BloodGlucoseQuestionnaireResponse1
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:b1e2f3a4-5678-9abc-def0-1234567890ab"
* questionnaire = Canonical(BloodGlucoseQuestionnaire)
* status = #completed
* authored = "2026-02-26T08:30:00+01:00"
* subject = Reference(Patient/example)

* item[+]
  * linkId = "blood-glucose-now"
  * answer[+]
    * valueInteger = 95

Instance: BloodGlucoseQuestionnaireResponse2
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example

* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:c2d3e4f5-6789-0abc-def1-234567890abc"
* questionnaire = Canonical(BloodGlucoseQuestionnaire)
* status = #completed
* authored = "2026-02-26T12:15:00+01:00"
* subject = Reference(Patient/example)

* item[+]
  * linkId = "blood-glucose-now"
  * answer[+]
    * valueInteger = 210
    * item[+]
      * linkId = "comment"
      * answer[+]
        * valueString = "Wert nach dem Mittagessen, etwas erhöht."
