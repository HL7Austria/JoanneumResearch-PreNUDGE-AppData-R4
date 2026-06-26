Alias: $pssFreqCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-pss-frequency-codesystem
Alias: $pssCodesCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-pss-codes-codesystem
Alias: $calcExp = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression
Alias: $hidden = http://hl7.org/fhir/StructureDefinition/questionnaire-hidden

// PSS-4 Questionnaire.
// Items pss4-q2 and pss4-q3 are positive items reversed in scoring (4 – raw ordinal).
// Items pss4-q1 and pss4-q4 are negative items used as-is.
// PSS-4 items q1/q2/q3/q4 correspond exactly to PSS-10 items q2/q4/q5/q10.
// Score range: 0–16.
Instance: Pss4Questionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/Pss4Questionnaire"
* name = "Pss4Questionnaire"
* title = "Perceived Stress Scale (PSS-4)"
* status = #active
* experimental = false
* language = #de
* subjectType = #Patient
* description = "4-item short version of the Perceived Stress Scale (PSS-4) measuring subjective experience of stress over the past month. Scoring: items pss4-q2 and pss4-q3 are positive items reversed (4 – ordinal); items pss4-q1 and pss4-q4 are used as-is. Total score range 0–16; higher scores indicate greater perceived stress."
* copyright = "PSS items reproduced from Cohen, S., Kamarck, T., & Mermelstein, R. (1983). A global measure of perceived stress. Journal of Health and Social Behavior, 24(4), 385–396. The PSS-4 is in the public domain."
* code = $pssCodesCS#pss4 "PSS-4 Perceived Stress Scale (4-item)"

// ============================================================
// Preamble (top-level display item — exempt from comment-sub-item invariant)
// ============================================================
* item[+]
  * linkId = "pss4-intro"
  * text = "Diese Fragen beziehen sich auf Ihre Gefühle und Gedanken während des letzten Monats. Wählen Sie aus, WIE HÄUFIG Sie eine bestimmte Art von Gefühlen oder Gedanken hatten."
  * type = #display

// ============================================================
// PSS-4 group — all items including hidden calculation items
// ============================================================
* item[+]
  * linkId = "pss4"
  * type = #group

  // --- Item 1 (negative item — used as-is in scoring) ---
  * item[+]
    * linkId = "pss4-q1"
    * text = "Wie oft hatten Sie sich im letzten Monat das Gefühl, wichtige Dinge in Ihrem Leben nicht beeinflussen zu können?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss4-q1-ordinal"
    * text = "PSS-4 Item 1 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss4-q1').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss4-q1').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss4-q1').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss4-q1').answer.valueCoding.code='often',3,4))))"

  // --- Item 2 (positive item — reversed: 4 – ordinal) ---
  * item[+]
    * linkId = "pss4-q2"
    * text = "Wie oft hatten Sie sich im letzten Monat sicher im Umgang mit persönlichen Aufgaben und Problemen gefühlt?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss4-q2-ordinal"
    * text = "PSS-4 Item 2 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss4-q2').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss4-q2').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss4-q2').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss4-q2').answer.valueCoding.code='often',3,4))))"

  // --- Item 3 (positive item — reversed: 4 – ordinal) ---
  * item[+]
    * linkId = "pss4-q3"
    * text = "Wie oft hatten Sie im letzten Monat das Gefühl, dass sich die Dinge nach Ihren Vorstellungen entwickeln?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss4-q3-ordinal"
    * text = "PSS-4 Item 3 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss4-q3').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss4-q3').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss4-q3').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss4-q3').answer.valueCoding.code='often',3,4))))"

  // --- Item 4 (negative item — used as-is in scoring) ---
  * item[+]
    * linkId = "pss4-q4"
    * text = "Wie oft hatten Sie im letzten Monat das Gefühl, dass sich die Probleme so aufgestaut haben, dass Sie diese nicht mehr bewältigen können?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $pssFreqCS#never "Nie"
    * answerOption[+].valueCoding = $pssFreqCS#rarely "Selten"
    * answerOption[+].valueCoding = $pssFreqCS#sometimes "Manchmal"
    * answerOption[+].valueCoding = $pssFreqCS#often "Häufig"
    * answerOption[+].valueCoding = $pssFreqCS#very-often "Sehr oft"

  * item[+]
    * linkId = "pss4-q4-ordinal"
    * text = "PSS-4 Item 4 Ordinalwert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * expression = "iif(%resource.repeat(item).where(linkId='pss4-q4').answer.valueCoding.code='never',0,iif(%resource.repeat(item).where(linkId='pss4-q4').answer.valueCoding.code='rarely',1,iif(%resource.repeat(item).where(linkId='pss4-q4').answer.valueCoding.code='sometimes',2,iif(%resource.repeat(item).where(linkId='pss4-q4').answer.valueCoding.code='often',3,4))))"

  // --- Total score (0–16): q1 + (4-q2) + (4-q3) + q4 ---
  * item[+]
    * linkId = "pss4-total-score"
    * text = "PSS-4 Gesamtscore (0–16)"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "PSS-4 Gesamtscore: q1 + (4-q2) + (4-q3) + q4"
        * expression = "%resource.repeat(item).where(linkId='pss4-q1-ordinal').answer.valueInteger.first()+(4-%resource.repeat(item).where(linkId='pss4-q2-ordinal').answer.valueInteger.first())+(4-%resource.repeat(item).where(linkId='pss4-q3-ordinal').answer.valueInteger.first())+%resource.repeat(item).where(linkId='pss4-q4-ordinal').answer.valueInteger.first()"

  * item[+]
    * linkId = "pss4-comment"
    * text = "Haben Sie zu Ihren Antworten noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string
