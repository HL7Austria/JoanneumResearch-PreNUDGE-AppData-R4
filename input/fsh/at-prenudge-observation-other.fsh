Profile: AtPrenudgeObservationOther
Parent: AtPrenudgeObservation
Id: at-prenudge-observation-other
Title: "AT PreNUDGE Observation Other"
Description: "This FHIR profile can be used for all the other Observations for PreNUDGE, not fitting the existing narrow standardized observations. If some code for specifing a new Observation are missing, please contact prenudge@joanneum.at."

* code from AtPrenudgeValueSetOtherObservationsCodes (required)

* value[x] 1..1 MS
* value[x] only Quantity
* valueQuantity.value 1..1 MS
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code from AtPrenudgeValueSetOtherObservationsUnits (required)