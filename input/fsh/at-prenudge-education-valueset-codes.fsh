CodeSystem: AtPrenudgeCodeSystemIsced2011EducationLevel
Id: prenudge-isced-2011-education-level
Title: "AT PreNUDGE ISCED 2011 Education Level Codes"
Description: "Local representation of ISCED 2011 education levels for the highest completed education level used in PreNUDGE. Austrian levels are described at https://bildungssystem.oead.at/isced-klassifikation"
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-isced-2011-education-level"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

* #isced-0 "ISCED 0 - Elementarbereich"
* #isced-1 "ISCED 1 - Primarbereich"
* #isced-2 "ISCED 2 - Sekundarbereich I"
* #isced-3 "ISCED 3 - Sekundarbereich II"
* #isced-4 "ISCED 4 - Postsekundarer, nicht tertiärer Bereich"
* #isced-5 "ISCED 5 - Kurzes tertiäres Bildungsprogramm"
* #isced-6 "ISCED 6 - Bachelor- bzw. gleichwertiges Bildungsprogramm"
* #isced-7 "ISCED 7 - Master- bzw. gleichwertiges Bildungsprogramm"
* #isced-8 "ISCED 8 - Promotion bzw. gleichwertiges Bildungsprogramm"
* #unknown "Weiß nicht"
* #not-stated "Keine Angabe"


ValueSet: AtPrenudgeValueSetIsced2011EducationLevel
Id: prenudge-isced-2011-education-level
Title: "AT PreNUDGE ISCED 2011 Education Level ValueSet"
Description: "Permitted answer values for the highest completed education level according to ISCED 2011."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-isced-2011-education-level"
* ^status = #active
* ^experimental = false

* include codes from system https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-isced-2011-education-level