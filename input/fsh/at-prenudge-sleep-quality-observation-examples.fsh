Instance: sleep-quality-satisfied-example
InstanceOf: AtPrenudgeObservationSleepQuality
Usage: #example
Title: "Sleep Quality O mapped from Q - Satisfied Example"
Description: "Example of a sleep quality observation indicating good sleep satisfaction (LA8967-7 - Good), derived from the standalone SleepQualityQuestionnaire (S4 - Zufrieden mapped to LOINC)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-slq-2026-03-10-001"
* status = #final
* code = http://loinc.org#61987-4 "My sleep quality was...in past 7 days [PROMIS]"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-10T08:00:00Z"
* issued = "2026-03-10T08:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueCodeableConcept
  * coding[0] = http://loinc.org#LA8967-7 "Good"
* derivedFrom = Reference(QuestionnaireResponse/sleep-quality-response-satisfied-example)

Instance: sleep-quality-dissatisfied-example
InstanceOf: AtPrenudgeObservationSleepQuality
Usage: #example
Title: "Sleep Quality O mapped from Q - Dissatisfied Example"
Description: "Example of a sleep quality observation indicating poor sleep satisfaction (LA8969-3 - Poor), derived from the standalone SleepQualityQuestionnaire (S2 - Unzufrieden mapped to LOINC)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-slq-2026-03-11-001"
* status = #final
* code = http://loinc.org#61987-4 "My sleep quality was...in past 7 days [PROMIS]"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-11T08:00:00Z"
* issued = "2026-03-11T08:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueCodeableConcept
  * coding[0] = http://loinc.org#LA8969-3 "Poor"
* note[+].text = "Schlafe schlecht wegen Stress."
* derivedFrom = Reference(QuestionnaireResponse/sleep-quality-response-dissatisfied-example)
