Alias: $sdc-calculatedExpression = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression

Instance: BmiQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/BmiQuestionnaire"
* name = "BmiQuestionnaire"
* title = "Körpergröße, Körpergewicht und Body Mass Index (BMI)"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "Questionnaire for self-reporting body height and body weight. The Body Mass Index (BMI) is defined as an SDC calculated expression based on height in cm and weight in kg. The QuestionnaireResponse may be mapped to separate body height, body weight and BMI Observations."

* item[+]
  * linkId = "bmi"
  * text = "Body-Mass-Index (BMI)"
  * type = #group

  * item[+]
    * linkId = "height-cm"
    * code = http://loinc.org#8302-2 "Body height"
    * text = "Körpergröße in Zentimetern (cm)"
    * type = #decimal
    * required = true
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueDecimal = 50
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueDecimal = 250

  * item[+]
    * linkId = "weight-kg"
    * code = http://loinc.org#29463-7 "Body weight"
    * text = "Körpergewicht in Kilogramm (kg)"
    * type = #decimal
    * required = true
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueDecimal = 20
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueDecimal = 300

  * item[+]
    * linkId = "bmi-kg-m2"
    * code = http://loinc.org#39156-5 "Body mass index (BMI) [Ratio]"
    * text = "Body Mass Index (BMI) in kg/m²"
    * type = #decimal
    * required = false
    * readOnly = true
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueDecimal = 5
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueDecimal = 100
    * extension[+]
      * url = $sdc-calculatedExpression
      * valueExpression
        * language = #text/fhirpath
        * expression = "%resource.item.where(linkId = 'bmi').item.where(linkId = 'weight-kg').answer.valueDecimal.first() / ((%resource.item.where(linkId = 'bmi').item.where(linkId = 'height-cm').answer.valueDecimal.first() / 100) * (%resource.item.where(linkId = 'bmi').item.where(linkId = 'height-cm').answer.valueDecimal.first() / 100))"

  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihren Angaben noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string