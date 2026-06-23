Alias: $workability = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-workability
Alias: $wai = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-wai-answer

Instance: WorkAbilityIndexQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/WorkAbilityIndexQuestionnaire"
* name = "WorkAbilityIndexQuestionnaire"
* title = "Arbeitsfähigkeit (WAI Kurzmodul)"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "Short Work Ability Index (WAI) questionnaire module based on Tuomi et al. 1998. The raw answers are collected as QuestionnaireResponse."

* item[+]
  * linkId = "wai"
  * code = $workability#wai-questionnaire "Work Ability Index short questionnaire"
  * text = "Arbeitsfähigkeit"
  * type = #group

  * item[+]
    * linkId = "wai-current-work-ability"
    * code = $workability#wai-current-work-ability "Current work ability compared with lifetime best"
    * text = "Wenn Sie Ihre beste, je erreichte Arbeitsfähigkeit mit 10 Punkten bewerten: Wie viele Punkte würden Sie dann für Ihre derzeitige Arbeitsfähigkeit geben? 0 bedeutet, dass Sie derzeit völlig arbeitsunfähig sind; 10 bedeutet derzeit die beste Arbeitsfähigkeit."
    * type = #integer
    * required = true
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 0
    * extension[+]
      * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueInteger = 10

  * item[+]
    * linkId = "wai-physical-demands-work-ability"
    * code = $workability#wai-physical-demands-work-ability "Current work ability in relation to physical work demands"
    * text = "Wie schätzen Sie Ihre derzeitige Arbeitsfähigkeit in Bezug zu den körperlichen Arbeitsanforderungen ein?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $wai#very-good "Sehr gut (5)"
    * answerOption[+].valueCoding = $wai#rather-good "Eher gut (4)"
    * answerOption[+].valueCoding = $wai#moderate "Mittelmäßig (3)"
    * answerOption[+].valueCoding = $wai#rather-poor "Eher schlecht (2)"
    * answerOption[+].valueCoding = $wai#very-poor "Sehr schlecht (1)"

  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihren Antworten noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string