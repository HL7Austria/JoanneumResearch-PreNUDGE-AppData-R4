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
* description = "A simple questionnaire asking for the person's highest completed education level using eight ISCED-based answer categories."

* item[+]
  * linkId = "highest-completed-education"
  * code = http://loinc.org#82589-3 "Highest level of education"
  * text = "Was ist Ihr höchster abgeschlossener Bildungsabschluss?"
  * type = #choice
  * required = true
  * answerOption[+].valueCoding = $isced#isced-1 "ISCED 1: Volksschule"
  * answerOption[+].valueCoding = $isced#isced-2 "ISCED 2: Hauptschule, Mittelschulen, Unterstufen von AHS"
  * answerOption[+].valueCoding = $isced#isced-3a "ISCED 3a: Polytechnische Schule"
  * answerOption[+].valueCoding = $isced#isced-3b "ISCED 3b: Berufsbildende mittlere Schulen (HASCH, Fachschulen)"
  * answerOption[+].valueCoding = $isced#isced-3c "ISCED 3c: Berufsbildende höhere Schulen (HAK, HBLA, HTL) und AHS-Oberstufe"
  * answerOption[+].valueCoding = $isced#isced-4 "ISCED 4: Lehre mit Matura, Gesundheits- und Krankenpflegeschule (nicht-tertiär), Meister- oder Diplomprüfung"
  * answerOption[+].valueCoding = $isced#isced-5 "ISCED 5: Kolleg, tertiäre Hebammenakademien bzw. medizinisch-technische Ausbildungen im Kurzzyklus"
  * answerOption[+].valueCoding = $isced#isced-6-8 "ISCED 6–8: Hochschulabschlüsse (Bachelor, Master, Doktor)"
  * answerOption[+].valueCoding = $isced#unknown "Weiß nicht"
  * answerOption[+].valueCoding = $isced#not-stated "Keine Angabe"
  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string
