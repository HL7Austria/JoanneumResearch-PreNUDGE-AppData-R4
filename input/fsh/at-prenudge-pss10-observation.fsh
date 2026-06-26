Alias: $pssCodesCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-pss-codes-codesystem
Alias: $pssFreqVS = https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/at-prenudge-pss-frequency-valueset

// PSS-10 uses LOINC 106860-0 for the total score observation.
// Observation.value[x] holds the total score (0–40).
// Components hold the raw categorical answer per questionnaire item.
// Positive items (q4, q5, q7, q8) are reversed in the StructureMap score calculation.
Profile: AtPrenudgeObservationPss10Score
Parent: AtPrenudgeObservation
Id: at-prenudge-pss10-score-observation
Title: "AT PreNUDGE Observation PSS-10 Score"
Description: "Observation profile for recording the calculated PSS-10 total score (LOINC 106860-0). Observation.value holds the integer total score (0–40). Components hold the raw categorical answers per item (bound to the PSS frequency ValueSet). Derived from a completed PSS-10 QuestionnaireResponse."

* code = http://loinc.org#106860-0 "Perceived stress scale-10 total score [PSS-10]"

* value[x] 1..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.unit = "score"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #{score}

* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the PSS-10 QuestionnaireResponse from which this score was calculated"

* component 10..10
* component ^short = "Raw categorical answers for each PSS-10 item"
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #closed

* component contains
    item1 1..1 and
    item2 1..1 and
    item3 1..1 and
    item4 1..1 and
    item5 1..1 and
    item6 1..1 and
    item7 1..1 and
    item8 1..1 and
    item9 1..1 and
    item10 1..1

* component[item1].code = $pssCodesCS#pss10-q1 "PSS-10 Item 1"
* component[item1].value[x] 1..1
* component[item1].value[x] only CodeableConcept
* component[item1].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item1].valueCodeableConcept ^short = "Raw answer to PSS-10 item 1 (negative)"

* component[item2].code = $pssCodesCS#pss10-q2 "PSS-10 Item 2"
* component[item2].value[x] 1..1
* component[item2].value[x] only CodeableConcept
* component[item2].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item2].valueCodeableConcept ^short = "Raw answer to PSS-10 item 2 (negative; identical to PSS-4 item 1)"

* component[item3].code = $pssCodesCS#pss10-q3 "PSS-10 Item 3"
* component[item3].value[x] 1..1
* component[item3].value[x] only CodeableConcept
* component[item3].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item3].valueCodeableConcept ^short = "Raw answer to PSS-10 item 3 (negative)"

* component[item4].code = $pssCodesCS#pss10-q4 "PSS-10 Item 4 (positiv)"
* component[item4].value[x] 1..1
* component[item4].value[x] only CodeableConcept
* component[item4].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item4].valueCodeableConcept ^short = "Raw answer to PSS-10 item 4 (positive — reversed in scoring: 4 – ordinal; identical to PSS-4 item 2)"

* component[item5].code = $pssCodesCS#pss10-q5 "PSS-10 Item 5 (positiv)"
* component[item5].value[x] 1..1
* component[item5].value[x] only CodeableConcept
* component[item5].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item5].valueCodeableConcept ^short = "Raw answer to PSS-10 item 5 (positive — reversed in scoring: 4 – ordinal; identical to PSS-4 item 3)"

* component[item6].code = $pssCodesCS#pss10-q6 "PSS-10 Item 6"
* component[item6].value[x] 1..1
* component[item6].value[x] only CodeableConcept
* component[item6].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item6].valueCodeableConcept ^short = "Raw answer to PSS-10 item 6 (negative)"

* component[item7].code = $pssCodesCS#pss10-q7 "PSS-10 Item 7 (positiv)"
* component[item7].value[x] 1..1
* component[item7].value[x] only CodeableConcept
* component[item7].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item7].valueCodeableConcept ^short = "Raw answer to PSS-10 item 7 (positive — reversed in scoring: 4 – ordinal)"

* component[item8].code = $pssCodesCS#pss10-q8 "PSS-10 Item 8 (positiv)"
* component[item8].value[x] 1..1
* component[item8].value[x] only CodeableConcept
* component[item8].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item8].valueCodeableConcept ^short = "Raw answer to PSS-10 item 8 (positive — reversed in scoring: 4 – ordinal)"

* component[item9].code = $pssCodesCS#pss10-q9 "PSS-10 Item 9"
* component[item9].value[x] 1..1
* component[item9].value[x] only CodeableConcept
* component[item9].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item9].valueCodeableConcept ^short = "Raw answer to PSS-10 item 9 (negative)"

* component[item10].code = $pssCodesCS#pss10-q10 "PSS-10 Item 10"
* component[item10].value[x] 1..1
* component[item10].value[x] only CodeableConcept
* component[item10].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item10].valueCodeableConcept ^short = "Raw answer to PSS-10 item 10 (negative; identical to PSS-4 item 4)"

* obeys pss10-score-range

Invariant: pss10-score-range
Severity: #error
Description: "PSS-10 total score must be between 0 and 40."
Expression: "value.ofType(Quantity).value >= 0 and value.ofType(Quantity).value <= 40"
