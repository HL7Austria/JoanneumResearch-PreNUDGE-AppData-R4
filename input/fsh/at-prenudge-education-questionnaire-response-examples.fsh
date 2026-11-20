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
  * text = "Was ist Ihre höchste erfolgreich abgeschlossene Ausbildung / Ihr höchster Schul- bzw. Berufsbildungsabschluss?"
  * answer[0]
    * valueCoding = $isced#isced-6-8 "ISCED 6–8: Hochschulabschlüsse (Bachelor, Master, Diplomstudium, Doktorat)"
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Bachelorabschluss an einer Fachhochschule."


Instance: education-response-upper-secondary-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Education Q - ISCED 3 Example"
Description: "Example of a highest completed education questionnaire response for AHS upper secondary education, in the ISCED 3 group."

* questionnaire = Canonical(EducationQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-21T10:30:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-education-2026-03-21-001"

* item[0]
  * linkId = "highest-completed-education"
  * text = "Was ist Ihre höchste erfolgreich abgeschlossene Ausbildung / Ihr höchster Schul- bzw. Berufsbildungsabschluss?"
  * answer[0].valueCoding = $isced#isced-3 "ISCED 3: Lehre, BMS (z. B. HASCH, Fachschulen), AHS-Oberstufe"
