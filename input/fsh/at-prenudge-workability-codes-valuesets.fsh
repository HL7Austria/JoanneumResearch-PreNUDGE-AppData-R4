CodeSystem: AtPrenudgeCodeSystemWorkability
Id: prenudge-workability
Title: "AT PreNUDGE Workability Codes"
Description: "Local PreNUDGE codes for the Work Ability Index questionnaire and its items."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-workability"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

// WAI questionnaire and item codes
* #wai-questionnaire "Work Ability Index short questionnaire"
* #wai-current-work-ability "Current work ability compared with lifetime best"
* #wai-physical-demands-work-ability "Current work ability in relation to physical work demands"


CodeSystem: AtPrenudgeCodeSystemWaiAnswer
Id: prenudge-wai-answer
Title: "AT PreNUDGE WAI Answer Codes"
Description: "Local answer codes for categorical Work Ability Index answer options."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-wai-answer"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

* #very-good "Sehr gut (5)"
* #rather-good "Eher gut (4)"
* #moderate "Mittelmäßig (3)"
* #rather-poor "Eher schlecht (2)"
* #very-poor "Sehr schlecht (1)"


ValueSet: AtPrenudgeValueSetWaiPhysicalDemandsAnswer
Id: prenudge-wai-physical-demands-answer
Title: "AT PreNUDGE WAI Physical Demands Answer ValueSet"
Description: "Permitted categorical answers for current work ability in relation to physical work demands."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-wai-physical-demands-answer"
* ^status = #active
* ^experimental = false

* include codes from system https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-wai-answer