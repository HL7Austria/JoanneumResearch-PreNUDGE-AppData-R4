Profile: AtPrenudgeObservationOtherQuantities
Parent: AtPrenudgeObservation
Id: at-prenudge-observation-other-quantities
Title: "AT PreNUDGE Observation Other Quantities"
Description: "This FHIR profile can be used for all the other Observations for PreNUDGE, beeing quantities and not fitting the existing narrow standardized observations. If some code for specifing a new Observation is missing, please contact prenudge@joanneum.at."

* code from AtPrenudgeValueSetOtherObservationsCodes (required)

* value[x] 1..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code from AtPrenudgeValueSetOtherObservationsUnits (required)