Alias: $pssFreqCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-pss-frequency-codesystem
Alias: $calcExp = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression
Alias: $hidden = http://hl7.org/fhir/StructureDefinition/questionnaire-hidden

// PSS-10 Questionnaire.
// Positive items (reversed in scoring — 4 – ordinal): pss10-q4, pss10-q5, pss10-q7, pss10-q8.
// Negative items (used as-is): pss10-q1, pss10-q2, pss10-q3, pss10-q6, pss10-q9, pss10-q10.
// PSS-10 items q2/q4/q5/q10 correspond exactly to PSS-4 items q1/q2/q3/q4.
// Score range: 0–40. Questionnaire.code: LOINC 106875-8.
Instance: Pss10Questionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/Pss10Questionnaire"
* name = "Pss10Questionnaire"
* title = "Perceived Stress Scale (PSS-10)"
* status = #active
* experimental = false
* language = #de
* subjectType = #Patient
* description = "10-item Perceived Stress Scale (PSS-10; LOINC 106875-8) measuring subjective experience of stress over the past four weeks. Scoring: items q4, q5, q7, q8 are positive items reversed (4 – ordinal); items q1, q2, q3, q6, q9, q10 are used as-is. Total score range 0–40; higher scores indicate greater perceived stress."
* copyright = "PSS items reproduced from Cohen, S., Kamarck, T., & Mermelstein, R. (1983). A global measure of perceived stress. Journal of Health and Social Behavior, 24(4), 385–396. The PSS-10 is in the public domain."
* code = http://loinc.org#106875-8 "Perceived stress scale-10 [PSS-10]"

// ============================================================
// Preamble (top-level display item — exempt from comment-sub-item invariant)
// ============================================================
* item[+]
  * linkId = "pss10-intro"
  * text = "Die folgenden Aussagen beziehen sich auf Ihre Gedanken und Gefühle während der letzten vier Wochen. Bitte geben Sie an, wie häufig Sie sich in der angegebenen Weise gefühlt oder verhalten haben:"
  * type = #display

// ============================================================
// PSS-10 group — all items including hidden calculation items
// ============================================================
* item[+]
  * linkId = "pss10"
  * type = #group

  // --- Item 1 (negative) ---
  * item[+]
    * linkId = "pss10-q1"
    * text = "Wie oft hatten Sie sich im letzten Monat darüber aufgeregt, dass etwas völlig Unerwartetes eingetreten ist?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss10-q1-ordinal"
    * text = "PSS-10 Item 1 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss10-q1').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss10-q1').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss10-q1').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss10-q1').answer.valueCoding.code='often',3,4))))"

  // --- Item 2 (negative) — corresponds to PSS-4 item q1 ---
  * item[+]
    * linkId = "pss10-q2"
    * text = "Wie oft hatten Sie im letzten Monat das Gefühl, wichtige Dinge in Ihrem Leben nicht beeinflussen zu können?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss10-q2-ordinal"
    * text = "PSS-10 Item 2 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss10-q2').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss10-q2').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss10-q2').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss10-q2').answer.valueCoding.code='often',3,4))))"

  // --- Item 3 (negative) ---
  * item[+]
    * linkId = "pss10-q3"
    * text = "Wie oft hatten Sie sich im letzten Monat nervös und \"gestresst\" gefühlt?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss10-q3-ordinal"
    * text = "PSS-10 Item 3 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss10-q3').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss10-q3').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss10-q3').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss10-q3').answer.valueCoding.code='often',3,4))))"

  // --- Item 4 (positive — reversed) — corresponds to PSS-4 item q2 ---
  * item[+]
    * linkId = "pss10-q4"
    * text = "Wie oft hatten Sie sich im letzten Monat sicher im Umgang mit persönlichen Aufgaben und Problemen gefühlt?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss10-q4-ordinal"
    * text = "PSS-10 Item 4 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss10-q4').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss10-q4').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss10-q4').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss10-q4').answer.valueCoding.code='often',3,4))))"

  // --- Item 5 (positive — reversed) — corresponds to PSS-4 item q3 ---
  * item[+]
    * linkId = "pss10-q5"
    * text = "Wie oft hatten Sie im letzten Monat das Gefühl, dass sich die Dinge nach Ihren Vorstellungen entwickeln?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss10-q5-ordinal"
    * text = "PSS-10 Item 5 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss10-q5').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss10-q5').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss10-q5').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss10-q5').answer.valueCoding.code='often',3,4))))"

  // --- Item 6 (negative) ---
  * item[+]
    * linkId = "pss10-q6"
    * text = "Wie oft hatten Sie im letzten Monat das Gefühl, mit all den anstehenden Aufgaben und Problemen nicht richtig umgehen zu können?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss10-q6-ordinal"
    * text = "PSS-10 Item 6 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss10-q6').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss10-q6').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss10-q6').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss10-q6').answer.valueCoding.code='often',3,4))))"

  // --- Item 7 (positive — reversed) ---
  * item[+]
    * linkId = "pss10-q7"
    * text = "Wie oft hatten Sie im letzten Monat das Gefühl, mit Ärger in Ihrem Leben klar zu kommen?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss10-q7-ordinal"
    * text = "PSS-10 Item 7 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss10-q7').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss10-q7').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss10-q7').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss10-q7').answer.valueCoding.code='often',3,4))))"

  // --- Item 8 (positive — reversed) ---
  * item[+]
    * linkId = "pss10-q8"
    * text = "Wie oft hatten Sie im letzten Monat das Gefühl, alles im Griff zu haben?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss10-q8-ordinal"
    * text = "PSS-10 Item 8 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss10-q8').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss10-q8').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss10-q8').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss10-q8').answer.valueCoding.code='often',3,4))))"

  // --- Item 9 (negative) ---
  * item[+]
    * linkId = "pss10-q9"
    * text = "Wie oft hatten Sie sich im letzten Monat darüber geärgert, wichtige Dinge nicht beeinflussen zu können?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss10-q9-ordinal"
    * text = "PSS-10 Item 9 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss10-q9').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss10-q9').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss10-q9').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss10-q9').answer.valueCoding.code='often',3,4))))"

  // --- Item 10 (negative) — corresponds to PSS-4 item q4 ---
  * item[+]
    * linkId = "pss10-q10"
    * text = "Wie oft hatten Sie im letzten Monat das Gefühl, dass sich die Probleme so aufgestaut haben, dass Sie diese nicht mehr bewältigen können?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss10-q10-ordinal"
    * text = "PSS-10 Item 10 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss10-q10').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss10-q10').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss10-q10').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss10-q10').answer.valueCoding.code='often',3,4))))"

  // --- Total score (0–40): q1+q2+q3+(4-q4)+(4-q5)+q6+(4-q7)+(4-q8)+q9+q10 ---
  * item[+]
    * linkId = "pss10-total-score"
    * text = "PSS-10 Gesamtscore (0–40)"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "PSS-10 Gesamtscore: q1+q2+q3+(4-q4)+(4-q5)+q6+(4-q7)+(4-q8)+q9+q10"
        * expression = "%resource.repeat(item).where(linkId='pss10-q1-ordinal').answer.valueInteger.first()+%resource.repeat(item).where(linkId='pss10-q2-ordinal').answer.valueInteger.first()+%resource.repeat(item).where(linkId='pss10-q3-ordinal').answer.valueInteger.first()+(4-%resource.repeat(item).where(linkId='pss10-q4-ordinal').answer.valueInteger.first())+(4-%resource.repeat(item).where(linkId='pss10-q5-ordinal').answer.valueInteger.first())+%resource.repeat(item).where(linkId='pss10-q6-ordinal').answer.valueInteger.first()+(4-%resource.repeat(item).where(linkId='pss10-q7-ordinal').answer.valueInteger.first())+(4-%resource.repeat(item).where(linkId='pss10-q8-ordinal').answer.valueInteger.first())+%resource.repeat(item).where(linkId='pss10-q9-ordinal').answer.valueInteger.first()+%resource.repeat(item).where(linkId='pss10-q10-ordinal').answer.valueInteger.first()"

  * item[+]
    * linkId = "pss10-comment"
    * text = "Haben Sie zu Ihren Antworten noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string
