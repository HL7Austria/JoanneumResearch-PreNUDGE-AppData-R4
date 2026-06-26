Alias: $pssFreqCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-pss-frequency-codesystem
Alias: $pssCodesCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-pss-codes-codesystem

// PSS-4 score Observation example — mapped from pss4-response-example.
// Source item values: q1=sometimes(2), q2=rarely(1), q3=often(3), q4=sometimes(2).
// Scoring: q1(2) + (4-q2(1)) + (4-q3(3)) + q4(2) = 2+3+1+2 = 8.
Instance: pss4-score-example
InstanceOf: AtPrenudgeObservationPss4Score
Usage: #example
Title: "PSS-4 Score O mapped from Q - Example"
Description: "Example of a PSS-4 score Observation derived from pss4-response-example. Total score = 8."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-pss4-2026-06-20-001"
* status = #final
* code = $pssCodesCS#pss4 "PSS-4 Perceived Stress Scale (4-item)"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-20T09:00:00Z"
* issued = "2026-06-20T09:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* derivedFrom = Reference(QuestionnaireResponse/pss4-response-example)

* valueQuantity
  * value = 8
  * unit = "score"
  * system = "http://unitsofmeasure.org"
  * code = #{score}

* component[item1]
  * code = $pssCodesCS#pss4-q1 "PSS-4 Item 1 (Kontrollverlust)"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#sometimes "Manchmal"

* component[item2]
  * code = $pssCodesCS#pss4-q2 "PSS-4 Item 2 (Selbstwirksamkeit — positiv)"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#rarely "Selten"

* component[item3]
  * code = $pssCodesCS#pss4-q3 "PSS-4 Item 3 (Kontrolle — positiv)"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#often "Häufig"

* component[item4]
  * code = $pssCodesCS#pss4-q4 "PSS-4 Item 4 (Überforderung)"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#sometimes "Manchmal"
