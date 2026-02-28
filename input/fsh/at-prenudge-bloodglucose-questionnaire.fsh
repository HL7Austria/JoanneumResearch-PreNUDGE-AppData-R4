Instance: BloodGlucoseQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/BloodGlucoseQuestionnaire"
* name = "BloodGlucoseQuestionnaire"
* title = "Blutzucker"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "A simple questionnaire for asking how high the blood glucose level is right now. The blood glucose option only allows values inbetween 12 and 1200 mg/dL."

* item[+]
  * linkId = "blood-glucose-now"
  * code = http://loinc.org#1556-0
  * text = "Wie hoch ist Ihr Blutzucker aktuell?"
  * type = #quantity
  * required = true
  * repeats = false
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption"
    * valueCoding
      * system = "http://unitsofmeasure.org"
      * code = #mg/dL
      * display = "mg/dL"
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/minValue"
    * valueDecimal = 12
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
    * valueDecimal = 1200
  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string