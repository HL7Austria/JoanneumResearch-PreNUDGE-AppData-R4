Profile: AtPrenudgeObservationEducation
Parent: AtPrenudgeObservation
Id: at-prenudge-education-observation
Title: "AT PreNUDGE Observation Highest Completed Education"
Description: "This FHIR profile defines the person's highest completed education level using ISCED 2011. It is intended for sociodemographic data collected by a simple questionnaire."

* code = http://loinc.org#82589-3 "Highest level of education"

* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from AtPrenudgeValueSetIsced2011EducationLevel (required)

* derivedFrom MS
* derivedFrom ^short = "QuestionnaireResponse or other source this education observation was derived from"