Alias: $workability = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-workability
Alias: $sdc-calculatedExpression = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression

Instance: WorkSocQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/WorkSocQuestionnaire"
* name = "WorkSocQuestionnaire"
* title = "Arbeitsbezogenes Kohärenzgefühl (Work-SoC)"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "Work-related Sense of Coherence (Work-SoC) questionnaire. The raw item responses are collected in the QuestionnaireResponse. Category scores are defined as SDC calculated expressions and may be mapped to a Work-SoC score Observation."

* item[+]
  * linkId = "work-soc"
  * code = $workability#work-soc-questionnaire "Work-SoC Questionnaire"
  * text = "Wie empfinden Sie persönlich Ihre momentane Arbeit bzw. Arbeitssituation im Allgemeinen?"
  * type = #group

  * item[+]
    * linkId = "work-soc-1"
    * code = $workability#work-soc-item-1 "Work-SoC item 1"
    * text = "bewältigbar (1) - nicht bewältigbar (7)"
    * type = #integer
    * required = true
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 1
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueInteger = 7

  * item[+]
    * linkId = "work-soc-2"
    * code = $workability#work-soc-item-2 "Work-SoC item 2"
    * text = "sinnlos (1) - sinnvoll (7)"
    * type = #integer
    * required = true
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 1
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueInteger = 7

  * item[+]
    * linkId = "work-soc-3"
    * code = $workability#work-soc-item-3 "Work-SoC item 3"
    * text = "strukturiert (1) - chaotisch (7)"
    * type = #integer
    * required = true
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 1
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueInteger = 7

  * item[+]
    * linkId = "work-soc-4"
    * code = $workability#work-soc-item-4 "Work-SoC item 4"
    * text = "beeinflussbar (1) - unbeeinflussbar (7)"
    * type = #integer
    * required = true
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 1
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueInteger = 7

  * item[+]
    * linkId = "work-soc-5"
    * code = $workability#work-soc-item-5 "Work-SoC item 5"
    * text = "unbedeutend (1) - bedeutend (7)"
    * type = #integer
    * required = true
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 1
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueInteger = 7

  * item[+]
    * linkId = "work-soc-6"
    * code = $workability#work-soc-item-6 "Work-SoC item 6"
    * text = "übersichtlich (1) - unübersichtlich (7)"
    * type = #integer
    * required = true
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 1
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueInteger = 7

  * item[+]
    * linkId = "work-soc-7"
    * code = $workability#work-soc-item-7 "Work-SoC item 7"
    * text = "steuerbar (1) - nicht steuerbar (7)"
    * type = #integer
    * required = true
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 1
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueInteger = 7

  * item[+]
    * linkId = "work-soc-8"
    * code = $workability#work-soc-item-8 "Work-SoC item 8"
    * text = "nicht lohnend (1) - lohnenswert (7)"
    * type = #integer
    * required = true
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 1
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueInteger = 7

  * item[+]
    * linkId = "work-soc-9"
    * code = $workability#work-soc-item-9 "Work-SoC item 9"
    * text = "vorhersehbar (1) - unvorhersehbar (7)"
    * type = #integer
    * required = true
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 1
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueInteger = 7

  * item[+]
    * linkId = "work-soc-comprehensibility-score"
    * code = $workability#work-soc-comprehensibility "Work-SoC comprehensibility score"
    * text = "Work-SoC Verstehbarkeit Score"
    * type = #decimal
    * required = false
    * readOnly = true
    * extension[+]
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
      * valueExpression
        * language = #text/fhirpath
        * expression = "(%resource.item.where(linkId = 'work-soc').item.where(linkId = 'work-soc-1').answer.valueInteger.first() + %resource.item.where(linkId = 'work-soc').item.where(linkId = 'work-soc-3').answer.valueInteger.first() + %resource.item.where(linkId = 'work-soc').item.where(linkId = 'work-soc-6').answer.valueInteger.first() + %resource.item.where(linkId = 'work-soc').item.where(linkId = 'work-soc-9').answer.valueInteger.first()) / 4"

  * item[+]
    * linkId = "work-soc-manageability-score"
    * code = $workability#work-soc-manageability "Work-SoC manageability score"
    * text = "Work-SoC Handhabbarkeit Score"
    * type = #decimal
    * required = false
    * readOnly = true
    * extension[+]
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
      * valueExpression
        * language = #text/fhirpath
        * expression = "(%resource.item.where(linkId = 'work-soc').item.where(linkId = 'work-soc-4').answer.valueInteger.first() + %resource.item.where(linkId = 'work-soc').item.where(linkId = 'work-soc-7').answer.valueInteger.first()) / 2"

  * item[+]
    * linkId = "work-soc-meaningfulness-score"
    * code = $workability#work-soc-meaningfulness "Work-SoC meaningfulness score"
    * text = "Work-SoC Sinnhaftigkeit Score"
    * type = #decimal
    * required = false
    * readOnly = true
    * extension[+]
      * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression"
      * valueExpression
        * language = #text/fhirpath
        * expression = "(%resource.item.where(linkId = 'work-soc').item.where(linkId = 'work-soc-2').answer.valueInteger.first() + %resource.item.where(linkId = 'work-soc').item.where(linkId = 'work-soc-5').answer.valueInteger.first() + %resource.item.where(linkId = 'work-soc').item.where(linkId = 'work-soc-8').answer.valueInteger.first()) / 3"

  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihren Antworten noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string
