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
  * text = "Wie viele Stunden schlafen Sie normalerweise pro Nacht?"
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
    * linkId = "sleep-duration-help"
    * text = "Hinweis: Bitte zählen Sie Nickerchen tagsüber nicht dazu und runden Sie ganze Stunden auf oder ab."
    * type = #display
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
        * expression = "today()"
  * item[+]
    * linkId = "date-help"
    * text = "Hinweis: Geben Sie das Datum des Tages an, an dem dieser Zeitraum endet (z. B. das Ende der letzten Woche)."
    * type = #display
  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string
