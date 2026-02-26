Profile: AtPrenudgeObservation
Parent: AtApsObservation
Id: at-prenudge-observation
Title: "AT PreNUDGE Observation"
Description: "This FHIR profile is defining the overall Observation for PreNUDGE."

* identifier 1..
* identifier ^short = "Business Identifier for observation, at least one is assigned by the data provider"
* identifier.system 1..
* identifier.system ^short = "The namespace for the identifier value, if no other specifications are given, use your website url"
* identifier.value 1..

* method 1..
* method from AtPrenudgeValueSetMethodManualAutomated

* note MS 
* note ^short = "Comments about the observation including patient comments have to be possible"

* component ..0
* component ^mustSupport = false
* component ^short = "Component results are not allowed as groupings for values will be handeled case by case; create only flat observations"