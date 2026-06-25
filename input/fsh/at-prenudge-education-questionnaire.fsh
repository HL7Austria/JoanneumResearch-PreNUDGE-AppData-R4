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
* description = "A simple questionnaire asking for the person's highest completed education level using ISCED 2011 levels."

* item[+]
  * linkId = "highest-completed-education"
  * code = http://loinc.org#82589-3 "Highest level of education"
  * text = "Was ist Ihr höchster abgeschlossener Bildungsabschluss?"
  * type = #choice
  * required = true
  * answerOption[+].valueCoding = $isced#isced-0 "ISCED 0 - Elementarbereich"
  * answerOption[+].valueCoding = $isced#isced-1 "ISCED 1 - Primarbereich"
  * answerOption[+].valueCoding = $isced#isced-2 "ISCED 2 - Sekundarbereich I"
  * answerOption[+].valueCoding = $isced#isced-3 "ISCED 3 - Sekundarbereich II"
  * answerOption[+].valueCoding = $isced#isced-4 "ISCED 4 - Postsekundarer, nicht tertiärer Bereich"
  * answerOption[+].valueCoding = $isced#isced-5 "ISCED 5 - Kurzes tertiäres Bildungsprogramm"
  * answerOption[+].valueCoding = $isced#isced-6 "ISCED 6 - Bachelor- bzw. gleichwertiges Bildungsprogramm"
  * answerOption[+].valueCoding = $isced#isced-7 "ISCED 7 - Master- bzw. gleichwertiges Bildungsprogramm"
  * answerOption[+].valueCoding = $isced#isced-8 "ISCED 8 - Promotion bzw. gleichwertiges Bildungsprogramm"
  * answerOption[+].valueCoding = $isced#unknown "Weiß nicht"
  * answerOption[+].valueCoding = $isced#not-stated "Keine Angabe"
  * item[+]
    * linkId = "highest-completed-education-help"
    * text = "Orientierungshilfe mit typischen Beispielen: ISCED 0 Kindergarten, Vorschule; ISCED 1 Volksschule; ISCED 2 Mittelschule, AHS-Unterstufe; ISCED 3 Polytechnische Schule, berufsbildende mittlere oder höhere Schule, AHS-Oberstufe; ISCED 4 Lehre mit Matura, Gesundheits- und Krankenpflegeschule, Meister- oder Diplomprüfung; ISCED 5 Kolleg, tertiäre Hebammenakademie bzw. medizinisch-technische Ausbildungen im Kurzzyklus; ISCED 6 Bachelor; ISCED 7 Master oder Diplomstudium; ISCED 8 Doktorat oder PhD."
    * type = #display
  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string