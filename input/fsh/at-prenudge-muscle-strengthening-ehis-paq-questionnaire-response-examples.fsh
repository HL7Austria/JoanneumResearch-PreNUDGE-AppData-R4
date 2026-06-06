// QuestionnaireResponse example for EhisPaqMuscleStrengtheningQuestionnaire.
// Pattern follows at-prenudge-physicalactivitymin-ehispaq-questionnaire-response-examples.fsh
// exactly: InstanceOf by Id, meta.profile, $athisCS valueCoding, answer[+].valueCoding.

Alias: $athisCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers

Instance:   muscle-strengthening-ehis-paq-response-example
InstanceOf: at-prenudge-questionnaireresponse
Usage:      #example
Title:      "EHIS-PAQ Q8 / ATHIS PE8 Muscle Strengthening Q - Example Response (3 Tage pro Woche)"
Description: "Example QuestionnaireResponse for EhisPaqMuscleStrengtheningQuestionnaire: respondent selects 3 days per week of muscle-strengthening exercise."

* meta.profile  = "https://fhir.hl7.at/prenudge/appdata/r4/StructureDefinition/at-prenudge-questionnaireresponse"
* identifier[+]
  * system = "https://www.joanneum.at"
  * value  = "qr-ms-athis-2026-06-01-001"
* questionnaire = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/EhisPaqMuscleStrengtheningQuestionnaire"
* status        = #completed
* subject       = Reference(Patient/example)
* authored      = "2026-06-01T10:00:00+02:00"

// Q8 (≡ ATHIS PE8): 3 Tage pro Woche
* item[+]
  * linkId = "Q8"
  * text   = "An wie vielen Tagen in einer typischen Woche üben Sie körperliche Aktivitäten aus, die speziell für den Aufbau oder die Kräftigung der Muskulatur gedacht sind? Zum Beispiel Krafttraining oder Kräftigungsübungen (mit Gewichten, Thera-Band, eigenem Körpergewicht), Kniebeugen, Liegestützen oder Sit-ups."
  * answer[+]
    * valueCoding = $athisCS#activity-3-days "3 Tage pro Woche"
    * item[+]
      * linkId = "Q8-comment"
      * answer[+].valueString = "Krafttraining Montag, Mittwoch, Freitag."
