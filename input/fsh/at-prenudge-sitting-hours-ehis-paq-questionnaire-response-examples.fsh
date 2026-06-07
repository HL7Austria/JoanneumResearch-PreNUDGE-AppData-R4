// QuestionnaireResponse example for EhisPaqSittingHoursQuestionnaire.
// Pattern follows at-prenudge-physicalactivitymin-ehispaq-questionnaire-response-examples.fsh
// (Q7 group with integer sub-items) exactly.
//
// Patient reports 6 hours 0 minutes sitting/resting per day (excluding sleep).
// The derived Observation sitting-hours-questionnaire-derived-example carries the
// computed value 6.0 h (= 6 + 0/60) and references this QR via derivedFrom.

Instance:   sitting-hours-ehis-paq-response-example
InstanceOf: at-prenudge-questionnaireresponse
Usage:      #example
Title:      "EHIS-PAQ Q9 / ATHIS PE9 Sitting Hours Q – Example Response"
Description: "Example QuestionnaireResponse for EhisPaqSittingHoursQuestionnaire: respondent reports 6 hours and 0 minutes of sitting or resting per day (sleep excluded). Corresponds to sitting-hours-questionnaire-derived-example (6.0 h) via SittingHoursQuestionnaireResponseToObservation."

* meta.profile  = "https://fhir.hl7.at/prenudge/appdata/r4/StructureDefinition/at-prenudge-questionnaireresponse"
* identifier[+]
  * system = "https://www.joanneum.at"
  * value  = "qr-sh-2026-06-06-001"
* questionnaire = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/EhisPaqSittingHoursQuestionnaire"
* status        = #completed
* subject       = Reference(Patient/example)
* authored      = "2026-06-06T09:00:00+02:00"

// Q9 is type=#group; sub-items appear directly under item.item[] (FHIR R4 group pattern).
// Intro_Q9 is type=#display and carries no answer — omitted from QR response.
* item[+]
  * linkId = "Q9"
  * item[+]
    * linkId = "Q9-hours"
    * answer[+].valueInteger = 6
  * item[+]
    * linkId = "Q9-minutes"
    * answer[+].valueInteger = 0
  * item[+]
    * linkId = "Q9-comment"
    * answer[+].valueString = ""
