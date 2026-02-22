Profile: AtPrenudgeQuestionnaireResponse
Parent: QuestionnaireResponse
Id: at-prenudge-questionnaireresponse
Title: "AT PreNUDGE Questionnaire Response"
Description: "This FHIR profile is defining the overall Questionnaire Response for PreNUDGE."

* identifier 1..
* identifier ^short = "Unique id for this set of answers, at least one is assigned by the data provider"
* identifier.system 1..
* identifier.system ^short = "The namespace for the identifier value, if no other information is given, use your website url"
* identifier.value 1..