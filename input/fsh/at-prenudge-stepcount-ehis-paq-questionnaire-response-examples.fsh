Instance: stepcount-ehispaq-normal
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Step Count EHIS PAQ Q - Normal Example"
Description: "Example of a normal step count (5 times a week with 30-59 minutes)."

* questionnaire = Canonical(StepCountEhisPaqQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-24T08:00:00+01:00"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-sc-2026-03-24-101"

* item[+]
  * linkId = "Q2-walking-days"
  * text = "An wie vielen Tagen in einer typischen Woche gehen Sie mindestens 10 Minuten ohne Unterbrechung zu Fuß, um von Ort zu Ort zu gelangen?"
  * answer[+].valueInteger = 5

* item[+]
  * linkId = "Q3-walking-duration"
  * text = "Wie lange gehen Sie an einem typischen Tag zu Fuß, um von Ort zu Ort zu gelangen?"
  * answer[+].valueString = "30–59 Minuten pro Tag"

  * answer[=].item[+]
    * linkId = "Q3-comment"
    * answer[0].valueString = "Im Urlaub üblicherweise das vierfache."

Instance: stepcount-ehispaq-high
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "Step Count EHIS PAQ Q - High Example"
Description: "Example of a high step count (7 times a week with 2-3 hours)."

* questionnaire = Canonical(StepCountEhisPaqQuestionnaire)
* status = #completed
* subject = Reference(Patient/example)
* authored = "2026-03-24T09:15:00+01:00"
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-sc-2026-03-24-102"

* item[+]
  * linkId = "Q2-walking-days"
  * text = "An wie vielen Tagen in einer typischen Woche gehen Sie mindestens 10 Minuten ohne Unterbrechung zu Fuß, um von Ort zu Ort zu gelangen?"
  * answer[+].valueInteger = 7

* item[+]
  * linkId = "Q3-walking-duration"
  * text = "Wie lange gehen Sie an einem typischen Tag zu Fuß, um von Ort zu Ort zu gelangen?"
  * answer[+].valueString = "2 Stunden bis unter 3 Stunden pro Tag"