CodeSystem: AtPrenudgeCodeSystemIsced2011EducationLevel
Id: prenudge-isced-2011-education-level
Title: "AT PreNUDGE ISCED-based Education Category Codes"
Description: "Local representation of the eight ISCED-based answer categories for the highest completed education level used in PreNUDGE."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-isced-2011-education-level"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

* #isced-1 "ISCED 1: Volksschule"
* #isced-2 "ISCED 2: Hauptschule, Mittelschulen, Unterstufen von AHS"
* #isced-3a "ISCED 3a: Polytechnische Schule"
* #isced-3b "ISCED 3b: Berufsbildende mittlere Schulen (HASCH, Fachschulen)"
* #isced-3c "ISCED 3c: Berufsbildende höhere Schulen (HAK, HBLA, HTL) und AHS-Oberstufe"
* #isced-4 "ISCED 4: Lehre mit Matura, Gesundheits- und Krankenpflegeschule (nicht-tertiär), Meister- oder Diplomprüfung"
* #isced-5 "ISCED 5: Kolleg, tertiäre Hebammenakademien bzw. medizinisch-technische Ausbildungen im Kurzzyklus"
* #isced-6-8 "ISCED 6–8: Hochschulabschlüsse (Bachelor, Master, Doktor)"
* #unknown "Weiß nicht"
* #not-stated "Keine Angabe"

ValueSet: AtPrenudgeValueSetIsced2011EducationLevel
Id: prenudge-isced-2011-education-level
Title: "AT PreNUDGE ISCED-based Education Category ValueSet"
Description: "Permitted ISCED-based answer categories for the highest completed education level."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-isced-2011-education-level"
* ^status = #active
* ^experimental = false

* include codes from system https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-isced-2011-education-level
