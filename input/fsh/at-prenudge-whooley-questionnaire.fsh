Alias: $sct = http://snomed.info/sct

Instance: WhooleyQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/WhooleyQuestionnaire"
* name = "WhooleyQuestionnaire"
* title = "PHQ-2; \"Whooley Questions\""
* status = #active
* language = #de-AT
* subjectType = #Patient
* description = "Short screening for emotional burden and depressive disorders (Whooley Questions / PHQ-2 Yes/No version) as referenced in the Nationale VersorgungsLeitlinie (NVL) Depression (AWMF nvl-005, https://register.awmf.org/de/leitlinien/detail/nvl-005). Reference period: last month (deviating from the standard PHQ-2 period of two weeks). When both questions are answered 'Yes', the instrument identifies depressive disorders with a sensitivity of 96% and a specificity of 57%."
* copyright = "Based on the Nationale VersorgungsLeitlinie (NVL) Depression, AWMF nvl-005. https://register.awmf.org/de/leitlinien/detail/nvl-005"

* item[+]
  * linkId = "whooley"
  * text = "PHQ-2; \"Whooley Questions\""
  * type = #group

  * item[+]
    * linkId = "/whooley-q1"
    * text = "Fühlten Sie sich im letzten Monat häufig niedergeschlagen, traurig, bedrückt oder hoffnungslos?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $sct#373066001 "Ja"
    * answerOption[+].valueCoding = $sct#373067005 "Nein"

  * item[+]
    * linkId = "/whooley-q2"
    * text = "Hatten Sie im letzten Monat deutlich weniger Lust und Freude an Dingen, die Sie sonst gerne tun?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $sct#373066001 "Ja"
    * answerOption[+].valueCoding = $sct#373067005 "Nein"

  * item[+]
    * linkId = "whooley-comment"
    * text = "Haben Sie zu Ihren Antworten noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string
