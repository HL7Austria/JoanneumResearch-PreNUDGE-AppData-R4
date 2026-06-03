Alias: $athis = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers

Instance: SmokingStatusQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/SmokingStatusQuestionnaire"
* name = "SmokingStatusQuestionnaire"
* title = "Rauchstatus und Nikotinkonsum"
* status = #active
* subjectType = #Patient
* description = "ATHIS 2025-based questionnaire module for smoking status, cigarette consumption, duration of daily smoking, tobacco heaters, electronic cigarettes or similar electronic products, and nicotine pouches. A derived IPS-compatible Observation can be created from SK1 and the past tobacco smoking question."

* item[+]
  * linkId = "smoking-status-athis"
  * text = "Rauchstatus und Nikotinkonsum"
  * type = #group

  * item[+]
    * linkId = "sk1"
    * text = "Rauchen Sie Tabakprodukte? Nicht gemeint sind Tabakerhitzer, elektronische Zigaretten oder ähnliche elektronische Produkte"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $athis#yn-yes-daily "Ja, täglich"
    * answerOption[+].valueCoding = $athis#yn-yes-occasionally "Ja, gelegentlich"
    * answerOption[+].valueCoding = $athis#yn-no-not-at-all "Nein, überhaupt nicht"
    * answerOption[+].valueCoding = $athis#meta-unknown "Weiß nicht"
    * answerOption[+].valueCoding = $athis#meta-not-stated "Keine Angabe"
    * item[+]
      * linkId = "sk1-help"
      * text = "Tabakprodukte sind: Zigaretten (aus der Schachtel und/oder selbstgedreht), Zigarren (einschließlich Zigarillos), Pfeife. Nicht dazu zählen: Tabakschnupfen oder Tabakkauen, Shisha, Elektronische Zigaretten oder ähnliche elektronische Produkte, Cannabis gemischt mit Tabak"
      * type = #display

  * item[+]
    * linkId = "sk2a"
    * text = "Rauchen Sie täglich Zigaretten aus der Schachtel oder selbstgedrehte Zigaretten?"
    * type = #choice
    * required = false
    * answerOption[+].valueCoding = $athis#yn-yes "Ja"
    * answerOption[+].valueCoding = $athis#yn-no "Nein"
    * answerOption[+].valueCoding = $athis#meta-unknown "Weiß nicht"
    * answerOption[+].valueCoding = $athis#meta-not-stated "Keine Angabe"
    * enableWhen[+]
      * question = "sk1"
      * operator = #=
      * answerCoding = $athis#yn-yes-daily "Ja, täglich"

  * item[+]
    * linkId = "sk2b"
    * text = "Wie viele Zigaretten rauchen Sie durchschnittlich pro Tag?"
    * type = #integer
    * required = false
    * enableWhen[+]
      * question = "sk2a"
      * operator = #=
      * answerCoding = $athis#yn-yes "Ja"
    * item[+]
      * linkId = "sk2-help"
      * text = "Bitte um Angabe von Zigaretten, nicht von Packungen. In einer Zigarettenschachtel sind meist 20 Zigaretten enthalten."
      * type = #display

  // not part of ATHIS, but relevant for PreNUDGE
  * item[+]
    * linkId = "past-tobacco-smoking"
    * text = "Haben Sie in der Vergangenheit Tabakprodukte geraucht?"
    * type = #choice
    * required = false
    * answerOption[+].valueCoding = $athis#yn-no "Nein"
    * answerOption[+].valueCoding = $athis#yn-yes-occasionally "Ja, gelegentlich"
    * answerOption[+].valueCoding = $athis#yn-yes-daily "Ja, täglich"
    * answerOption[+].valueCoding = $athis#meta-unknown "Weiß nicht"
    * answerOption[+].valueCoding = $athis#meta-not-stated "Keine Angabe"
    * enableWhen[+]
      * question = "sk1"
      * operator = #=
      * answerCoding = $athis#yn-no-not-at-all "Nein, überhaupt nicht"

  // not part of ATHIS, but relevant for PreNUDGE
  * item[+]
    * linkId = "past-cigarettes-per-day"
    * text = "Wie viele Zigaretten haben Sie durchschnittlich pro Tag geraucht?"
    * type = #integer
    * required = false
    * enableBehavior = #any
    * enableWhen[+]
      * question = "past-tobacco-smoking"
      * operator = #=
      * answerCoding = $athis#yn-yes-daily "Ja, täglich"
    * enableWhen[+]
      * question = "past-tobacco-smoking"
      * operator = #=
      * answerCoding = $athis#yn-yes-occasionally "Ja, gelegentlich"

  * item[+]
    * linkId = "sk4"
    * text = "Wie viele Jahre haben Sie täglich geraucht? Bitte zählen Sie alle Zeiträume von täglichem Rauchen zusammen."
    * type = #integer
    * required = false
    * enableWhen[+]
      * question = "past-tobacco-smoking"
      * operator = #=
      * answerCoding = $athis#yn-yes-daily "Ja, täglich"
    * item[+]
      * linkId = "sk4-help"
      * text = "Wenn Sie sich nicht an die genaue Anzahl der Jahre erinnern, geben Sie bitte eine Schätzung ab."
      * type = #display

  * item[+]
    * linkId = "sk6a"
    * text = "Nutzen Sie derzeit Tabakerhitzer, bei denen Tabaksticks oder loser Tabak erhitzt werden, zum Beispiel der Marken IQOS, glo, Ploom oder PAX?"
    * type = #choice
    * required = false
    * answerOption[+].valueCoding = $athis#yn-yes-daily "Ja, täglich"
    * answerOption[+].valueCoding = $athis#yn-yes-occasionally "Ja, gelegentlich"
    * answerOption[+].valueCoding = $athis#yn-no-but-formerly "Nein, aber früher"
    * answerOption[+].valueCoding = $athis#yn-no-never "Nein, noch nie genutzt/konsumiert"
    * answerOption[+].valueCoding = $athis#meta-unknown "Weiß nicht"
    * answerOption[+].valueCoding = $athis#meta-not-stated "Keine Angabe"

  * item[+]
    * linkId = "sk6b"
    * text = "Konsumieren Sie derzeit elektronische Zigaretten oder ähnliche elektronische Produkte? Zum Beispiel E-Shisha oder E-Pfeife."
    * type = #choice
    * required = false
    * answerOption[+].valueCoding = $athis#yn-yes-daily "Ja, täglich"
    * answerOption[+].valueCoding = $athis#yn-yes-occasionally "Ja, gelegentlich"
    * answerOption[+].valueCoding = $athis#yn-no-but-formerly "Nein, aber früher"
    * answerOption[+].valueCoding = $athis#yn-no-never "Nein, noch nie genutzt/konsumiert"
    * answerOption[+].valueCoding = $athis#meta-unknown "Weiß nicht"
    * answerOption[+].valueCoding = $athis#meta-not-stated "Keine Angabe"

  * item[+]
    * linkId = "sk6c"
    * text = "Konsumieren Sie derzeit Nikotinbeutel?"
    * type = #choice
    * required = false
    * answerOption[+].valueCoding = $athis#yn-yes-daily "Ja, täglich"
    * answerOption[+].valueCoding = $athis#yn-yes-occasionally "Ja, gelegentlich"
    * answerOption[+].valueCoding = $athis#yn-no-but-formerly "Nein, aber früher"
    * answerOption[+].valueCoding = $athis#yn-no-never "Nein, noch nie genutzt/konsumiert"
    * answerOption[+].valueCoding = $athis#meta-unknown "Weiß nicht"
    * answerOption[+].valueCoding = $athis#meta-not-stated "Keine Angabe"

  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihren Antworten noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string