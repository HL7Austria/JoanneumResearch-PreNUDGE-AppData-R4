Instance: StepCountQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/StepCountQuestionnaire"
* name = "StepCountQuestionnaire"
* title = "Schrittanzahl (täglich)"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "A simple questionnaire for asking how many steps have been done today. The step count option only allowes values inbetween 0 and 300 000."

// Frage: Anzahl Schritte
* item[+]
  * linkId = "step-count-today"
  * code = http://loinc.org#41950-7
  * text = "Wie viele Schritte sind Sie heute gegangen?"
  * type = #integer
  * required = true
  * repeats = false
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/minValue"
  * extension[=].valueInteger = 0
  * extension[+].url = "http://hl7.org/fhir/StructureDefinition/maxValue" 
  * extension[=].valueInteger = 300000
  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string