Instance: AtPrenudgeQuestionnaireAlcoholUse
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "http://hl7.at/prenudge/Questionnaire/alcohol-frequency"
* name = "AtPrenudgeQuestionnaireAlcoholUse"
* title = "Alkoholkonsum-Frequenz (letztes Jahr)"
* status = #active
* subjectType = #Patient
* description = "Categorical variable for the frequency of alcohol consumption in the last year (IPS-compatible)."

* item[+]
  * linkId = "alcohol-frequency"
  * text = "Wie oft haben Sie in den letzten 12 Monaten Alkohol getrunken?"
  * type = #choice
  * required = true
  * answerValueSet = Canonical(AtPrenudgeValueSetAlcoholUseFrequencySnomedVS)