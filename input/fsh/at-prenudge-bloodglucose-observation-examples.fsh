Instance: bloodglucose-normal-example
InstanceOf: AtPrenudgeObservationBloodGlucose
Usage: #example
Title: "Blood Glucose - Normal Example"
Description: "Beispiel einer normalen Nüchtern-Blutzucker-Messung (95 mg/dL)."

* identifier[+]
  * system = "http://cdehealth.org/fhir/observation-id"
  * value = "bg-2026-02-28-001"
* status = #final
* code = http://loinc.org#1556-0 "Fasting glucose [Mass/volume] in Capillary blood"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-02-28T07:30:00Z"
* method = http://snomed.info/sct#8359006 "Automated"
* valueQuantity
  * value = 95
  * unit = "mg/dL"
  * system = "http://unitsofmeasure.org"
  * code = #mg/dL

Instance: bloodglucose-elevated-example
InstanceOf: AtPrenudgeObservationBloodGlucose
Usage: #example
Title: "Blood Glucose - Elevated Example"
Description: "Beispiel einer erhöhten Nüchtern-Blutzucker-Messung (142 mg/dL), hinweisend auf Diabetes mellitus."

* identifier[+]
  * system = "http://cdehealth.org/fhir/observation-id"
  * value = "bg-2026-02-28-002"
* status = #final
* code = http://loinc.org#1556-0 "Fasting glucose [Mass/volume] in Capillary blood"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-02-28T07:45:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 142
  * unit = "mg/dL"
  * system = "http://unitsofmeasure.org"
  * code = #mg/dL
* note[+].text = "Patient berichtet, gestern Abend spät gegessen zu haben."