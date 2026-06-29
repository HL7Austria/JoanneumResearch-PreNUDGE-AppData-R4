// ==============================================================================
// Questionnaire — EHIS-PAQ Q9 / ATHIS PE9: Sitzen und Ruhen
//
// Faithful digital representation of EHIS-PAQ Q9 / ATHIS PE9.
// Captures total daily sitting or resting time (excluding sleep) as two
// separate integer sub-items (hours and minutes) plus one calculated decimal
// sub-item (Q9-total-hours).
//
// Pattern followed: EhisPaqPhysicalActivityQuestionnaire (Q7 group with
// Q7-hours, Q7-minutes, Q7-total-minutes, Q7-comment sub-items).
//   - InstanceOf: at-prenudge-questionnaire (Id reference)
//   - linkId convention: Q9 (follows Q4–Q8), sub-items Q9-hours, Q9-minutes,
//     Q9-total-hours (calculated), Q9-comment
//   - Intro display item Intro_Q9 is exempt from the comment-sub-item invariant
//     (invariant expression: type = 'display' or ...)
//   - publisher: "The PreNUDGE Consortium"
//   - required = false for each item
//
// StructureMap: SittingHoursQuestionnaireResponseToObservation
//   reads Q9-total-hours (pre-computed by calculatedExpression) → Observation.valueQuantity (h).
//   No evaluate() needed in the map (not supported by MaLaC-HD 1.6.0).
//
// References:
//   Finger JD et al. (2015): https://pubmed.ncbi.nlm.nih.gov/26634120/
//   ATHIS 2025: https://www.statistik.at/fileadmin/pages/2099/ATHIS_2025.pdf
// ==============================================================================

Alias: $calcExpr = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression

Instance:   EhisPaqSittingHoursQuestionnaire
InstanceOf: at-prenudge-questionnaire
Usage:      #definition
Title:      "EHIS-PAQ Q9 / ATHIS PE9: Sitzen und Ruhen"
Description: """EHIS-PAQ Q9 / ATHIS PE9: total time spent sitting or resting on a
typical day (excluding sleep), captured as two integer sub-items (hours 0–23,
minutes 0–60). Mapped to AtPrenudgeObservationSittingHours via
SittingHoursQuestionnaireResponseToObservation (hours + minutes/60 → valueQuantity
in h)."""

* url       = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/EhisPaqSittingHoursQuestionnaire"
* name      = "EhisPaqSittingHoursQuestionnaire"
* title     = "EHIS-PAQ Q9 / ATHIS PE9: Sitzen und Ruhen"
* status    = #active
* publisher = "The PreNUDGE Consortium"

// ─── Intro_Q9: Display introduction (exempt from comment sub-item invariant) ─
// Verbatim EHIS-PAQ Q9 / ATHIS PE9 introductory text.
* item[+]
  * linkId   = "Intro_Q9"
  * type     = #display
  * required = false
  * text     = "Bei der nächsten Frage geht es um die Zeit, die Sie mit Sitzen oder Ruhen verbringen, bei der Arbeit, zu Hause, zur Fortbewegung oder mit Freund:innen, zum Beispiel am Schreibtisch sitzen, mit Freund:innen zusammensitzen."

// ─── Q9 (≡ ATHIS PE9): Sitting / resting hours and minutes per day (#group) ──
// Verbatim question text from EHIS-PAQ Q9 / ATHIS PE9.
// Item code: LOINC 87705-0 "Sedentary activity 24 hour".
// Two integer answer sub-items + one comment sub-item (satisfies invariant).
* item[+]
  * linkId   = "Q9"
  * type     = #group
  * required = true
  * code     = http://loinc.org#87705-0 "Sedentary activity 24 hour"
  * text     = "Wie viel Zeit verbringen Sie insgesamt an einem typischen Tag mit Sitzen oder Ruhen? Die Zeit, die Sie mit Schlafen verbringen, soll ausgeschlossen werden."
  // ── Help / instruction sub-item ──────────────────────────────────────────
  * item[+]
    * linkId   = "Q9-help"
    * type     = #display
    * required = false
    * text     = "Angabe von Stunden und Minuten pro Tag"
  // ── Examples sub-item ────────────────────────────────────────────────────
  * item[+]
    * linkId   = "Q9-examples"
    * type     = #display
    * required = false
    * text     = """Beispiele für „Sitzen und Ruhen" sind: Am Schreibtisch sitzen, Mit der Familie oder mit Freund:innen zusammensitzen, Auto, Bus, Zug fahren, Lesen, Fernsehen"""
  // ── Q9-hours: integer 0–23 ───────────────────────────────────────────────
  * item[+]
    * linkId   = "Q9-hours"
    * type     = #integer
    * required = true
    * text     = "Stunden"
    * extension[+]
      * url          = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 0
    * extension[+]
      * url          = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueInteger = 23
  // ── Q9-minutes: integer 0–60 ─────────────────────────────────────────────
  * item[+]
    * linkId   = "Q9-minutes"
    * type     = #integer
    * required = true
    * text     = "Minuten"
    * extension[+]
      * url          = "http://hl7.org/fhir/StructureDefinition/minValue"
      * valueInteger = 0
    * extension[+]
      * url          = "http://hl7.org/fhir/StructureDefinition/maxValue"
      * valueInteger = 60
  // ── Q9-total-hours: decimal, calculated ─────────────────────────────────
  * item[+]
    // Pre-computed total hours: read by SittingHoursQuestionnaireResponseToObservation
    // instead of using evaluate() (not supported in MaLaC-HD 1.6.0).
    * linkId   = "Q9-total-hours"
    * type     = #decimal
    * readOnly = true
    * text     = "Gesamtstunden pro Tag (berechnet)"
    * extension[$calcExpr]
      * valueExpression
        * language   = #text/fhirpath
        * expression = "(%resource.item.where(linkId='Q9').item.where(linkId='Q9-hours').answer.valueInteger) + (%resource.item.where(linkId='Q9').item.where(linkId='Q9-minutes').answer.valueInteger / 60)"
  // ── Comment (required by at-prenudge-every-item-has-comment invariant) ───
  * item[+]
    * linkId   = "Q9-comment"
    * type     = #string
    * required = false
    * text     = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
