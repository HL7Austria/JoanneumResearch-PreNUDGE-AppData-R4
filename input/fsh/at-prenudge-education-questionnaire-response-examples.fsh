Alias: $isced = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-isced-2011-education-level

Instance: education-response-bachelor-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Education Q - ISCED 6–8 Higher Education Example"
Description: "Example of a highest completed education questionnaire response using the grouped ISCED 6–8 category."

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
    * valueCoding = $isced#isced-6-8 "ISCED 6–8: Hochschulabschlüsse (Bachelor, Master, Doktor)"
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Bachelorabschluss an einer Fachhochschule."


Instance: education-response-upper-secondary-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Education Q - ISCED 3c Example"
Description: "Example of a highest completed education questionnaire response using the ISCED 3c category."

* questionnaire = Canonical(EducationQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-21T10:30:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-education-2026-03-21-001"

* item[0]
  * linkId = "highest-completed-education"
  * text = "Was ist Ihr höchster abgeschlossener Bildungsabschluss?"
  * answer[0].valueCoding = $isced#isced-3c "ISCED 3c: Berufsbildende höhere Schulen (HAK, HBLA, HTL) und AHS-Oberstufe"
