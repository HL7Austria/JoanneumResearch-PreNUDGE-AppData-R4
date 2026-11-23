Instance: sleep-quality-satisfied-example
InstanceOf: AtPrenudgeObservationSleepQuality
Usage: #example
Title: "Sleep Quality O mapped from Q - Satisfied Example"
Description: "Sleep satisfaction derived from the standalone questionnaire (S4 - Zufrieden mapped to the WHOQOL-BREF LOINC answer)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-slq-2026-03-10-001"
* status = #final
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-10T08:00:00Z"
* issued = "2026-03-10T08:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueCodeableConcept
  * coding[0] = http://loinc.org#LA29495-1 "Satisfied"
* derivedFrom = Reference(QuestionnaireResponse/sleep-quality-response-satisfied-example)

Instance: sleep-quality-dissatisfied-example
InstanceOf: AtPrenudgeObservationSleepQuality
Usage: #example
Title: "Sleep Quality O mapped from Q - Dissatisfied Example"
Description: "Sleep satisfaction derived from the standalone questionnaire (S2 - Unzufrieden mapped to the WHOQOL-BREF LOINC answer)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-slq-2026-03-11-001"
* status = #final
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-11T08:00:00Z"
* issued = "2026-03-11T08:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueCodeableConcept
  * coding[0] = http://loinc.org#LA29496-9 "Dissatisfied"
* note[+].text = "Schlafe schlecht wegen Stress."
* derivedFrom = Reference(QuestionnaireResponse/sleep-quality-response-dissatisfied-example)
