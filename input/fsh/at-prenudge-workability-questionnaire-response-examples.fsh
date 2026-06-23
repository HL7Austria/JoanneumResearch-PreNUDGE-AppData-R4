Alias: $workability = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-workability
Alias: $wai = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-wai-answer

Instance: work-soc-response-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Work-SoC Q - Example"
Description: "Example of a Work-SoC questionnaire response with nine raw item answers."

* questionnaire = Canonical(WorkSocQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-20T09:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-work-soc-2026-03-20-001"

* item[0]
  * linkId = "work-soc"
  * item[0]
    * linkId = "work-soc-1"
    * answer[0].valueInteger = 2
  * item[+]
    * linkId = "work-soc-2"
    * answer[0].valueInteger = 5
  * item[+]
    * linkId = "work-soc-3"
    * answer[0].valueInteger = 3
  * item[+]
    * linkId = "work-soc-4"
    * answer[0].valueInteger = 3
  * item[+]
    * linkId = "work-soc-5"
    * answer[0].valueInteger = 6
  * item[+]
    * linkId = "work-soc-6"
    * answer[0].valueInteger = 2
  * item[+]
    * linkId = "work-soc-7"
    * answer[0].valueInteger = 4
  * item[+]
    * linkId = "work-soc-8"
    * answer[0].valueInteger = 4
  * item[+]
    * linkId = "work-soc-9"
    * answer[0].valueInteger = 4
  * item[+]
    * linkId = "comment"
    * answer[0].valueString = "Die Arbeitssituation ist derzeit wechselhaft."

  * item[+]
    * linkId = "work-soc-scores"
    * item[0]
      * linkId = "work-soc-comprehensibility-score"
      * answer[0].valueDecimal = 2.75
    * item[+]
      * linkId = "work-soc-manageability-score"
      * answer[0].valueDecimal = 3.5
    * item[+]
      * linkId = "work-soc-meaningfulness-score"
      * answer[0].valueDecimal = 5


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