Instance: StepCountQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/StepCountQuestionnaire"
* name = "StepCountQuestionnaire"
* title = "Schrittzahl am heutigen Tag"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "A simple questionnaire for asking how many steps the patient has taken today. Only allows values inbetween 0 and 150,000."

* item[+]
  * linkId = "step-count-today"
  * code = http://loinc.org#41950-7
  * text = "Wie viele Schritte sind Sie heute gegangen?"
  * type = #quantity
  * required = true
  * repeats = false
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption"
    * valueCoding
      * system = "http://unitsofmeasure.org"
      * code = #{steps}/d
      * display = "{steps}/d"
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/minValue"
    * valueDecimal = 0
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
    * valueDecimal = 150000
  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string