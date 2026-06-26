Alias: $pssFreqCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-pss-frequency-codesystem

// PSS-4 example QuestionnaireResponse.
// Scores: q1=sometimes(2), q2=rarely(1→reversed=3), q3=often(3→reversed=1), q4=sometimes(2).
// Total = 2 + 3 + 1 + 2 = 8.
Instance: pss4-response-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "PSS-4 Q - Example"
Description: "Example of a completed PSS-4 QuestionnaireResponse with all four items answered and the pre-computed total score. Derived Observation: score = 8 (see pss4-score-example)."

* questionnaire = Canonical(Pss4Questionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-06-20T09:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-pss4-2026-06-20-001"

* item[0]
  * linkId = "pss4"
  * item[0]
    * linkId = "pss4-q1"
    * text = "Wie oft hatten Sie sich im letzten Monat das Gefühl, wichtige Dinge in Ihrem Leben nicht beeinflussen zu können?"
    * answer[0].valueCoding = $pssFreqCS#sometimes "Manchmal"
  * item[+]
    * linkId = "pss4-q1-ordinal"
    * answer[0].valueInteger = 2
  * item[+]
    * linkId = "pss4-q2"
    * text = "Wie oft hatten Sie sich im letzten Monat sicher im Umgang mit persönlichen Aufgaben und Problemen gefühlt?"
    * answer[0].valueCoding = $pssFreqCS#rarely "Selten"
  * item[+]
    * linkId = "pss4-q2-ordinal"
    * answer[0].valueInteger = 1
  * item[+]
    * linkId = "pss4-q3"
    * text = "Wie oft hatten Sie im letzten Monat das Gefühl, dass sich die Dinge nach Ihren Vorstellungen entwickeln?"
    * answer[0].valueCoding = $pssFreqCS#often "Häufig"
  * item[+]
    * linkId = "pss4-q3-ordinal"
    * answer[0].valueInteger = 3
  * item[+]
    * linkId = "pss4-q4"
    * text = "Wie oft hatten Sie im letzten Monat das Gefühl, dass sich die Probleme so aufgestaut haben, dass Sie diese nicht mehr bewältigen können?"
    * answer[0].valueCoding = $pssFreqCS#sometimes "Manchmal"
  * item[+]
    * linkId = "pss4-q4-ordinal"
    * answer[0].valueInteger = 2
  // Total: q1(2) + (4-q2(1)) + (4-q3(3)) + q4(2) = 2+3+1+2 = 8
  * item[+]
    * linkId = "pss4-total-score"
    * answer[0].valueInteger = 8
  * item[+]
    * linkId = "pss4-comment"
    * answer[0].valueString = "Letzter Monat war beruflich stressig."
