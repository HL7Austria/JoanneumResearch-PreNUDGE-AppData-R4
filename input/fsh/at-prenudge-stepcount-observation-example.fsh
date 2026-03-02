Instance: stepcount-normal-example
InstanceOf: AtPrenudgeObservationStepCount
Usage: #example
Title: "Step Count O - Normal Example"
Description: "Beispiel einer normalen Schrittzahl (8,432 Schritte pro Tag)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-sc-2026-02-28-001"
* status = #final
* code = http://loinc.org#41950-7 "Number of steps in 24 hour Measured"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-02-28T20:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 8432
  * unit = "{steps}/d"
  * system = "http://unitsofmeasure.org"
  * code = #{steps}/d
* note[+].text = "Normaler Arbeitstag mit Spaziergang in der Mittagspause."

Instance: stepcount-low-example
InstanceOf: AtPrenudgeObservationStepCount
Usage: #example
Title: "Step Count O - High Example"
Description: "Beispiel einer hohen Schrittzahl (133,519 Schritte pro Tag)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-sc-2026-02-28-002"
* status = #final
* code = http://loinc.org#41950-7 "Number of steps in 24 hour Measured"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-02-28T20:15:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 133519
  * unit = "{steps}/d"
  * system = "http://unitsofmeasure.org"
  * code = #{steps}/d
* note[+].text = "Könnte bitte jemand überprüfen ob das ein Weltrekord wäre?"