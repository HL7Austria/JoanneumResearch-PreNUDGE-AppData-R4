// ==============================================================================
// Questionnaire A — EHIS-PAQ Q8 / ATHIS PE8 faithful digital representation
//
// Faithful categorical representation of EHIS-PAQ Q8 / ATHIS PE8.
// StructureMap: MuscleStrengtheningEhisPaqQuestionnaireResponseToObservation
//   translates coded day-count answers to numeric {sessions}/wk values
//   (same code-to-value pattern as AlcoholUseQuestionnaire).
//
// Pattern followed: EhisPaqPhysicalActivityQuestionnaire
//   - InstanceOf: at-prenudge-questionnaire (Id reference)
//   - answerOption[+].valueCoding = $athisCS#... (inline, not answerValueSet)
//   - linkId convention: "Q8" (follows Q4, Q5, Q6, Q7 in EhisPaqPhysicalActivityQuestionnaire)
//   - Comment sub-item linkId: "Q8-comment" (follows Q4-comment, Q5-comment pattern)
//   - publisher: "The PreNUDGE Consortium" (follows ATHIS-source questionnaires)
//   - required = false for each item (follows EhisPaqPhysicalActivityQuestionnaire)
//
// References:
//   Finger JD et al. (2015): https://pubmed.ncbi.nlm.nih.gov/26634120/
//   ATHIS 2025: https://www.statistik.at/fileadmin/pages/2099/ATHIS_2025.pdf
// ==============================================================================

Alias: $athisCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers

Instance:   EhisPaqMuscleStrengtheningQuestionnaire
InstanceOf: at-prenudge-questionnaire
Usage:      #definition
Title:      "EHIS-PAQ Q8 / ATHIS PE8: Muskelkräftigungsübungen"
Description: """EHIS-PAQ Q8 / ATHIS PE8: number of
days per week on which the respondent performs physical activities specifically aimed at
building or strengthening muscles (e.g. weight training, resistance-band exercises,
bodyweight exercises, squats, push-ups, sit-ups). Answer options use existing ATHIS
CodeSystem codes activity-1-day through activity-7-days. Two mapping paths to
AtPrenudgeObservationMuscleStrengthening are available: (1) directly from this
questionnaire via MuscleStrengtheningEhisPaqQuestionnaireResponseToObservation
(translates coded day-count to numeric sessions/wk: 1 day = 1 session/wk, …, 7 days
= 7 sessions/wk); (2) via MuscleStrengtheningQuantityQuestionnaire and
MuscleStrengtheningQuestionnaireResponseToObservation when a numeric quantity answer
is preferred."""

* url       = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/EhisPaqMuscleStrengtheningQuestionnaire"
* name      = "EhisPaqMuscleStrengtheningQuestionnaire"
* title     = "EHIS-PAQ Q8 / ATHIS PE8: Muskelkräftigungsübungen"
* status    = #active
* publisher = "The PreNUDGE Consortium"

// ─── Q8 (≡ ATHIS PE8): Muscle-strengthening days per week (#choice) ──────────
// Faithful text from EHIS-PAQ Q8 / ATHIS 2025 PE8.
// Answer options: 7 discrete day-count options (ATHIS CS codes activity-1-day
// through activity-7-days). "Nie oder seltener als einmal pro Woche" is
// intentionally omitted per ATHIS PE8 structure (that option maps to the
// separate PE8a follow-up question; this questionnaire captures the 1–7 range).
* item[+]
  * linkId   = "Q8"
  * type     = #choice
  * required = true
  * text     = "An wie vielen Tagen in einer typischen Woche üben Sie körperliche Aktivitäten aus, die speziell für den Aufbau oder die Kräftigung der Muskulatur gedacht sind? Zum Beispiel Krafttraining oder Kräftigungsübungen (mit Gewichten, Thera-Band, eigenem Körpergewicht), Kniebeugen, Liegestützen oder Sit-ups."
  * answerOption[+].valueCoding = $athisCS#activity-1-day  "1 Tag pro Woche"
  * answerOption[+].valueCoding = $athisCS#activity-2-days "2 Tage pro Woche"
  * answerOption[+].valueCoding = $athisCS#activity-3-days "3 Tage pro Woche"
  * answerOption[+].valueCoding = $athisCS#activity-4-days "4 Tage pro Woche"
  * answerOption[+].valueCoding = $athisCS#activity-5-days "5 Tage pro Woche"
  * answerOption[+].valueCoding = $athisCS#activity-6-days "6 Tage pro Woche"
  * answerOption[+].valueCoding = $athisCS#activity-7-days "7 Tage pro Woche"
  * item[+]
    * linkId   = "Q8-comment"
    * type     = #string
    * required = false
    * text     = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
