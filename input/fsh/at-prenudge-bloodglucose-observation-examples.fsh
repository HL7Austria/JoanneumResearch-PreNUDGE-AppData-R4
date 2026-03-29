Instance: bloodglucose-normal-example
InstanceOf: AtPrenudgeObservationBloodGlucose
Usage: #example
Title: "Blood Glucose O mapped from Q - Normal Example"
Description: "Example of a normal fasting blood glucose measurement (95 mg/dL)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-bg-2026-02-28-001"
* status = #final
* code = http://loinc.org#1556-0 "Fasting glucose [Mass/volume] in Capillary blood"
* subject = Reference(Patient/example)
* issued = "2026-02-28T07:31:00Z"
* effectiveDateTime = "2026-02-28T07:30:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 95
  * unit = "mg/dL"
  * system = "http://unitsofmeasure.org"
  * code = #mg/dL
* component[mealContext]
  * code = http://snomed.info/sct#309602000 "Temporal periods relating to feeding and eating"
  * valueCodeableConcept
    * coding[0] = http://snomed.info/sct#16985007 "Fasting"
* note[+].text = "Sechzehn Stunden nichts gegessen."
* derivedFrom = Reference(QuestionnaireResponse/bloodglucose-response-normal-example)

Instance: bloodglucose-elevated-example
InstanceOf: AtPrenudgeObservationBloodGlucose
Usage: #example
Title: "Blood Glucose O mapped from Q - Elevated Example"
Description: "Example of an elevated fasting blood glucose measurement (142 mg/dL), indicating diabetes mellitus."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-bg-2026-02-28-002"
* status = #final
* code = http://loinc.org#1556-0 "Fasting glucose [Mass/volume] in Capillary blood"
* subject = Reference(Patient/example)
* issued = "2026-02-28T22:31:00Z"
* effectiveDateTime = "2026-02-28T21:45:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 142
  * unit = "mg/dL"
  * system = "http://unitsofmeasure.org"
  * code = #mg/dL
* component[mealContext]
  * code = http://snomed.info/sct#309602000 "Temporal periods relating to feeding and eating"
  * valueCodeableConcept
    * coding[0] = http://snomed.info/sct#24863003 "Postprandial"
* note[+].text = "Patient berichtet, gestern Abend spät gegessen zu haben."
* derivedFrom = Reference(QuestionnaireResponse/bloodglucose-response-elevated-example)

Instance: bloodglucose-low-example
InstanceOf: AtPrenudgeObservationBloodGlucose
Usage: #example
Title: "Blood Glucose O - Low Example"
Description: "Example of a low fasting blood glucose measurement (62 mg/dL), indicating hypoglycemia."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-bg-2026-03-03-001"
* status = #final
* code = http://loinc.org#1556-0 "Fasting glucose [Mass/volume] in Capillary blood"
* subject = Reference(Patient/example)
* issued = "2026-03-03T10:31:00Z"
* effectiveDateTime = "2026-03-03T06:15:00Z"
* method = http://snomed.info/sct#8359006 "Automated"
* valueQuantity
  * value = 62
  * unit = "mg/dL"
  * system = "http://unitsofmeasure.org"
  * code = #mg/dL
* component[mealContext]
  * code = http://snomed.info/sct#309602000 "Temporal periods relating to feeding and eating"
  * valueCodeableConcept
    * coding[0] = http://snomed.info/sct#307165006 "Before meal"
* note[+].text = "Patient fühlt sich schwindelig und zittrig."