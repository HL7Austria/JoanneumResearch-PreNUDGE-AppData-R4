Alias: $pssFreqCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-pss-frequency-codesystem
Alias: $pssCodesCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-pss-codes-codesystem

// PSS-10 score Observation example — mapped from pss10-response-example.
// Item values: q1=2, q2=1, q3=3, q4=2(rev=2), q5=1(rev=3), q6=2, q7=3(rev=1), q8=2(rev=2), q9=1, q10=2.
// Total = 2+1+3+2+3+2+1+2+1+2 = 19.
Instance: pss10-score-example
InstanceOf: AtPrenudgeObservationPss10Score
Usage: #example
Title: "PSS-10 Score O mapped from Q - Example"
Description: "Example of a PSS-10 score Observation derived from pss10-response-example. Total score = 19."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-pss10-2026-06-20-001"
* status = #final
* code = http://loinc.org#106860-0 "Perceived stress scale-10 total score [PSS-10]"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-06-20T09:05:00Z"
* issued = "2026-06-20T09:05:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* derivedFrom = Reference(QuestionnaireResponse/pss10-response-example)

* valueQuantity
  * value = 19
  * unit = "score"
  * system = "http://unitsofmeasure.org"
  * code = #{score}

* component[item1]
  * code = $pssCodesCS#pss10-q1 "PSS-10 Item 1"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#sometimes "Manchmal"

* component[item2]
  * code = $pssCodesCS#pss10-q2 "PSS-10 Item 2"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#rarely "Selten"

* component[item3]
  * code = $pssCodesCS#pss10-q3 "PSS-10 Item 3"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#often "Häufig"

* component[item4]
  * code = $pssCodesCS#pss10-q4 "PSS-10 Item 4 (positiv)"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#sometimes "Manchmal"

* component[item5]
  * code = $pssCodesCS#pss10-q5 "PSS-10 Item 5 (positiv)"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#rarely "Selten"

* component[item6]
  * code = $pssCodesCS#pss10-q6 "PSS-10 Item 6"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#sometimes "Manchmal"

* component[item7]
  * code = $pssCodesCS#pss10-q7 "PSS-10 Item 7 (positiv)"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#often "Häufig"

* component[item8]
  * code = $pssCodesCS#pss10-q8 "PSS-10 Item 8 (positiv)"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#sometimes "Manchmal"

* component[item9]
  * code = $pssCodesCS#pss10-q9 "PSS-10 Item 9"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#rarely "Selten"

* component[item10]
  * code = $pssCodesCS#pss10-q10 "PSS-10 Item 10"
  * valueCodeableConcept
    * coding[+] = $pssFreqCS#sometimes "Manchmal"
