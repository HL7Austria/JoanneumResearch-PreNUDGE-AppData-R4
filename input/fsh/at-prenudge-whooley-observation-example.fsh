Alias: $sct = http://snomed.info/sct

// Whooley (PHQ-2 Ja/Nein-Version) Observation example — mapped from whooley-response-positive-example.
// Both questions answered 'Ja' → positive depression screen.
Instance: whooley-observation-positive-example
InstanceOf: AtPrenudgeObservationWhooley
Usage: #example
Title: "Whooley O mapped from Q - Example"
Description: "Example of a Whooley depression screening Observation derived from whooley-response-positive-example. Both questions answered 'Ja' → positive screen (SNOMED CT 10828004)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-whooley-2026-04-15-positive"
* status = #final
* code = http://loinc.org#73832-8 "Adult depression screening assessment"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-04-15T10:00:00+00:00"
* issued = "2026-04-15T10:00:00Z"
* method = $sct#87982008 "Manual"
* derivedFrom = Reference(QuestionnaireResponse/whooley-response-positive-example)

* valueCodeableConcept
  * coding[+] = $sct#10828004 "Positive (qualifier value)"
