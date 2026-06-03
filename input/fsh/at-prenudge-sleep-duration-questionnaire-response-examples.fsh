Instance: sleep-duration-response-normal-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Sleep Duration Q - Normal Example"
Description: "Example of a self-reported normal average sleep duration (7 h per night)."

* questionnaire = Canonical(SleepDurationQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-10T08:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-sl-2026-03-10-001"

* item[0]
  * linkId = "sleep-duration"
  * text = "Effektive Schlafzeit (Stunden) pro Nacht (0-24): Wie viele Stunden haben Sie während der letzten 4 Wochen pro Nacht (oder wann Sie üblicherweise schlafen) tatsächlich geschlafen? Das muss nicht mit der Anzahl der Stunden, die Sie im Bett verbracht haben, übereinstimmen."
  * answer[0]
    * valueQuantity
      * value = 7
      * unit = "h"
      * system = "http://unitsofmeasure.org"
      * code = #h
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Die letzten Wochen gut geschlafen."

Instance: sleep-duration-response-short-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Sleep Duration Q - Short Example"
Description: "Example of a self-reported short average sleep duration (5.5 h per night)."

* questionnaire = Canonical(SleepDurationQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-11T08:00:00Z"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-sl-2026-03-11-001"

* item[0]
  * linkId = "sleep-duration"
  * text = "Effektive Schlafzeit (Stunden) pro Nacht (0-24): Wie viele Stunden haben Sie während der letzten 4 Wochen pro Nacht (oder wann Sie üblicherweise schlafen) tatsächlich geschlafen? Das muss nicht mit der Anzahl der Stunden, die Sie im Bett verbracht haben, übereinstimmen."
  * answer[0]
    * valueQuantity
      * value = 5.5
      * unit = "h"
      * system = "http://unitsofmeasure.org"
      * code = #h
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Die letzten Wochen viel Stress, kaum geschlafen."
