Alias: $athisCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers

Instance:   physical-activity-ehispaq-response-example
InstanceOf: at-prenudge-questionnaireresponse
Usage:      #example
Title:      "EHIS-PAQ Q7 / ATHIS PE7 Physical Activity - Example Response"
Description: """Example EHIS-PAQ Q7 / ATHIS PE7 physical activity questionnaire response:
Q4 = 3 Tage pro Woche (Fahrrad, Transport),
Q5 = 30 bis 59 Minuten pro Tag (Fahrrad),
Q6 = 5 Tage pro Woche (Freizeit-Sport),
Q7 = 2 Stunden 30 Minuten (= 150 min/Woche).
Q7 maps to physical-activity-questionnaire-example via the StructureMap."""

* meta.profile  = "https://fhir.hl7.at/prenudge/appdata/r4/StructureDefinition/at-prenudge-questionnaireresponse"
* identifier[+]
  * system = "https://www.joanneum.at"
  * value  = "qr-pa-2026-03-24-001"
* questionnaire = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/EhisPaqPhysicalActivityQuestionnaire"
* status        = #completed
* subject       = Reference(Patient/example)
* authored      = "2026-03-24T08:00:00+01:00"

// Q4: 3 Tage pro Woche (Fahrrad, Transport)
* item[+]
  * linkId = "Q4"
  * text   = "An wie vielen Tagen in einer typischen Woche fahren Sie mindestens 10 Minuten ohne Unterbrechung mit dem Fahrrad, um von Ort zu Ort zu gelangen?"
  * answer[+]
    * valueCoding = $athisCS#activity-3-days "3 Tage pro Woche"
    * item[+]
      * linkId = "Q4-comment"
      * answer[+].valueString = ""

// Q5: 30 bis 59 Minuten pro Tag (Fahrrad)
* item[+]
  * linkId = "Q5"
  * text   = "Wie lange fahren Sie an einem typischen Tag mit dem Fahrrad, um von Ort zu Ort zu gelangen?"
  * answer[+]
    * valueCoding = $athisCS#activity-30-59-min "30 bis 59 Minuten pro Tag"
    * item[+]
      * linkId = "Q5-comment"
      * answer[+].valueString = ""

// Q6: 5 Tage pro Woche (Freizeit-Sport)
* item[+]
  * linkId = "Q6"
  * text   = "An wie vielen Tagen in einer typischen Woche üben Sie mindestens 10 Minuten ohne Unterbrechung Sport, Fitness oder körperliche Aktivität in der Freizeit aus? Zum Beispiel (Nordic-)Walking, Ballsport, Joggen, Fahrradfahren, Schwimmen, Aerobic, Rudern oder Badminton"
  * answer[+]
    * valueCoding = $athisCS#activity-5-days "5 Tage pro Woche"
    * item[+]
      * linkId = "Q6-comment"
      * answer[+].valueString = ""

// Q7: 2 Stunden 30 Minuten = 150 min/Woche
// Q7 is #group; sub-items appear directly under item.item[] (FHIR R4 group pattern).
// Q7-total-minutes is the calculatedExpression result: (2 × 60) + 30 = 150.
* item[+]
  * linkId = "Q7"
  * item[+]
    * linkId = "Q7-hours"
    * answer[+].valueInteger = 2
  * item[+]
    * linkId = "Q7-minutes"
    * answer[+].valueInteger = 30
  * item[+]
    * linkId = "Q7-total-minutes"
    * answer[+].valueInteger = 150
  * item[+]
    * linkId = "Q7-comment"
    * answer[+].valueString = ""
