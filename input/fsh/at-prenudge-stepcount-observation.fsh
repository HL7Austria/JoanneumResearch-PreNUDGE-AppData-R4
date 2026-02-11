Profile: AtPrenudgeObservationStepCount
Parent: AtApsObservation
Id: at-prenudge-stepcount-observation
Title: "AT PreNUDGE Observation Step Count"
Description: "This FHIR profile is defining the Step Count Observation, similar to the Observation Social History - Alcohol Use from the IPS."

* code = http://loinc.org#41950-7
* valueQuantity 0..1
* valueQuantity only Quantity
* valueQuantity ^sliceName = "valueQuantity"
* component ..0
* component ^mustSupport = false

// * code.coding MS
// * code.coding[0] MS
// * code.coding[0] from observation-codes (example)
// * code.coding[0].system 1..1 MS
// * code.coding[0].system = "http://loinc.org"
// * code.coding[0].code 1..1 MS
// * code.coding[0].code = #41950-7
// * effectiveDateTime MS
// * value[x] only Quantity
// * valueQuantity MS
// * component 0..0