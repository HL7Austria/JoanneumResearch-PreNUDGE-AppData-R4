// ==============================================================================
// Questionnaire B — Muscle Strengthening Sessions, direct numeric input
//
// Purpose: enables direct FML mapping (QuestionnaireResponse → Observation)
// without code translation. Operationalises the same clinical concept as
// EhisPaqMuscleStrengtheningQuestionnaire but with item.type = #quantity
// so the answer is a discrete number that maps verbatim to
// Observation.valueQuantity.
//
// Pattern followed: SleepDurationQuestionnaire (at-prenudge-sleep-duration-questionnaire.fsh)
//   - InstanceOf: AtPrenudgeQuestionnaire (name reference)
//   - item.type = #quantity
//   - questionnaire-unitOption extension with UCUM valueCoding
//   - minValue / maxValue extensions with valueDecimal
//   - comment sub-item linkId = "comment" (matches sleep / step-count pattern)
//   - experimental = false, subjectType = #Patient
//
// Question text derivation:
//   The sleep duration text pattern ("Effektive Schlafzeit ... pro Nacht (0-24):
//   Wie viele Stunden haben Sie ...") was the model. The muscle-strengthening
//   text directly asks for a count (Trainingseinheiten / sessions), names the clinical concept, and gives examples —
//   without reusing the categorical ATHIS PE8 / Q8 wording ("An wie vielen Tagen
//   in einer typischen Woche ...").
//
// linkId: "muscle-strengthening-sessions"
//   Used verbatim in the StructureMap group
//   MuscleStrengtheningQuestionnaireResponseToObservation.
//
// References:
//   Finger JD et al. (2015): https://pubmed.ncbi.nlm.nih.gov/26634120/
//   ATHIS 2025: https://www.statistik.at/fileadmin/pages/2099/ATHIS_2025.pdf
// ==============================================================================

Instance: MuscleStrengtheningQuantityQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/MuscleStrengtheningQuantityQuestionnaire"
* name = "MuscleStrengtheningQuantityQuestionnaire"
* title = "Muskelkräftigungs-Trainingseinheiten pro Woche (numerisch)"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "A numeric questionnaire for directly entering the number of muscle-strengthening exercise sessions per week. Designed for direct FML mapping to the AT PreNUDGE Observation Muscle Strengthening Sessions profile via MuscleStrengtheningQuestionnaireResponseToObservation. Use EhisPaqMuscleStrengtheningQuestionnaire for the categorical EHIS-PAQ Q8 / ATHIS PE8 representation."

* item[+]
  * linkId = "muscle-strengthening-sessions"
  * code = http://loinc.org#82291-6 "Frequency of muscle-strengthening physical activity"
  * text = "Wie viele Einheiten Muskelkräftigungsübungen (z.B. Krafttraining, Kräftigungsübungen mit Gewichten, Thera-Band oder eigenem Körpergewicht) absolvieren Sie typischerweise pro Woche?"
  * type = #quantity
  * required = true
  * repeats = false
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/questionnaire-unitOption"
    * valueCoding
      * system = "http://unitsofmeasure.org"
      * code = #{sessions}/wk
      * display = "{sessions}/wk"
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/minValue"
    * valueDecimal = 0
  * item[+]
    * linkId = "comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string
