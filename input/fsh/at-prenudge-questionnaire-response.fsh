Profile: AtPrenudgeQuestionnaireResponse
Parent: QuestionnaireResponse
Id: at-prenudge-questionnaireresponse
Title: "AT PreNUDGE Questionnaire Response"
Description: "This FHIR profile is defining the overall Questionnaire Response for PreNUDGE. Be aware that if the user enters values from a device into a questionnaire, it is still considered a manual input. Please keep in mind that all questionnaire responses must comply with the qualification matrix on https://prenudge.at/qualificationmatrix/."

* identifier 1..
* identifier ^short = "Unique id for this set of answers, at least one is assigned by the data provider"
* identifier.system 1..
* identifier.system ^short = "The namespace for the identifier value, if no other specifications are given, use your website url"
* identifier.value 1..

* authored 1..
* identifier ^short = "Mandatory date the answers were gathered"

* status = #completed
* status ^short = "In PreNUDGE only completed QuestionnaireResponses are beeing accepted"
