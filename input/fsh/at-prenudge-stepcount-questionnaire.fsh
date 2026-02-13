Instance: StepCountQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "http://example.org/fhir/Questionnaire/step-count"
* name = "StepCountQuestionnaire"
* title = "Schrittanzahl (täglich)"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "A simple questionnaire for asking how many steps have been done today. The step count option only allowes values inbetween 0 and 300 000."

// Frage: Anzahl Schritte
* item[0].linkId = "step-count-today"
* item[0].code = http://loinc.org#41950-7
* item[0].text = "Wie viele Schritte sind Sie heute gegangen?"
* item[0].type = #integer
* item[0].required = true
* item[0].repeats = false
* item[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/minValue"
* item[0].extension[=].valueInteger = 0
* item[0].extension[+].url = "http://hl7.org/fhir/StructureDefinition/maxValue" 
* item[0].extension[=].valueInteger = 300000