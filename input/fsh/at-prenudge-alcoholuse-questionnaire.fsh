Instance: AtPrenudgeQuestionnaireAlcoholUse
InstanceOf: Questionnaire
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
  * answerOption[+].valueCoding.system = "http://snomed.info/sct"
  * answerOption[+].valueCoding.code = #228276006
  * answerOption[=].valueCoding.display = "Täglich oder fast jeden Tag im letzten Jahr"
  * answerOption[+].valueCoding.code = #43783005
  * answerOption[=].valueCoding.display = "An 5 bis 6 Tagen pro Woche"
  * answerOption[+].valueCoding.code = #86933000
  * answerOption[=].valueCoding.display = "An 3 bis 4 Tagen pro Woche"
  * answerOption[+].valueCoding.code = #228278007
  * answerOption[=].valueCoding.display = "An 1 bis 2 Tagen pro Woche"
  * answerOption[+].valueCoding.code = #228279004
  * answerOption[=].valueCoding.display = "An 2 bis 3 Tagen pro Monat"
  * answerOption[+].valueCoding.code = #228277002
  * answerOption[=].valueCoding.display = "Einmal pro Monat"
  * answerOption[+].valueCoding.code = #160579004
  * answerOption[=].valueCoding.display = "Weniger als einmal pro Monat"
  * answerOption[+].valueCoding.code = #105542008
  * answerOption[=].valueCoding.display = "Nicht in den letzten 12 Monaten, da ich keinen Alkohol mehr trinke"
  * answerOption[+].valueCoding.code = #228274009
  * answerOption[=].valueCoding.display = "Nie oder lediglich einige wenige Schlucke in meinem Leben"