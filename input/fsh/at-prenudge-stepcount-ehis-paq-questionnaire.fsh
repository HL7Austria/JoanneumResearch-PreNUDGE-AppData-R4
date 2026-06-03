Alias: $ehisPaqCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-physicalactivity-codesystem-ehispaq

Instance: StepCountEhisPaqQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/StepCountEhisPaqQuestionnaire"
* name = "StepCountEhisPaqQuestionnaire"
* title = "EHIS-PAQ: Zu-Fuß-Gehen"
* status = #active
* experimental = false
* subjectType[0] = #Patient
* description = "The questions Q2 and Q3 from the EHIS-PAQ about the number of days and duration of walking (for transport) in a typical week."

// ─── Q2: Walking days per week (integer, no coded answers) ────────────────
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

// ─── Q3: Walking duration per day (choice, UPDATED to valueCoding) ────────
// Previously used valueString; now uses valueCoding from at-prenudge-physicalactivity-codesystem-ehispaq.
// ("0–9 Minuten") is included here because walkers may report < 10 min/day.
* item[+]
  * linkId = "Q3-walking-duration"
  * text = "Wie lange gehen Sie an einem typischen Tag zu Fuß, um von Ort zu Ort zu gelangen?"
  * type = #choice
  * required = true
  * repeats = false

  * answerOption[+].valueCoding = $ehisPaqCS#ehis-0-9-min     "0–9 Minuten pro Tag"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-10-29-min   "10–29 Minuten pro Tag"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-30-59-min   "30–59 Minuten pro Tag"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-1h-under-2h "1 Stunde bis unter 2 Stunden pro Tag"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-2h-under-3h "2 Stunden bis unter 3 Stunden pro Tag"
  * answerOption[+].valueCoding = $ehisPaqCS#ehis-3h-or-more  "3 Stunden pro Tag oder mehr"
 
  * item[+]
    * linkId = "Q3-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string