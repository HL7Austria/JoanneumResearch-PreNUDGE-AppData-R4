CodeSystem: AtPrenudgeCodeSystemWorkability
Id: prenudge-workability
Title: "AT PreNUDGE Workability Codes"
Description: "Local PreNUDGE codes for workability questionnaires and derived Work-SoC score observations. Work-SoC source DOI: https://doi.org/10.4102/sajip.v39i1.1111"
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-workability"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

// Work-SoC questionnaire and item codes
* #work-soc-questionnaire "Work-SoC Questionnaire"
* #work-soc-item-1 "Work-SoC item 1"
* #work-soc-item-2 "Work-SoC item 2"
* #work-soc-item-3 "Work-SoC item 3"
* #work-soc-item-4 "Work-SoC item 4"
* #work-soc-item-5 "Work-SoC item 5"
* #work-soc-item-6 "Work-SoC item 6"
* #work-soc-item-7 "Work-SoC item 7"
* #work-soc-item-8 "Work-SoC item 8"
* #work-soc-item-9 "Work-SoC item 9"

// Work-SoC derived observation and component codes
* #work-soc-score-items "Work-SoC calculated score item group"
* #work-soc-score-items ^definition = "Group containing calculated Work-SoC category score items."

* #work-soc-category-score "Work-SoC category score"

* #work-soc-comprehensibility "Work-SoC comprehensibility score"
* #work-soc-comprehensibility ^definition = "Calculated Work-SoC comprehensibility score. Formula: (Item 1 + Item 3 + Item 6 + Item 9) / 4."

* #work-soc-manageability "Work-SoC manageability score"
* #work-soc-manageability ^definition = "Calculated Work-SoC manageability score. Formula: (Item 4 + Item 7) / 2."

* #work-soc-meaningfulness "Work-SoC meaningfulness score"
* #work-soc-meaningfulness ^definition = "Calculated Work-SoC meaningfulness score. Formula: (Item 2 + Item 5 + Item 8) / 3."

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