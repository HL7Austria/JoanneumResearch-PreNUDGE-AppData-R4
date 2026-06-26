Alias: $pssFreqCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-pss-frequency-codesystem

// PSS-10 example QuestionnaireResponse.
// Item values: q1=sometimes(2), q2=rarely(1), q3=often(3),
//   q4=sometimes(2→rev=2), q5=rarely(1→rev=3), q6=sometimes(2),
//   q7=often(3→rev=1), q8=sometimes(2→rev=2), q9=rarely(1), q10=sometimes(2).
// Total = 2+1+3+2+3+2+1+2+1+2 = 19.
Instance: pss10-response-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "PSS-10 Q - Example"
Description: "Example of a completed PSS-10 QuestionnaireResponse with all ten items answered and the pre-computed total score. Derived Observation: score = 19 (see pss10-score-example)."

* questionnaire = Canonical(Pss10Questionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-06-20T09:05:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-pss10-2026-06-20-001"

* item[0]
  * linkId = "pss10"
  * item[0]
    * linkId = "pss10-q1"
    * answer[0].valueCoding = $pssFreqCS#sometimes "Manchmal"
  * item[+]
    * linkId = "pss10-q1-ordinal"
    * answer[0].valueInteger = 2
  * item[+]
    * linkId = "pss10-q2"
    * answer[0].valueCoding = $pssFreqCS#rarely "Selten"
  * item[+]
    * linkId = "pss10-q2-ordinal"
    * answer[0].valueInteger = 1
  * item[+]
    * linkId = "pss10-q3"
    * answer[0].valueCoding = $pssFreqCS#often "Häufig"
  * item[+]
    * linkId = "pss10-q3-ordinal"
    * answer[0].valueInteger = 3
  * item[+]
    * linkId = "pss10-q4"
    * answer[0].valueCoding = $pssFreqCS#sometimes "Manchmal"
  * item[+]
    * linkId = "pss10-q4-ordinal"
    * answer[0].valueInteger = 2
  * item[+]
    * linkId = "pss10-q5"
    * answer[0].valueCoding = $pssFreqCS#rarely "Selten"
  * item[+]
    * linkId = "pss10-q5-ordinal"
    * answer[0].valueInteger = 1
  * item[+]
    * linkId = "pss10-q6"
    * answer[0].valueCoding = $pssFreqCS#sometimes "Manchmal"
  * item[+]
    * linkId = "pss10-q6-ordinal"
    * answer[0].valueInteger = 2
  * item[+]
    * linkId = "pss10-q7"
    * answer[0].valueCoding = $pssFreqCS#often "Häufig"
  * item[+]
    * linkId = "pss10-q7-ordinal"
    * answer[0].valueInteger = 3
  * item[+]
    * linkId = "pss10-q8"
    * answer[0].valueCoding = $pssFreqCS#sometimes "Manchmal"
  * item[+]
    * linkId = "pss10-q8-ordinal"
    * answer[0].valueInteger = 2
  * item[+]
    * linkId = "pss10-q9"
    * answer[0].valueCoding = $pssFreqCS#rarely "Selten"
  * item[+]
    * linkId = "pss10-q9-ordinal"
    * answer[0].valueInteger = 1
  * item[+]
    * linkId = "pss10-q10"
    * answer[0].valueCoding = $pssFreqCS#sometimes "Manchmal"
  * item[+]
    * linkId = "pss10-q10-ordinal"
    * answer[0].valueInteger = 2
  // Total: q1(2)+q2(1)+q3(3)+(4-q4(2))+(4-q5(1))+q6(2)+(4-q7(3))+(4-q8(2))+q9(1)+q10(2)
  //      = 2+1+3+2+3+2+1+2+1+2 = 19
  * item[+]
    * linkId = "pss10-total-score"
    * answer[0].valueInteger = 19
  * item[+]
    * linkId = "pss10-comment"
    * answer[0].valueString = "Berufliche und familiäre Anforderungen waren im letzten Monat erhöht."
