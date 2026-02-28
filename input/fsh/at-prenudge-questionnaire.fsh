Profile: AtPrenudgeQuestionnaire
Parent: Questionnaire
Id: at-prenudge-questionnaire
Title: "AT PreNUDGE Questionnaire"
Description: "This FHIR profile is defining the overall Questionnaire for PreNUDGE. Every top level item requires one comment subitem, with the linkId ending or equal 'comment'."

* item obeys at-prenudge-every-item-has-comment

Invariant: at-prenudge-every-item-has-comment
Description: "Jedes top-level Item muss genau ein Unter-Item enthalten, dessen linkId auf 'comment' endet"
Severity: #error
Expression: "type = 'display' or item.where(linkId.endsWith('comment') and type = 'string').count() = 1"