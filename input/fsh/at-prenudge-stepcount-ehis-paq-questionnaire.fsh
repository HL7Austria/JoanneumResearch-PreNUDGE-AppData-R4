Alias: $athisCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers

Instance: StepCountEhisPaqQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition
Title:      "EHIS-PAQ/ATHIS: Zu-Fuß-Gehen"
Description: """Questions Q2–Q3 from the European Health Interview Survey Physical Activity
Questionnaire (EHIS-PAQ), equivalent to ATHIS PE2–PE3: number of days per week on
which the respondent walks for transport (Q2/PE2, integer 0–7) and the typical
duration of that walking per day (Q3/PE3, coded using ATHIS group 9 answer set)."""

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/StepCountEhisPaqQuestionnaire"
* name = "StepCountEhisPaqQuestionnaire"
* title = "EHIS-PAQ/ATHIS: Zu-Fuß-Gehen"
* status = #active
* experimental = false
* subjectType[0] = #Patient
* description = "EHIS-PAQ Q2–Q3 (equivalent to ATHIS PE2–PE3): number of days per week (Q2/PE2) and duration per day (Q3/PE3) of walking for transport in a typical week."

// ─── Q2 (≡ ATHIS PE2): Walking days per week (integer, no coded answers) ─
// Type integer; values 0–7. No coding needed; not changed.
* item[+]
  * linkId = "Q2-walking-days"
  * text = "An wie vielen Tagen in einer typischen Woche gehen Sie mindestens 10 Minuten ohne Unterbrechung zu Fuß, um von Ort zu Ort zu gelangen?"
  * type = #integer
  * required = true
  * repeats = false
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/minValue"
    * valueDecimal = 0
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
    * valueDecimal = 7

  * item[+]
    * linkId = "Q2-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

// ─── Q3 (≡ ATHIS PE3): Walking duration per day (choice, ATHIS group 9) ──
// ATHIS group 9 duration starts at #activity-10-29-min; no 0–9 min code available.
* item[+]
  * linkId = "Q3-walking-duration"
  * text = "Wie lange gehen Sie an einem typischen Tag zu Fuß, um von Ort zu Ort zu gelangen?"
  * type = #choice
  * required = true
  * repeats = false

  * answerOption[+].valueCoding = $athisCS#activity-10-29-min   "10 bis 29 Minuten pro Tag"
  * answerOption[+].valueCoding = $athisCS#activity-30-59-min   "30 bis 59 Minuten pro Tag"
  * answerOption[+].valueCoding = $athisCS#activity-1h-under-2h "1 Stunde bis unter 2 Stunden pro Tag"
  * answerOption[+].valueCoding = $athisCS#activity-2h-under-3h "2 Stunden bis unter 3 Stunden pro Tag"
  * answerOption[+].valueCoding = $athisCS#activity-3h-or-more  "3 Stunden pro Tag oder mehr"

  * item[+]
    * linkId = "Q3-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string
