CodeSystem: WHOQOLBrefScale
Id: whoqol-bref-scale
Title: "AT PreNUDGE WHOQOL-BREF Answer Scales"
Description: "Consolidated CodeSystem for all answer scales of the WHOQOL-BREF questionnaire."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/whoqol-bref-scale"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^property[+].code = #scale
* ^property[=].type = #string
* ^property[=].description = "The answer scale this code belongs to."
* ^property[+].code = #score
* ^property[=].type = #integer
* ^property[=].description = "The numeric score value for calculation."

// Qualität
* #Q "Quality" "Antwortskala: Qualität"
* #Q #Q1 "Sehr schlecht"
  * ^property[+].code = #scale
  * ^property[=].valueString = "quality"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 1
* #Q #Q2 "Schlecht"
  * ^property[+].code = #scale
  * ^property[=].valueString = "quality"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 2
* #Q #Q3 "Mittelmäßig"
  * ^property[+].code = #scale
  * ^property[=].valueString = "quality"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 3
* #Q #Q4 "Gut"
  * ^property[+].code = #scale
  * ^property[=].valueString = "quality"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 4
* #Q #Q5 "Sehr gut"
  * ^property[+].code = #scale
  * ^property[=].valueString = "quality"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 5

// Zufriedenheit
* #S "Satisfaction" "Antwortskala: Zufriedenheit"
* #S #S1 "Sehr unzufrieden"
  * ^property[+].code = #scale
  * ^property[=].valueString = "satisfaction"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 1
* #S #S2 "Unzufrieden"
  * ^property[+].code = #scale
  * ^property[=].valueString = "satisfaction"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 2
* #S #S3 "Weder zufrieden noch unzufrieden"
  * ^property[+].code = #scale
  * ^property[=].valueString = "satisfaction"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 3
* #S #S4 "Zufrieden"
  * ^property[+].code = #scale
  * ^property[=].valueString = "satisfaction"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 4
* #S #S5 "Sehr zufrieden"
  * ^property[+].code = #scale
  * ^property[=].valueString = "satisfaction"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 5

// Intensität
* #I "Intensity" "Antwortskala: Intensität"
* #I #I1 "Überhaupt nicht"
  * ^property[+].code = #scale
  * ^property[=].valueString = "intensity"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 1
* #I #I2 "Ein wenig"
  * ^property[+].code = #scale
  * ^property[=].valueString = "intensity"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 2
* #I #I3 "Mittelmäßig"
  * ^property[+].code = #scale
  * ^property[=].valueString = "intensity"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 3
* #I #I4 "Ziemlich"
  * ^property[+].code = #scale
  * ^property[=].valueString = "intensity"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 4
* #I #I5 "Äußerst"
  * ^property[+].code = #scale
  * ^property[=].valueString = "intensity"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 5

// Kapazität
* #C "Capacity" "Antwortskala: Kapazität"
* #C #C1 "Überhaupt nicht"
  * ^property[+].code = #scale
  * ^property[=].valueString = "capacity"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 1
* #C #C2 "Eher nicht"
  * ^property[+].code = #scale
  * ^property[=].valueString = "capacity"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 2
* #C #C3 "Halbwegs"
  * ^property[+].code = #scale
  * ^property[=].valueString = "capacity"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 3
* #C #C4 "Überwiegend"
  * ^property[+].code = #scale
  * ^property[=].valueString = "capacity"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 4
* #C #C5 "Völlig"
  * ^property[+].code = #scale
  * ^property[=].valueString = "capacity"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 5

// Häufigkeit
* #F "Frequency" "Antwortskala: Häufigkeit"
* #F #F1 "Niemals"
  * ^property[+].code = #scale
  * ^property[=].valueString = "frequency"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 1
* #F #F2 "Nicht oft"
  * ^property[+].code = #scale
  * ^property[=].valueString = "frequency"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 2
* #F #F3 "Zeitweilig"
  * ^property[+].code = #scale
  * ^property[=].valueString = "frequency"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 3
* #F #F4 "Oftmals"
  * ^property[+].code = #scale
  * ^property[=].valueString = "frequency"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 4
* #F #F5 "Immer"
  * ^property[+].code = #scale
  * ^property[=].valueString = "frequency"
  * ^property[+].code = #score
  * ^property[=].valueInteger = 5