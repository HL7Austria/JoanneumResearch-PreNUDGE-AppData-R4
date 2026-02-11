Instance: StepCountQuestionnaire
InstanceOf: Questionnaire
Usage: #definition

* url = "http://example.org/fhir/Questionnaire/step-count"
* name = "StepCountQuestionnaire"
* title = "Schrittanzahl (täglich)"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "A simple questionnaire for asking how many steps have been done today."

// Frage: Anzahl Schritte
* item[0].linkId = "step-count-today"
* item[0].text = "Wie viele Schritte sind Sie heute gegangen?"
* item[0].type = #integer
* item[0].required = true
* item[0].repeats = false

// Optional: Datum der Messung
// * item[1].linkId = "measurement-date"
// * item[1].text = "Datum der Messung"
// * item[1].type = #date
// * item[1].required = false
// * item[1].repeats = false