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
  * text = "Wie viele Stunden haben Sie durchschnittlich pro Nacht geschlafen?"
  * answer[0]
    * valueQuantity
      * value = 7
      * unit = "h"
      * system = "http://unitsofmeasure.org"
      * code = #h
    * item[+]
      * linkId = "date"
      * answer[0].valueDate = "2026-03-09"
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Guter Schlaf diese Woche."

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
  * text = "Wie viele Stunden haben Sie durchschnittlich pro Nacht geschlafen?"
  * answer[0]
    * valueQuantity
      * value = 5.5
      * unit = "h"
      * system = "http://unitsofmeasure.org"
      * code = #h
    * item[+]
      * linkId = "date"
      * answer[0].valueDate = "2026-03-10"
    * item[+]
      * linkId = "comment"
      * answer[0].valueString = "Viel Stress diese Woche, kaum geschlafen."
