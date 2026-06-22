Alias: $isced = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-isced-2011-education-level

Instance: education-response-bachelor-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Education Q - Bachelor's Level Example"
Description: "Example of a highest completed education questionnaire response using ISCED 2011 level 6."

* questionnaire = Canonical(EducationQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-20T09:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-education-2026-03-20-001"

* item[0]
  * linkId = "highest-completed-education"
  * text = "Was ist Ihr höchster abgeschlossener Bildungsabschluss?"
  * answer[0]
    * valueCoding = $isced#isced-6 "ISCED 6 - Bachelor- bzw. gleichwertiges Bildungsprogramm"
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Bachelorabschluss an einer Fachhochschule."


Instance: education-response-upper-secondary-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Education Q - Upper Secondary Education Example"
Description: "Example of a highest completed education questionnaire response using ISCED 2011 level 3."

* questionnaire = Canonical(EducationQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-21T10:30:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-education-2026-03-21-001"

* item[0]
  * linkId = "highest-completed-education"
  * text = "Was ist Ihr höchster abgeschlossener Bildungsabschluss?"
  * answer[0].valueCoding = $isced#isced-3 "ISCED 3 - Sekundarbereich II"