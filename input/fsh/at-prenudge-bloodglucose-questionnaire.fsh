Instance: BloodGlucoseQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/BloodGlucoseQuestionnaire"
* name = "BloodGlucoseQuestionnaire"
* title = "Blutzucker"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "A simple questionnaire for asking how high the blood glucose level is right now. The blood glucose option only allowes values inbetween 12 and 1200."

* item[+]
  * linkId = "blood-glucose-now"
  * code = http://loinc.org#1556-0
  * text = "Wie hoch ist ihr Blutzucker in mg/dL aktuell?"
  * type = #integer
  * required = true
  * repeats = false
  * extension[0].url = "http://hl7.org/fhir/StructureDefinition/minValue"
  * extension[=].valueInteger = 12
  * extension[+].url = "http://hl7.org/fhir/StructureDefinition/maxValue" 
  * extension[=].valueInteger = 1200
  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string