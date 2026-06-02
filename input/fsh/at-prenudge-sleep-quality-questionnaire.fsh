Alias: $whoqol-scale = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/whoqol-bref-scale

Instance: SleepQualityQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/SleepQualityQuestionnaire"
* name = "SleepQualityQuestionnaire"
* title = "Schlafqualität – Selbsteinschätzung (WHOQOL-BREF Q16)"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "Standalone questionnaire for self-assessing sleep quality based on WHOQOL-BREF question Q16 ('Wie zufrieden sind Sie mit Ihrem Schlaf?')."

// NOTE:
// duplicate in at-prenudge-qol-questionnaire.fsh
// LHC-Forms does not support SDC-Extension sdc-questionnaire-subQuestionnaire
* item[+]
  * linkId = "Q16"
  * text = "Wie zufrieden sind Sie mit Ihrem Schlaf?"
  * type = #choice
  * required = true
  * repeats = false
  * answerOption[+].valueCoding = $whoqol-scale#S1 "Sehr unzufrieden"
  * answerOption[+].valueCoding = $whoqol-scale#S2 "Unzufrieden"
  * answerOption[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
  * answerOption[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
  * answerOption[+].valueCoding = $whoqol-scale#S5 "Sehr zufrieden"
  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string
