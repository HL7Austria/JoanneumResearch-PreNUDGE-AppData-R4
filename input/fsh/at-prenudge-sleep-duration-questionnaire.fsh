Instance: SleepDurationQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/SleepDurationQuestionnaire"
* name = "SleepDurationQuestionnaire"
* title = "Durchschnittliche Schlafdauer pro Nacht"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "A simple questionnaire for self-reporting average sleep duration per night in hours. Only allows values between 0 and 24 hours."

* item[+]
  * linkId = "sleep-duration"
  * code = http://loinc.org#93832-4 "Sleep duration"
  * text = "Wie viele Stunden haben Sie durchschnittlich pro Nacht geschlafen?"
  * type = #quantity
  * required = true
  * repeats = false
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption"
    * valueCoding
      * system = "http://unitsofmeasure.org"
      * code = #h
      * display = "h"
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/minValue"
    * valueDecimal = 0
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
    * valueDecimal = 24
  * item[+]
    * linkId = "date"
    * text = "Für welchen Zeitraum gilt dieser Wert?"
    * type = #date
    * required = true
    * repeats = false
    * extension[+]
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
      * valueExpression
        * language = #text/fhirpath
        * expression = "today().subtract(1).toString()"
  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string
