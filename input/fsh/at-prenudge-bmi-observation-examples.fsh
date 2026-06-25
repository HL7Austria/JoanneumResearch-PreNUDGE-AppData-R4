Alias: $observation-category = http://terminology.hl7.org/CodeSystem/observation-category

Instance: bodyheight-example
InstanceOf: AtPrenudgeObservationBodyHeight
Usage: #example
Title: "Body Height O - Example"
Description: "Example body height Observation derived from a BMI questionnaire response."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-bodyheight-2026-03-20-001"
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#8302-2 "Body height"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-20T09:00:00Z"
* issued = "2026-03-20T09:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 180
  * unit = "cm"
  * system = "http://unitsofmeasure.org"
  * code = #cm
* derivedFrom = Reference(QuestionnaireResponse/bmi-questionnaire-response-example)

Instance: bodyweight-example
InstanceOf: AtPrenudgeObservationBodyWeight
Usage: #example
Title: "Body Weight O - Example"
Description: "Example body weight Observation derived from a BMI questionnaire response."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-bodyweight-2026-03-20-001"
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#29463-7 "Body weight"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-20T09:00:00Z"
* issued = "2026-03-20T09:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 81
  * unit = "kg"
  * system = "http://unitsofmeasure.org"
  * code = #kg
* derivedFrom = Reference(QuestionnaireResponse/bmi-questionnaire-response-example)

Instance: bmi-example
InstanceOf: AtPrenudgeObservationBodyMassIndex
Usage: #example
Title: "Body Mass Index O - Example"
Description: "Example BMI Observation derived from a BMI questionnaire response."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-bmi-2026-03-20-001"
* status = #final
* category = $observation-category#vital-signs "Vital Signs"
* code = http://loinc.org#39156-5 "Body mass index (BMI) [Ratio]"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-20T09:00:00Z"
* issued = "2026-03-20T09:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 25.0
  * unit = "kg/m2"
  * system = "http://unitsofmeasure.org"
  * code = #kg/m2
* derivedFrom = Reference(QuestionnaireResponse/bmi-questionnaire-response-example)