Alias: $athis-smoking = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-athis-smoking

Instance: SmokingStatusQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/SmokingStatusQuestionnaire"
* name = "SmokingStatusQuestionnaire"
* title = "Rauchstatus und Nikotinkonsum"
* status = #active
* subjectType = #Patient
* description = "ATHIS-based questionnaire module for smoking status, cigarette consumption, duration of daily smoking, tobacco heaters, electronic cigarettes or similar electronic products, and nicotine pouches. A derived IPS-compatible Observation can be created from SK1 and the past tobacco smoking question."

* item[+]
  * linkId = "smoking-status-athis"
  * text = "Rauchstatus und Nikotinkonsum"
  * type = #group

  * item[+]
    * linkId = "sk1"
    * text = "Rauchen Sie Tabakprodukte (Zigaretten, Zigarren, Pfeife)? Nicht gemeint sind E-Zigaretten oder ähnliche elektronische Produkte."
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $athis-smoking#status-no "Nein"
    * answerOption[+].valueCoding = $athis-smoking#status-occasional "Ja, gelegentlich"
    * answerOption[+].valueCoding = $athis-smoking#status-daily "Ja, täglich"

  * item[+]
    * linkId = "sk2a"
    * text = "Rauchen Sie täglich Zigaretten aus der Schachtel oder selbstgedrehte Zigaretten?"
    * type = #choice
    * required = false
    * answerOption[+].valueCoding = $athis-smoking#yes "Ja"
    * answerOption[+].valueCoding = $athis-smoking#no "Nein"
    * enableWhen[+]
      * question = "sk1"
      * operator = #=
      * answerCoding = $athis-smoking#status-daily "Ja, täglich"

  * item[+]
    * linkId = "sk2b"
    * text = "Wie viele Zigaretten rauchen Sie durchschnittlich pro Tag?"
    * type = #integer
    * required = false
    * enableWhen[+]
      * question = "sk2a"
      * operator = #=
      * answerCoding = $athis-smoking#yes "Ja"

  * item[+]
    * linkId = "past-tobacco-smoking"
    * text = "Haben Sie in der Vergangenheit Tabakprodukte geraucht?"
    * type = #choice
    * required = false
    * answerOption[+].valueCoding = $athis-smoking#status-no "Nein"
    * answerOption[+].valueCoding = $athis-smoking#status-occasional "Ja, gelegentlich"
    * answerOption[+].valueCoding = $athis-smoking#status-daily "Ja, täglich"
    * enableWhen[+]
      * question = "sk1"
      * operator = #=
      * answerCoding = $athis-smoking#status-no "Nein"

  * item[+]
    * linkId = "past-cigarettes-per-day"
    * text = "Wie viele Zigaretten haben Sie durchschnittlich pro Tag geraucht?"
    * type = #integer
    * required = false
    * enableBehavior = #any
    * enableWhen[+]
      * question = "past-tobacco-smoking"
      * operator = #=
      * answerCoding = $athis-smoking#status-daily "Ja, täglich"
    * enableWhen[+]
      * question = "past-tobacco-smoking"
      * operator = #=
      * answerCoding = $athis-smoking#status-occasional "Ja, gelegentlich"

  * item[+]
    * linkId = "sk4"
    * text = "Wie viele Jahre lang haben Sie täglich geraucht? Zählen Sie alle Zeitabschnitte, an denen Sie täglich geraucht haben, zusammen. Wenn Sie sich nicht an die genaue Anzahl der Jahre erinnern können, geben Sie bitte eine Schätzung an."
    * type = #integer
    * required = false
    * enableWhen[+]
      * question = "past-tobacco-smoking"
      * operator = #=
      * answerCoding = $athis-smoking#status-daily "Ja, täglich"

  * item[+]
    * linkId = "sk6a"
    * text = "Nutzen Sie aktuell Tabakerhitzer, bei denen Tabaksticks oder loser Tabak erhitzt werden, zum Beispiel der Marken IQOS, glo, Ploom oder PAX?"
    * type = #choice
    * required = false
    * answerOption[+].valueCoding = $athis-smoking#status-daily "Ja, täglich"
    * answerOption[+].valueCoding = $athis-smoking#status-occasional "Ja, gelegentlich"
    * answerOption[+].valueCoding = $athis-smoking#use-former "Nein, aber früher"
    * answerOption[+].valueCoding = $athis-smoking#use-never "Nein, noch nie konsumiert"

  * item[+]
    * linkId = "sk6b"
    * text = "Konsumieren Sie derzeit elektronische Zigaretten oder ähnliche elektronische Produkte? Zum Beispiel E-Shisha oder E-Pfeife."
    * type = #choice
    * required = false
    * answerOption[+].valueCoding = $athis-smoking#status-daily "Ja, täglich"
    * answerOption[+].valueCoding = $athis-smoking#status-occasional "Ja, gelegentlich"
    * answerOption[+].valueCoding = $athis-smoking#use-former "Nein, aber früher"
    * answerOption[+].valueCoding = $athis-smoking#use-never "Nein, noch nie konsumiert"

  * item[+]
    * linkId = "sk6c"
    * text = "Konsumieren Sie derzeit Nikotinbeutel?"
    * type = #choice
    * required = false
    * answerOption[+].valueCoding = $athis-smoking#status-daily "Ja, täglich"
    * answerOption[+].valueCoding = $athis-smoking#status-occasional "Ja, gelegentlich"
    * answerOption[+].valueCoding = $athis-smoking#use-former "Nein, aber früher"
    * answerOption[+].valueCoding = $athis-smoking#use-never "Nein, noch nie konsumiert"

  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihren Antworten noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string