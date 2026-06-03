Alias: $athis = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers

Instance: SmokingStatusResponseCurrentEveryDay
InstanceOf: AtPrenudgeQuestionnaireResponse
Title: "Smoking Status Q ATHIS - Current Daily Tobacco Smoker Example"
Usage: #example
Description: "Example of an ATHIS-based smoking status questionnaire response for a current daily tobacco smoker. The derived observation maps SK1 daily to SNOMED CT 449868002."
* questionnaire = Canonical(SmokingStatusQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-10T08:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-smokingstatus-2026-03-10-001"
* item[0]
  * linkId = "smoking-status-athis"
  * item[0]
    * linkId = "sk1"
    * answer[0].valueCoding = $athis#yn-yes-daily "Ja, täglich"
  * item[+]
    * linkId = "sk2a"
    * answer[0].valueCoding = $athis#yn-yes "Ja"
  * item[+]
    * linkId = "sk2b"
    * answer[0].valueInteger = 15
  * item[+]
    * linkId = "sk6a"
    * answer[0].valueCoding = $athis#yn-no-never "Nein, noch nie genutzt/konsumiert"
  * item[+]
    * linkId = "sk6b"
    * answer[0].valueCoding = $athis#yn-no-but-formerly "Nein, aber früher"
  * item[+]
    * linkId = "sk6c"
    * answer[0].valueCoding = $athis#yn-no-never "Nein, noch nie genutzt/konsumiert"

Instance: SmokingStatusResponseFormer
InstanceOf: AtPrenudgeQuestionnaireResponse
Title: "Smoking Status Q ATHIS - Former Tobacco Smoker Example"
Usage: #example
Description: "Example of an ATHIS-based smoking status questionnaire response for a former tobacco smoker. The derived observation maps SK1 no and past tobacco smoking to SNOMED CT 8517006."
* questionnaire = Canonical(SmokingStatusQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-11T08:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-smokingstatus-2026-03-11-001"
* item[0]
  * linkId = "smoking-status-athis"
  * item[0]
    * linkId = "sk1"
    * answer[0].valueCoding = $athis#yn-no "Nein"
  * item[+]
    * linkId = "past-tobacco-smoking"
    * answer[0].valueCoding = $athis#yn-yes-daily "Ja, täglich"
  * item[+]
    * linkId = "past-cigarettes-per-day"
    * answer[0].valueInteger = 20
  * item[+]
    * linkId = "sk4"
    * answer[0].valueInteger = 12
  * item[+]
    * linkId = "sk6a"
    * answer[0].valueCoding = $athis#yn-no-but-formerly "Nein, aber früher"
  * item[+]
    * linkId = "sk6b"
    * answer[0].valueCoding = $athis#yn-no-never "Nein, noch nie genutzt/konsumiert"
  * item[+]
    * linkId = "sk6c"
    * answer[0].valueCoding = $athis#yn-no-never "Nein, noch nie genutzt/konsumiert"

Instance: SmokingStatusResponseNever
InstanceOf: AtPrenudgeQuestionnaireResponse
Title: "Smoking Status Q ATHIS - Never Tobacco Smoker Example"
Usage: #example
Description: "Example of an ATHIS-based smoking status questionnaire response for a person who never smoked tobacco. The derived observation maps SK1 no and past tobacco smoking no to SNOMED CT 266919005."
* questionnaire = Canonical(SmokingStatusQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-12T08:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-smokingstatus-2026-03-12-001"
* item[0]
  * linkId = "smoking-status-athis"
  * item[0]
    * linkId = "sk1"
    * answer[0].valueCoding = $athis#yn-no "Nein"
  * item[+]
    * linkId = "past-tobacco-smoking"
    * answer[0].valueCoding = $athis#yn-no "Nein"
  * item[+]
    * linkId = "sk6a"
    * answer[0].valueCoding = $athis#yn-no-never "Nein, noch nie genutzt/konsumiert"
  * item[+]
    * linkId = "sk6b"
    * answer[0].valueCoding = $athis#yn-no-never "Nein, noch nie genutzt/konsumiert"
  * item[+]
    * linkId = "sk6c"
    * answer[0].valueCoding = $athis#yn-no-never "Nein, noch nie genutzt/konsumiert"