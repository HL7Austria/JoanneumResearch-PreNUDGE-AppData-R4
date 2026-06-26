// PSS answer-scale CodeSystem — shared by PSS-4 and PSS-10.
// The #score property holds the numeric ordinal (0–4) required for total-score calculation.
// Codes use English-language slugs; German display labels match the PreNUDGE study instruments.
CodeSystem: AtPrenudgePSSFrequencyCS
Id: at-prenudge-pss-frequency-codesystem
Title: "AT PreNUDGE PSS Frequency Answer Scale"
Description: "5-point frequency answer scale (0–4) used by the Perceived Stress Scale (PSS-4 and PSS-10) instruments. Based on Cohen, S., Kamarck, T., & Mermelstein, R. (1983). A global measure of perceived stress. Journal of Health and Social Behavior, 24(4), 385–396."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-pss-frequency-codesystem"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^property[+].code = #score
* ^property[=].type = #integer
* ^property[=].description = "Numeric ordinal value for PSS total score calculation (0 = never, 4 = very often)."

* #never "Nie"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 0
* #rarely "Selten"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 1
* #sometimes "Manchmal"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 2
* #often "Häufig"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 3
* #very-often "Sehr oft"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 4
