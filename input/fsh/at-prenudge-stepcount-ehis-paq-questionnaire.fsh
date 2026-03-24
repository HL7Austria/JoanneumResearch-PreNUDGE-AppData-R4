Instance: StepCountEhisPaqQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/StepCountEhisPaqQuestionnaire"
* name = "StepCountEhisPaqQuestionnaire"
* title = "EHIS-PAQ: Zu-Fuß-Gehen"
* status = #active
* experimental = false
* subjectType[0] = #Patient
* description = "The questions Q2 and Q3 from the EHIS-PAQ about the number of days and duration of walking (for transport) in a typical week."

* item[+]
  * linkId = "Q2-walking-days"
  * text = "An wie vielen Tagen in einer typischen Woche gehen Sie mindestens 10 Minuten ohne Unterbrechung zu Fuß, um von Ort zu Ort zu gelangen?"
  * type = #integer
  * required = true
  * repeats = false
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/minValue"
    * valueDecimal = 0
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
    * valueDecimal = 7

  * item[+]
    * linkId = "Q2-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

* item[+]
  * linkId = "Q3-walking-duration"
  * text = "Wie lange gehen Sie an einem typischen Tag zu Fuß, um von Ort zu Ort zu gelangen?"
  * type = #choice
  * required = true
  * repeats = false

  // as we would have to create an own codesystem for these values, there is no benefit of binding to a valueset
  * answerOption[+].valueString = "0–9 Minuten pro Tag"
  * answerOption[+].valueString = "10–29 Minuten pro Tag"
  * answerOption[+].valueString = "30–59 Minuten pro Tag"
  * answerOption[+].valueString = "1 Stunde bis unter 2 Stunden pro Tag"
  * answerOption[+].valueString = "2 Stunden bis unter 3 Stunden pro Tag"
  * answerOption[+].valueString = "3 Stunden pro Tag oder mehr"
  
  * item[+]
    * linkId = "Q3-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string