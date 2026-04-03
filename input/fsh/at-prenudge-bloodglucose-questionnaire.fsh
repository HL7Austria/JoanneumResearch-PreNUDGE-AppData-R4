Instance: BloodGlucoseQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/BloodGlucoseQuestionnaire"
* name = "BloodGlucoseQuestionnaire"
* title = "Blutzucker bei der letzten Messung"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "A simple questionnaire for asking how high the blood glucose level is right now. The blood glucose option only allows values inbetween 0 and 999 mg/dL."

* item[+]
  * linkId = "blood-glucose"
  * code = http://loinc.org#41653-7 "Glucose [Mass/volume] in Capillary blood by Glucometer"
  * text = "Wie hoch ist Ihr Blutzucker aktuell (mg/dL)?"
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
    * valueDecimal = 0
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
    * valueDecimal = 999
  * item[+]
    * linkId = "meal-context"
    * text = "Wurde dieser Wert nüchtern, vor dem Essen oder nach dem Essen gemessen?"
    * type = #choice
    * required = true
    * answerValueSet = Canonical(AtPrenudgeValueSetBloodglucoseMealcontextSnomedVS)
  * item[+]
    * linkId = "datetime"
    * text = "Wann haben sie diesen Wert gemessen?"
    * type = #dateTime
    * required = true
    * extension[+]
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-initialExpression"
      * valueExpression
        * language = #text/fhirpath
        * expression = "now().toString()"
  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string