// QuestionnaireResponse example for MuscleStrengtheningQuantityQuestionnaire.
// Pattern follows at-prenudge-sleep-duration-questionnaire-response-examples.fsh
// and at-prenudge-stepcount-quantity-questionnaire-response-examples.fsh exactly.
//
// This instance is referenced by muscle-strengthening-questionnaire-derived-example
// (at-prenudge-muscle-strengthening-observation-examples.fsh) via derivedFrom.

Instance: muscle-strengthening-quantity-response-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Muscle Strengthening Sessions Q - Example (3 sessions/wk)"
Description: "Example QuestionnaireResponse for MuscleStrengtheningQuantityQuestionnaire: respondent reports 3 muscle-strengthening exercise sessions per week."

* questionnaire = Canonical(MuscleStrengtheningQuantityQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-06-01T10:00:00+02:00"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-ms-2026-06-01-001"

* item[0]
  * linkId = "muscle-strengthening-sessions"
  * text = "Wie viele Einheiten Muskelkräftigungsübungen (z.B. Krafttraining, Kräftigungsübungen mit Gewichten, Thera-Band oder eigenem Körpergewicht) absolvieren Sie typischerweise pro Woche?"
  * answer[0]
    * valueQuantity
      * value = 3
      * unit = "{sessions}/wk"
      * system = "http://unitsofmeasure.org"
      * code = #{sessions}/wk
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Krafttraining Montag, Mittwoch, Freitag."
