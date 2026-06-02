Alias: $whoqol-scale = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/whoqol-bref-scale

Instance: sleep-quality-response-satisfied-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Sleep Quality Q - Satisfied Example"
Description: "Example of a standalone sleep quality questionnaire response indicating satisfaction with sleep (S4 - Zufrieden)."

* questionnaire = Canonical(SleepQualityQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-10T08:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-slq-2026-03-10-001"

* item[0]
  * linkId = "Q16"
  * text = "Wie zufrieden sind Sie mit Ihrem Schlaf?"
  * answer[0]
    * valueCoding = $whoqol-scale#S4 "Zufrieden"

Instance: sleep-quality-response-dissatisfied-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Sleep Quality Q - Dissatisfied Example"
Description: "Example of a standalone sleep quality questionnaire response indicating dissatisfaction with sleep (S2 - Unzufrieden)."

* questionnaire = Canonical(SleepQualityQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-11T08:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-slq-2026-03-11-001"

* item[0]
  * linkId = "Q16"
  * text = "Wie zufrieden sind Sie mit Ihrem Schlaf?"
  * answer[0]
    * valueCoding = $whoqol-scale#S2 "Unzufrieden"
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Schlafe schlecht wegen Stress."
