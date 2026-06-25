Alias: $sct = http://snomed.info/sct

Instance: whooley-response-positive-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Whooley Q - Positive Screen Example (both Ja)"
Description: "Example of a Whooley (PHQ-2 Ja/Nein-Version) questionnaire response where both questions are answered 'Ja'. The derived Observation maps to valueBoolean = true (positive depression screen)."

* questionnaire = Canonical(WhooleyQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-04-15T10:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-whooley-2026-04-15-positive"

* item[0]
  * linkId = "whooley"
  * item[0]
    * linkId = "/whooley-q1"
    * answer[0].valueCoding = $sct#373066001 "Ja"
  * item[+]
    * linkId = "/whooley-q2"
    * answer[0].valueCoding = $sct#373066001 "Ja"


Instance: whooley-response-negative-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Whooley Q - Negative Screen Example (q1 Ja, q2 Nein)"
Description: "Example of a Whooley (PHQ-2 Ja/Nein-Version) questionnaire response where the first question is answered 'Ja' but the second is 'Nein'. The derived Observation maps to valueBoolean = false (negative depression screen)."

* questionnaire = Canonical(WhooleyQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-04-16T09:30:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-whooley-2026-04-16-negative"

* item[0]
  * linkId = "whooley"
  * item[0]
    * linkId = "/whooley-q1"
    * answer[0].valueCoding = $sct#373066001 "Ja"
  * item[+]
    * linkId = "/whooley-q2"
    * answer[0].valueCoding = $sct#373067005 "Nein"
