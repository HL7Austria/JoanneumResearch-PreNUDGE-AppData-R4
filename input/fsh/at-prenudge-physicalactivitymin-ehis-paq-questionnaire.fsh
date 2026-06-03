Alias: $ehisPaqCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-physicalactivity-codesystem-ehispaq

Instance:   EhisPaqPhysicalActivityQuestionnaire
InstanceOf: at-prenudge-questionnaire
Usage:      #definition
Title:      "EHIS-PAQ: Körperliche Aktivität"
Description: """Questions Q4–Q7 from the European Health Interview Survey Physical Activity
Questionnaire (EHIS-PAQ) covering cycling for transport (Q4–Q5), leisure sport /
physical activity days (Q6), and total leisure physical activity duration (Q7).
Q7 is mapped to Observation via PhysicalActivityQuestionnaireResponseToObservation;
Q4–Q6 are captured only."""

* url       = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/EhisPaqPhysicalActivityQuestionnaire"
* name      = "EhisPaqPhysicalActivityQuestionnaire"
* title     = "EHIS-PAQ: Körperliche Aktivität"
* status    = #active
* publisher = "The PreNUDGE Consortium"
* description = "EHIS-PAQ Q4–Q7. Q7 only is mapped to the AT PreNUDGE Observation Physical Activity profile."

// ─── Q4: Cycling days per week (#choice) ─────────────────────────────────
// No Observation mapping.
* item[+]
  * linkId   = "Q4"
  * type     = #choice
  * required = false
  * text     = "An wie vielen Tagen in einer typischen Woche fahren Sie mindestens 10 Minuten ohne Unterbrechung mit dem Fahrrad, um von Ort zu Ort zu gelangen?"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-never-or-rarely "Nie oder seltener als einmal pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-1-day           "1 Tag pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-2-days          "2 Tage pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-3-days          "3 Tage pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-4-days          "4 Tage pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-5-days          "5 Tage pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-6-days          "6 Tage pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-7-days          "7 Tage pro Woche"
  * item[+]
    * linkId   = "Q4-comment"
    * type     = #string
    * required = false
    * text     = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"

// ─── Q5: Cycling duration per day (#choice) ──────────────────────────────
// Starts at #ehis-10-29-min (cycling filter: ≥ 10 min; #ehis-0-9-min not applicable).
// No Observation mapping.
* item[+]
  * linkId   = "Q5"
  * type     = #choice
  * required = false
  * text     = "Wie lange fahren Sie an einem typischen Tag mit dem Fahrrad, um von Ort zu Ort zu gelangen?"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-10-29-min   "10–29 Minuten pro Tag"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-30-59-min   "30–59 Minuten pro Tag"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-1h-under-2h "1 Stunde bis unter 2 Stunden pro Tag"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-2h-under-3h "2 Stunden bis unter 3 Stunden pro Tag"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-3h-or-more  "3 Stunden pro Tag oder mehr"
  * item[+]
    * linkId   = "Q5-comment"
    * type     = #string
    * required = false
    * text     = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"

// ─── Q6: Leisure sport / PA days per week (#choice) ──────────────────────
// Identical day scale to Q4. No Observation mapping.
* item[+]
  * linkId   = "Q6"
  * type     = #choice
  * required = false
  * text     = "An wie vielen Tagen in einer typischen Woche üben Sie mindestens 10 Minuten ohne Unterbrechung Sport, Fitness oder körperliche Aktivität in der Freizeit aus? Zum Beispiel (Nordic-)Walking, Ballsport, Joggen, Fahrradfahren, Schwimmen, Aerobic, Rudern oder Badminton"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-never-or-rarely "Nie oder seltener als einmal pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-1-day           "1 Tag pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-2-days          "2 Tage pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-3-days          "3 Tage pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-4-days          "4 Tage pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-5-days          "5 Tage pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-6-days          "6 Tage pro Woche"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-7-days          "7 Tage pro Woche"
  * item[+]
    * linkId   = "Q6-comment"
    * type     = #string
    * required = false
    * text     = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"

// ─── Q7: Total leisure PA duration (#group, unchanged) ───────────────────
// Two integer sub-items (Q7-hours, Q7-minutes) + Q7-comment.
// Mapped to component[aggregateActivity] via StructureMap.
* item[+]
  * linkId   = "Q7"
  * type     = #group
  * required = false
  * text     = "Wie viel Zeit verbringen Sie insgesamt in einer typischen Woche mit Sport, Fitness oder körperlicher Aktivität in der Freizeit?"
  * item[+]
    * linkId   = "Q7-hours"
    * type     = #integer
    * required = false
    * text     = "Stunden pro Woche"
    * extension[+]
      * url          = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 0
  * item[+]
    * linkId   = "Q7-minutes"
    * type     = #integer
    * required = false
    * text     = "Minuten pro Woche (zusätzlich zu den Stunden)"
    * extension[+]
      * url          = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 0
    * extension[+]
      * url          = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueInteger = 59
  * item[+]
    * linkId   = "Q7-comment"
    * type     = #string
    * required = false
    * text     = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"