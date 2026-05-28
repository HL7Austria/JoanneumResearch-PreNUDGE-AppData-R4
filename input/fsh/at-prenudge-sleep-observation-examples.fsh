Instance: sleep-duration-normal-automated-example
InstanceOf: AtPrenudgeObservationSleepDuration
Usage: #example
Title: "Sleep Duration O - Normal Automated Example"
Description: "Example of a normal average sleep duration (7.5 h) measured by a wearable device."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-sl-2026-03-10-001"
* status = #final
* code = http://loinc.org#93832-4 "Sleep duration"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-10"
* issued = "2026-03-10T07:00:00Z"
* method = http://snomed.info/sct#8359006 "Automated"
* valueQuantity
  * value = 7.5
  * unit = "h"
  * system = "http://unitsofmeasure.org"
  * code = #h
* note[+].text = "Automatisch von Wearable gemessen."

Instance: sleep-duration-normal-manual-example
InstanceOf: AtPrenudgeObservationSleepDuration
Usage: #example
Title: "Sleep Duration O mapped from Q - Normal Example"
Description: "Example of a self-reported average sleep duration (7 h) derived from a questionnaire response."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-sl-2026-03-10-001"
* status = #final
* code = http://loinc.org#93832-4 "Sleep duration"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-09"
* issued = "2026-03-10T08:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 7
  * unit = "h"
  * system = "http://unitsofmeasure.org"
  * code = #h
* note[+].text = "Selbstberichtet."
* derivedFrom = Reference(QuestionnaireResponse/sleep-duration-response-normal-example)

Instance: sleep-duration-short-automated-example
InstanceOf: AtPrenudgeObservationSleepDuration
Usage: #example
Title: "Sleep Duration O - Short Automated Example"
Description: "Example of a short average sleep duration (5.5 h) measured by a wearable device, indicating insufficient sleep."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-sl-2026-03-11-001"
* status = #final
* code = http://loinc.org#93832-4 "Sleep duration"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-11"
* issued = "2026-03-11T07:00:00Z"
* method = http://snomed.info/sct#8359006 "Automated"
* valueQuantity
  * value = 5.5
  * unit = "h"
  * system = "http://unitsofmeasure.org"
  * code = #h
* note[+].text = "Kurze Schlafdauer, möglicherweise Schlafmangel."
