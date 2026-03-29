Instance: stepcount-normal-example
InstanceOf: AtPrenudgeObservationStepCount
Usage: #example
Title: "Step Count O mapped from Q - Normal Example"
Description: "Example of a normal step count (8,432 steps per day)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-sc-2026-02-28-001"
* status = #final
* code = http://loinc.org#41950-7 "Number of steps in 24 hour Measured"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-02-27"
* issued = "2026-02-28T20:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 8432
  * unit = "{steps}/d"
  * system = "http://unitsofmeasure.org"
  * code = #{steps}/d
* note[+].text = "Normaler Arbeitstag mit Spaziergang in der Mittagspause."
* derivedFrom = Reference(QuestionnaireResponse/stepcount-quantity-response-normal-example)

Instance: stepcount-high-example
InstanceOf: AtPrenudgeObservationStepCount
Usage: #example
Title: "Step Count O mapped from Q - High Example"
Description: "Example of a high step count (133,519 steps per day)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-sc-2026-02-28-002"
* status = #final
* code = http://loinc.org#41950-7 "Number of steps in 24 hour Measured"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-02-28"
* issued = "2026-03-01T20:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 133519
  * unit = "{steps}/d"
  * system = "http://unitsofmeasure.org"
  * code = #{steps}/d
* note[+].text = "Könnte bitte jemand überprüfen ob das ein Weltrekord wäre?"
* derivedFrom = Reference(QuestionnaireResponse/stepcount-quantity-response-high-example)

Instance: stepcount-sedentary-example
InstanceOf: AtPrenudgeObservationStepCount
Usage: #example
Title: "Step Count O - Sedentary Example"
Description: "Example of a low step count (1,204 steps per day), typical for a mostly sedentary day."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-sc-2026-03-03-001"
* status = #final
* code = http://loinc.org#41950-7 "Number of steps in 24 hour Measured"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-03"
* issued = "2026-03-28T20:00:00Z"
* method = http://snomed.info/sct#8359006 "Automated"
* valueQuantity
  * value = 1204
  * unit = "{steps}/d"
  * system = "http://unitsofmeasure.org"
  * code = #{steps}/d
* note[+].text = "Home-Office Tag, kaum Bewegung."