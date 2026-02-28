Instance: stepcount-normal-example
InstanceOf: AtPrenudgeObservationStepCount
Usage: #example
Title: "Step Count - Normal Example"
Description: "Beispiel einer normalen Schrittzahl (8,432 Schritte pro Tag)."

* identifier[+]
  * system = "http://cdehealth.org/fhir/observation-id"
  * value = "sc-2026-02-28-001"
* status = #final
* code = http://loinc.org#41950-7 "Number of steps in 24 hour Measured"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-02-28"
* method = http://snomed.info/sct#8359006 "Automated"
* valueQuantity
  * value = 8432
  * unit = "{steps}/d"
  * system = "http://unitsofmeasure.org"
  * code = #{steps}/d

Instance: stepcount-low-example
InstanceOf: AtPrenudgeObservationStepCount
Usage: #example
Title: "Step Count - Low Example"
Description: "Beispiel einer niedrigen Schrittzahl (2,150 Schritte pro Tag), hinweisend auf Bewegungsmangel."

* identifier[+]
  * system = "http://cdehealth.org/fhir/observation-id"
  * value = "sc-2026-02-28-002"
* status = #final
* code = http://loinc.org#41950-7 "Number of steps in 24 hour Measured"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-02-28"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 133519
  * unit = "{steps}/d"
  * system = "http://unitsofmeasure.org"
  * code = #{steps}/d
* note[+].text = "Könnte bitte jemand überprüfen ob das ein Weltrekord wäre?"
