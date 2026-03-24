Instance: AlcoholUseQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/AlcoholUseQuestionnaire"
* name = "AlcoholUseQuestionnaire"
* title = "Alkoholkonsum im letzten Jahr"
* status = #active
* subjectType = #Patient
* description = "Categorical variable for the frequency of alcohol consumption in the last year (IPS compatible)."

* item[+]
  * linkId = "alcohol-frequency"
  * text = "Wie oft haben Sie in den letzten 12 Monaten Alkohol getrunken?"
  * type = #choice
  * required = true
  * answerValueSet = Canonical(AtPrenudgeValueSetAlcoholUseFrequencySnomedVS)
  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string