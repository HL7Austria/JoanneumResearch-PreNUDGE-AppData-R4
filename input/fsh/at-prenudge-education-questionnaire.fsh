Alias: $isced = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-isced-2011-education-level

Instance: EducationQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/EducationQuestionnaire"
* name = "EducationQuestionnaire"
* title = "Höchster abgeschlossener Bildungsabschluss"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "A simple questionnaire asking for the person's highest completed education level using six ISCED-based answer categories."

* item[+]
  * linkId = "highest-completed-education"
  * code = http://loinc.org#82589-3 "Highest level of education"
  * text = "Was ist Ihre höchste erfolgreich abgeschlossene Ausbildung / Ihr höchster Schul- bzw. Berufsbildungsabschluss?"
  * type = #choice
  * required = true
  * answerOption[+].valueCoding = $isced#isced-1 "ISCED 1: Volksschule"
  * answerOption[+].valueCoding = $isced#isced-2 "ISCED 2: Hauptschule, Mittelschule, AHS-Unterstufe, Polytechnische Schule"
  * answerOption[+].valueCoding = $isced#isced-3 "ISCED 3: Lehre, BMS (z. B. HASCH, Fachschulen), AHS-Oberstufe"
  * answerOption[+].valueCoding = $isced#isced-4 "ISCED 4: Berufsreifeprüfung, Gesundheits- und Krankenpflegeschule"
  * answerOption[+].valueCoding = $isced#isced-5 "ISCED 5: BHS-Abschluss (HAK, HLW, HTL), Kolleg, Meisterprüfung"
  * answerOption[+].valueCoding = $isced#isced-6-8 "ISCED 6–8: Hochschulabschlüsse (Bachelor, Master, Diplomstudium, Doktorat)"
  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string
