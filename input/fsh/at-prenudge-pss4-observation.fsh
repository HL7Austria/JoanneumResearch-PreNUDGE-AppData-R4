Alias: $pssCodesCS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-pss-codes-codesystem
Alias: $pssFreqVS = https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/at-prenudge-pss-frequency-valueset

// PSS-4 uses an IG-internal code (no LOINC equivalent for PSS-4).
// Observation.value[x] holds the total score (0–16).
// Components hold the raw categorical answer per questionnaire item.
// Positive items (q2, q3) are reversed in the StructureMap score calculation.
Profile: AtPrenudgeObservationPss4Score
Parent: AtPrenudgeObservation
Id: at-prenudge-pss4-score-observation
Title: "AT PreNUDGE Observation PSS-4 Score"
Description: "Observation profile for recording the calculated PSS-4 total score. Observation.value holds the integer total score (0–16). Components hold the raw categorical answers per item (bound to the PSS frequency ValueSet). Derived from a completed PSS-4 QuestionnaireResponse."

* code = $pssCodesCS#pss4 "PSS-4 Perceived Stress Scale (4-item)"

* value[x] 1..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.unit = "score"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #{score}

* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the PSS-4 QuestionnaireResponse from which this score was calculated"

* component 4..4
* component ^short = "Raw categorical answers for each PSS-4 item"
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #closed

* component contains
    item1 1..1 and
    item2 1..1 and
    item3 1..1 and
    item4 1..1

* component[item1].code = $pssCodesCS#pss4-q1 "PSS-4 Item 1 (Kontrollverlust)"
* component[item1].value[x] 1..1
* component[item1].value[x] only CodeableConcept
* component[item1].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item1].valueCodeableConcept ^short = "Raw answer to PSS-4 item 1 (negative item — used as-is)"

* component[item2].code = $pssCodesCS#pss4-q2 "PSS-4 Item 2 (Selbstwirksamkeit — positiv)"
* component[item2].value[x] 1..1
* component[item2].value[x] only CodeableConcept
* component[item2].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item2].valueCodeableConcept ^short = "Raw answer to PSS-4 item 2 (positive item — reversed in scoring: 4 – ordinal)"

* component[item3].code = $pssCodesCS#pss4-q3 "PSS-4 Item 3 (Kontrolle — positiv)"
* component[item3].value[x] 1..1
* component[item3].value[x] only CodeableConcept
* component[item3].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item3].valueCodeableConcept ^short = "Raw answer to PSS-4 item 3 (positive item — reversed in scoring: 4 – ordinal)"

* component[item4].code = $pssCodesCS#pss4-q4 "PSS-4 Item 4 (Überforderung)"
* component[item4].value[x] 1..1
* component[item4].value[x] only CodeableConcept
* component[item4].valueCodeableConcept from AtPrenudgeValueSetPSSFrequency (required)
* component[item4].valueCodeableConcept ^short = "Raw answer to PSS-4 item 4 (negative item — used as-is)"

* obeys pss4-score-range

Invariant: pss4-score-range
Severity: #error
Description: "PSS-4 total score must be between 0 and 16."
Expression: "value.ofType(Quantity).value >= 0 and value.ofType(Quantity).value <= 16"
