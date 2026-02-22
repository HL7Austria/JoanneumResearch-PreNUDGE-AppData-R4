Alias: $SF36CS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/rand-sf36-answers

Instance: QolQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition
//Description: "Der RAND 36-Item Health Survey (SF-36) Version 1.0 erfasst die gesundheitsbezogene Lebensqualität in 8 Subskalen: Körperliche Funktionsfähigkeit, Körperliche Rollenfunktion, Körperliche Schmerzen, Allgemeine Gesundheitswahrnehmung, Vitalität, Soziale Funktionsfähigkeit, Emotionale Rollenfunktion und Psychisches Wohlbefinden. Die RAND-Version ist Public Domain."

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/QolQuestionnaire"
* name = "QoLByRandSF36v1"
* title = "Quality of life by RAND 36-Item Health Survey 1.0 (SF-36)"
* status = #active
* subjectType = #Patient
* language = #de-AT

// ============================================================
// ITEM 1: Allgemeiner Gesundheitszustand
// Subskala: General Health (GH)
// ============================================================
* item[0]
  * linkId = "Q1"
  * text = "Wie würden Sie Ihren Gesundheitszustand im Allgemeinen beschreiben?"
  * type = #choice
  * required = true
  * answerOption[0].valueCoding = $SF36CS#health-excellent "Ausgezeichnet"
  * answerOption[+].valueCoding = $SF36CS#health-very-good "Sehr gut"
  * answerOption[+].valueCoding = $SF36CS#health-good "Gut"
  * answerOption[+].valueCoding = $SF36CS#health-fair "Weniger gut"
  * answerOption[+].valueCoding = $SF36CS#health-poor "Schlecht"
  * item[+]
    * linkId = "Q1-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

// ============================================================
// ITEM 2: Gesundheitsveränderung
// Subskala: Health Transition (nicht in Scoring)
// ============================================================
* item[+]
  * linkId = "Q2"
  * text = "Im Vergleich zum vergangenen Jahr, wie würden Sie Ihren derzeitigen Gesundheitszustand beschreiben?"
  * type = #choice
  * required = true
  * answerOption[0].valueCoding = $SF36CS#change-much-better "Derzeit viel besser als vor einem Jahr"
  * answerOption[+].valueCoding = $SF36CS#change-somewhat-better "Derzeit etwas besser als vor einem Jahr"
  * answerOption[+].valueCoding = $SF36CS#change-same "Etwa so wie vor einem Jahr"
  * answerOption[+].valueCoding = $SF36CS#change-somewhat-worse "Derzeit etwas schlechter als vor einem Jahr"
  * answerOption[+].valueCoding = $SF36CS#change-much-worse "Derzeit viel schlechter als vor einem Jahr"
  * item[+]
    * linkId = "Q2-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

// ============================================================
// ITEMS 3a-3j: Körperliche Funktionsfähigkeit (Physical Functioning - PF)
// ============================================================
* item[+]
  * linkId = "Q3"
  * text = "Im Folgenden sind einige Tätigkeiten beschrieben, die Sie vielleicht an einem normalen Tag ausüben. Sind Sie durch Ihren derzeitigen Gesundheitszustand bei diesen Tätigkeiten eingeschränkt? Wenn ja, wie stark?"
  * type = #group

  * item[0]
    * linkId = "Q3a"
    * text = "Anstrengende Tätigkeiten, z.B. schnell laufen, schwere Gegenstände heben, anstrengenden Sport treiben"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

  * item[+]
    * linkId = "Q3b"
    * text = "Mittelschwere Tätigkeiten, z.B. einen Tisch verschieben, staubsaugen, kegeln, Golf spielen"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

  * item[+]
    * linkId = "Q3c"
    * text = "Einkaufstaschen heben oder tragen"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

  * item[+]
    * linkId = "Q3d"
    * text = "Mehrere Treppenabsätze steigen"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

  * item[+]
    * linkId = "Q3e"
    * text = "Einen Treppenabsatz steigen"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

  * item[+]
    * linkId = "Q3f"
    * text = "Sich beugen, knien, bücken"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

  * item[+]
    * linkId = "Q3g"
    * text = "Mehr als 1 Kilometer zu Fuß gehen"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

  * item[+]
    * linkId = "Q3h"
    * text = "Mehrere Straßenkreuzungen weit zu Fuß gehen"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

  * item[+]
    * linkId = "Q3i"
    * text = "Eine Straßenkreuzung weit zu Fuß gehen"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

  * item[+]
    * linkId = "Q3j"
    * text = "Sich baden oder anziehen"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
    * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

  * item[+]
    * linkId = "Q3-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

// ============================================================
// ITEMS 4a-4d: Körperliche Rollenfunktion (Role Physical - RP)
// ============================================================
* item[+]
  * linkId = "Q4"
  * text = "Hatten Sie in den vergangenen 4 Wochen aufgrund Ihrer körperlichen Gesundheit irgendwelche Schwierigkeiten bei der Arbeit oder anderen alltäglichen Tätigkeiten im Beruf bzw. zu Hause?"
  * type = #group

  * item[0]
    * linkId = "Q4a"
    * text = "Ich konnte nicht so lange wie üblich tätig sein"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#yes "Ja"
    * answerOption[+].valueCoding = $SF36CS#no "Nein"

  * item[+]
    * linkId = "Q4b"
    * text = "Ich habe weniger geschafft als ich wollte"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#yes "Ja"
    * answerOption[+].valueCoding = $SF36CS#no "Nein"

  * item[+]
    * linkId = "Q4c"
    * text = "Ich konnte nur bestimmte Dinge tun"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#yes "Ja"
    * answerOption[+].valueCoding = $SF36CS#no "Nein"

  * item[+]
    * linkId = "Q4d"
    * text = "Ich hatte Schwierigkeiten bei der Ausführung (z.B. ich musste mich besonders anstrengen)"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#yes "Ja"
    * answerOption[+].valueCoding = $SF36CS#no "Nein"

  * item[+]
    * linkId = "Q4-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

// ============================================================
// ITEMS 5a-5c: Emotionale Rollenfunktion (Role Emotional - RE)
// ============================================================
* item[+]
  * linkId = "Q5"
  * text = "Hatten Sie in den vergangenen 4 Wochen aufgrund seelischer Probleme irgendwelche Schwierigkeiten bei der Arbeit oder anderen alltäglichen Tätigkeiten im Beruf bzw. zu Hause (z.B. weil Sie sich niedergeschlagen oder ängstlich fühlten)?"
  * type = #group

  * item[0]
    * linkId = "Q5a"
    * text = "Ich konnte nicht so lange wie üblich tätig sein"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#yes "Ja"
    * answerOption[+].valueCoding = $SF36CS#no "Nein"

  * item[+]
    * linkId = "Q5b"
    * text = "Ich habe weniger geschafft als ich wollte"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#yes "Ja"
    * answerOption[+].valueCoding = $SF36CS#no "Nein"

  * item[+]
    * linkId = "Q5c"
    * text = "Ich konnte nicht so sorgfältig wie üblich arbeiten"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#yes "Ja"
    * answerOption[+].valueCoding = $SF36CS#no "Nein"

  * item[+]
    * linkId = "Q5-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

// ============================================================
// ITEM 6: Soziale Funktionsfähigkeit (Social Functioning - SF) Teil 1
// ============================================================
* item[+]
  * linkId = "Q6"
  * text = "Wie sehr haben Ihre körperliche Gesundheit oder seelischen Probleme in den vergangenen 4 Wochen Ihre normalen Kontakte zu Familienangehörigen, Freunden, Nachbarn oder zum Bekanntenkreis beeinträchtigt?"
  * type = #choice
  * required = true
  * answerOption[0].valueCoding = $SF36CS#interfere-not-at-all "Überhaupt nicht"
  * answerOption[+].valueCoding = $SF36CS#interfere-slightly "Etwas"
  * answerOption[+].valueCoding = $SF36CS#interfere-moderately "Mäßig"
  * answerOption[+].valueCoding = $SF36CS#interfere-quite-a-bit "Ziemlich"
  * answerOption[+].valueCoding = $SF36CS#interfere-extremely "Sehr"

  * item[+]
    * linkId = "Q6-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

// ============================================================
// ITEM 7: Körperliche Schmerzen (Bodily Pain - BP) Teil 1
// ============================================================
* item[+]
  * linkId = "Q7"
  * text = "Wie stark waren Ihre Schmerzen in den vergangenen 4 Wochen?"
  * type = #choice
  * required = true
  * answerOption[0].valueCoding = $SF36CS#pain-none "Keine Schmerzen"
  * answerOption[+].valueCoding = $SF36CS#pain-very-mild "Sehr leicht"
  * answerOption[+].valueCoding = $SF36CS#pain-mild "Leicht"
  * answerOption[+].valueCoding = $SF36CS#pain-moderate "Mäßig"
  * answerOption[+].valueCoding = $SF36CS#pain-severe "Stark"
  * answerOption[+].valueCoding = $SF36CS#pain-very-severe "Sehr stark"

  * item[+]
    * linkId = "Q7-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

// ============================================================
// ITEM 8: Körperliche Schmerzen (Bodily Pain - BP) Teil 2
// ============================================================
* item[+]
  * linkId = "Q8"
  * text = "Inwieweit haben die Schmerzen Sie in den vergangenen 4 Wochen bei der Ausübung Ihrer Alltagstätigkeiten zu Hause und im Beruf behindert?"
  * type = #choice
  * required = true
  * answerOption[0].valueCoding = $SF36CS#interfere-not-at-all "Überhaupt nicht"
  * answerOption[+].valueCoding = $SF36CS#interfere-slightly "Etwas"
  * answerOption[+].valueCoding = $SF36CS#interfere-moderately "Mäßig"
  * answerOption[+].valueCoding = $SF36CS#interfere-quite-a-bit "Ziemlich"
  * answerOption[+].valueCoding = $SF36CS#interfere-extremely "Sehr"

  * item[+]
    * linkId = "Q8-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

// ============================================================
// ITEMS 9a-9i: Vitalität (VT) & Psychisches Wohlbefinden (MH)
// 9a (VT), 9b (MH), 9c (MH), 9d (MH), 9e (VT),
// 9f (MH), 9g (VT), 9h (MH), 9i (VT)
// ============================================================
* item[+]
  * linkId = "Q9"
  * text = "In diesen Fragen geht es darum, wie Sie sich fühlen und wie es Ihnen in den vergangenen 4 Wochen gegangen ist. Bitte kreuzen Sie in jeder Zeile die Zahl an, die Ihrem Befinden am ehesten entspricht. Wie oft waren Sie in den vergangenen 4 Wochen..."
  * type = #group

  * item[0]
    * linkId = "Q9a"
    * text = "...voller Schwung?"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
    * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
    * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
    * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
    * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
    * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

  * item[+]
    * linkId = "Q9b"
    * text = "...sehr nervös?"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
    * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
    * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
    * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
    * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
    * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

  * item[+]
    * linkId = "Q9c"
    * text = "...so niedergeschlagen, dass Sie nichts aufheitern konnte?"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
    * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
    * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
    * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
    * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
    * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

  * item[+]
    * linkId = "Q9d"
    * text = "...ruhig und gelassen?"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
    * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
    * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
    * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
    * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
    * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

  * item[+]
    * linkId = "Q9e"
    * text = "...voller Energie?"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
    * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
    * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
    * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
    * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
    * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

  * item[+]
    * linkId = "Q9f"
    * text = "...entmutigt und traurig?"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
    * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
    * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
    * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
    * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
    * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

  * item[+]
    * linkId = "Q9g"
    * text = "...erschöpft?"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
    * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
    * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
    * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
    * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
    * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

  * item[+]
    * linkId = "Q9h"
    * text = "...glücklich?"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
    * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
    * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
    * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
    * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
    * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

  * item[+]
    * linkId = "Q9i"
    * text = "...müde?"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
    * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
    * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
    * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
    * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
    * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

  * item[+]
    * linkId = "Q9-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

// ============================================================
// ITEM 10: Soziale Funktionsfähigkeit (SF) Teil 2
// ============================================================
* item[+]
  * linkId = "Q10"
  * text = "Wie häufig haben Ihre körperliche Gesundheit oder seelischen Probleme in den vergangenen 4 Wochen Ihre Kontakte zu anderen Menschen (Besuche bei Freunden, Verwandten usw.) beeinträchtigt?"
  * type = #choice
  * required = true
  * answerOption[0].valueCoding = $SF36CS#freq5-all "Immer"
  * answerOption[+].valueCoding = $SF36CS#freq5-most "Meistens"
  * answerOption[+].valueCoding = $SF36CS#freq5-some "Manchmal"
  * answerOption[+].valueCoding = $SF36CS#freq5-little "Selten"
  * answerOption[+].valueCoding = $SF36CS#freq5-none "Nie"

  * item[+]
    * linkId = "Q10-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

// ============================================================
// ITEMS 11a-11d: Allgemeine Gesundheitswahrnehmung (General Health - GH)
// ============================================================
* item[+]
  * linkId = "Q11"
  * text = "Inwieweit trifft jede der folgenden Aussagen auf Sie zu?"
  * type = #group

  * item[0]
    * linkId = "Q11a"
    * text = "Ich scheine etwas leichter als andere krank zu werden"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#agree-definitely-true "Trifft ganz zu"
    * answerOption[+].valueCoding = $SF36CS#agree-mostly-true "Trifft weitgehend zu"
    * answerOption[+].valueCoding = $SF36CS#agree-dont-know "Weiß nicht"
    * answerOption[+].valueCoding = $SF36CS#agree-mostly-false "Trifft weitgehend nicht zu"
    * answerOption[+].valueCoding = $SF36CS#agree-definitely-false "Trifft überhaupt nicht zu"

  * item[+]
    * linkId = "Q11b"
    * text = "Ich bin genauso gesund wie alle anderen, die ich kenne"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#agree-definitely-true "Trifft ganz zu"
    * answerOption[+].valueCoding = $SF36CS#agree-mostly-true "Trifft weitgehend zu"
    * answerOption[+].valueCoding = $SF36CS#agree-dont-know "Weiß nicht"
    * answerOption[+].valueCoding = $SF36CS#agree-mostly-false "Trifft weitgehend nicht zu"
    * answerOption[+].valueCoding = $SF36CS#agree-definitely-false "Trifft überhaupt nicht zu"

  * item[+]
    * linkId = "Q11c"
    * text = "Ich erwarte, dass meine Gesundheit nachlässt"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#agree-definitely-true "Trifft ganz zu"
    * answerOption[+].valueCoding = $SF36CS#agree-mostly-true "Trifft weitgehend zu"
    * answerOption[+].valueCoding = $SF36CS#agree-dont-know "Weiß nicht"
    * answerOption[+].valueCoding = $SF36CS#agree-mostly-false "Trifft weitgehend nicht zu"
    * answerOption[+].valueCoding = $SF36CS#agree-definitely-false "Trifft überhaupt nicht zu"

  * item[+]
    * linkId = "Q11d"
    * text = "Ich erfreue mich ausgezeichneter Gesundheit"
    * type = #choice
    * required = true
    * answerOption[0].valueCoding = $SF36CS#agree-definitely-true "Trifft ganz zu"
    * answerOption[+].valueCoding = $SF36CS#agree-mostly-true "Trifft weitgehend zu"
    * answerOption[+].valueCoding = $SF36CS#agree-dont-know "Weiß nicht"
    * answerOption[+].valueCoding = $SF36CS#agree-mostly-false "Trifft weitgehend nicht zu"
    * answerOption[+].valueCoding = $SF36CS#agree-definitely-false "Trifft überhaupt nicht zu"

  * item[+]
    * linkId = "Q11-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string