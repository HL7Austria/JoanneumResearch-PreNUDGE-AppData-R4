Alias: $wai = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-wai-answer

Instance: wai-response-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "WAI Q - Example"
Description: "Example of a short Work Ability Index questionnaire response."

* questionnaire = Canonical(WorkAbilityIndexQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-20T09:05:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-wai-2026-03-20-001"

* item[0]
  * linkId = "wai"
  * item[0]
    * linkId = "wai-current-work-ability"
    * answer[0].valueInteger = 8
  * item[+]
    * linkId = "wai-physical-demands-work-ability"
    * answer[0].valueCoding = $wai#rather-good "Eher gut (4)"
  * item[+]
    * linkId = "comment"
    * answer[0].valueString = "Körperliche Anforderungen sind gut bewältigbar."