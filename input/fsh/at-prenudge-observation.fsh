Profile: AtPrenudgeObservation
Parent: AtApsObservation
Id: at-prenudge-observation
Title: "AT PreNUDGE Observation"
Description: "This FHIR profile is defining the overall Observation for PreNUDGE. It is abstract, so no instances of this profile directly are allowed. Be aware that if the user enters values from a device into a questionnaire, it is still considered a manual input. Please keep in mind that all observations must comply with the qualification matrix on https://prenudge.at/qualificationmatrix/."

// Observations AtPrenudgeObservationAlcoholUse and AtPrenudgeObservationSmokingStatus duplicate all fields from AtPrenudgeObservation

* ^abstract = true

* obeys at-prenudge-result-present

* identifier 1..
* identifier ^short = "Business Identifier for observation, at least one is assigned by the data provider"
* identifier.system 1..
* identifier.system ^short = "The namespace for the identifier value, if no other specifications are given, use your website url"
* identifier.value 1..

* effectiveDateTime 1..
* effectiveDateTime ^short = "The mandatory clinically relevant time for observation"

* issued 1..
* issued ^short = "The mandatory date/time this version was made available" 

* method 1..
* method from AtPrenudgeValueSetMethodManualAutomated

* dataAbsentReason MS
* dataAbsentReason ^short = "Reason why no clinically or analytically meaningful result is available"

* note MS 
* note ^short = "Comments about the observation including patient comments have to be possible"

* device MS
* device ^short = "(Measurement) Devices should be documented when used"

* component ^short = "Components should only be used when multiple values are inseparably connected to a single measurement (e.g., score domains)."
* component.dataAbsentReason MS
* component.dataAbsentReason ^short = "Reason why no clinically or analytically meaningful component result is available"

Invariant: at-prenudge-result-present
Description: "A PreNUDGE Observation must contain a root result, a root data absent reason, or at least one component result or component data absent reason."
Severity: #error
Expression: "value.exists() or dataAbsentReason.exists() or component.where(value.exists() or dataAbsentReason.exists()).exists()"
