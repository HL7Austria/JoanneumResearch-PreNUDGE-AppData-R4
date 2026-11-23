CodeSystem: AtPrenudgeCodeSystemIsced2011EducationLevel
Id: prenudge-isced-2011-education-level
Title: "AT PreNUDGE ISCED-based Education Category Codes"
Description: "Local representation of the six ISCED-based answer groups for the highest completed education level used in PreNUDGE."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-isced-2011-education-level"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

* #isced-1 "ISCED 1: Volksschule"
* #isced-2 "ISCED 2: Hauptschule, Mittelschule, AHS-Unterstufe, Polytechnische Schule"
* #isced-3 "ISCED 3: Lehre, BMS (z. B. HASCH, Fachschulen), AHS-Oberstufe"
* #isced-4 "ISCED 4: Berufsreifeprüfung, Gesundheits- und Krankenpflegeschule"
* #isced-5 "ISCED 5: BHS-Abschluss (HAK, HLW, HTL), Kolleg, Meisterprüfung"
* #isced-6-8 "ISCED 6–8: Hochschulabschlüsse (Bachelor, Master, Diplomstudium, Doktorat)"

ValueSet: AtPrenudgeValueSetIsced2011EducationLevel
Id: prenudge-isced-2011-education-level
Title: "AT PreNUDGE ISCED-based Education Category ValueSet"
Description: "The six current answer groups for highest completed education in PreNUDGE."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-isced-2011-education-level"
* ^status = #active
* ^experimental = false

* include codes from system https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-isced-2011-education-level
