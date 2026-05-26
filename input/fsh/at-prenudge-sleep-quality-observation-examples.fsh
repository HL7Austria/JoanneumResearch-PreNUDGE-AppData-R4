Instance: sleep-quality-satisfied-example
InstanceOf: AtPrenudgeObservationSleepQuality
Usage: #example
Title: "Sleep Quality O mapped from Q - Satisfied Example"
Description: "Example of a sleep quality observation indicating satisfaction with sleep (S4 - Zufrieden), derived from the standalone SleepQualityQuestionnaire."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-slq-2026-03-10-001"
* status = #final
* code = http://loinc.org#61987-4 "Sleep quality"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-10T08:00:00Z"
* issued = "2026-03-10T08:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueCodeableConcept
  * coding[0] = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/whoqol-bref-scale#S4 "Zufrieden"
* derivedFrom = Reference(QuestionnaireResponse/sleep-quality-response-satisfied-example)

Instance: sleep-quality-dissatisfied-example
InstanceOf: AtPrenudgeObservationSleepQuality
Usage: #example
Title: "Sleep Quality O mapped from Q - Dissatisfied Example"
Description: "Example of a sleep quality observation indicating dissatisfaction with sleep (S2 - Unzufrieden), derived from the standalone SleepQualityQuestionnaire."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-slq-2026-03-11-001"
* status = #final
* code = http://loinc.org#61987-4 "Sleep quality"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-11T08:00:00Z"
* issued = "2026-03-11T08:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueCodeableConcept
  * coding[0] = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/whoqol-bref-scale#S2 "Unzufrieden"
* note[+].text = "Schlafe schlecht wegen Stress."
* derivedFrom = Reference(QuestionnaireResponse/sleep-quality-response-dissatisfied-example)
