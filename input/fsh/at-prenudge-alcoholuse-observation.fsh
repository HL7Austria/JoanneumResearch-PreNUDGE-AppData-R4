Profile: AtPrenudgeObservationAlcoholUse
Parent: AtApsObservationAlcoholUse
//TODO: check if for alcohol we also need the overall prenudge observation, this here would be much cleaner and easier to implement
Id: at-prenudge-alcoholuse-observation
Title: "AT PreNUDGE Observation Alcohol Use"
Description: "This FHIR profile is derived from the APS Observation Alcohol Use profile. Additional fields from the PreNUDGE Observation profile are added."

// -------------------------------------------------------------------------------------------------------------------
// from PreNUDGE Observation profile, as multiple inheritance not possible in R4
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
* method ^short = "Manual if derived from a QuestionnaireResponse; Automated only if a plausible automated source is documented"

* note MS
* note ^short = "Comments about the observation including patient comments have to be possible"

* device MS
* device ^short = "(Measurement) Devices should be documented when used"

* component ^short = "Components should only be used when multiple values are inseparably connected to a single measurement (e.g., score domains)."
// -------------------------------------------------------------------------------------------------------------------

* derivedFrom MS
* derivedFrom ^short = "QuestionnaireResponse or other source this smoking status observation was derived from"

* value[x] 0..1
* value[x] only Quantity
* value[x] ^short = "Set to Quantity (drinks/day), as recommended in Observation Social History - Alcohol Use (IPS)"