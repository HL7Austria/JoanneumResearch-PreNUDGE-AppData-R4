Profile: AtPrenudgeObservationSmokingStatus
Parent: AtApsObservationTobaccoUse
Id: at-prenudge-smokingstatus-observation
Title: "AT PreNUDGE Observation Smoking Status"
Description: "This FHIR profile is defining the current smoking status observation for PreNUDGE. It is derived from the APS Observation Tobacco Use profile, which imposes the IPS Observation Social History - Tobacco Use profile. The value is derived from the ATHIS-based SmokingStatusQuestionnaire, primarily from SK1 and, if SK1 is negative, from the past tobacco smoking question."
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
//* code = http://loinc.org#72166-2 "Tobacco smoking status" // inherit from IPS
* value[x] 1..1
* value[x] only CodeableConcept
* derivedFrom MS
* derivedFrom ^short = "QuestionnaireResponse or other source this smoking status observation was derived from"
* note MS
* note ^short = "Comments about the observation including patient comments have to be possible"