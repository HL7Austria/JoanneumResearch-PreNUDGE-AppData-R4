CodeSystem: AtPrenudgeEhisPaqScale
Id:         at-prenudge-physicalactivity-codesystem-ehispaq
Title:      "AT PreNUDGE EHIS-PAQ Answer Set"
Description: "Consolidated CodeSystem for all options from the EHIS-PAQ questionnaires (European Health Interview Survey Physical Activity Questionnaire) used in PreNUDGE. Contains two answer scales: days per week (Q4, Q6 in EhisPaqPhysicalActivityQuestionnaire; also Q2 in StepCountEhisPaqQuestionnaire) and activity duration per day (Q3 in StepCountEhisPaqQuestionnaire, Q5 in EhisPaqPhysicalActivityQuestionnaire). Codes are in English; display values remain in German."

* ^url          = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-physicalactivity-codesystem-ehispaq"
* ^status       = #retired
* ^experimental = false
* ^caseSensitive = true
* ^content      = #complete
* ^copyright    = "European Health Interview Survey Physical Activity Questionnaire (EHIS-PAQ). Eurostat / STATISTIK AUSTRIA. Reproduziert für das PreNUDGE Forschungsprojekt."

// =============================================================================
// GRUPPE 1: Tage pro Woche  [Prefix: ehis-]
// 8-stufig: Nie/seltener → 7 Tage. Verwendet in: Q4-cycling-days, Q6-leisure-days
// (EhisPaqPhysicalActivityQuestionnaire). Die Codes stehen auch für eine künftige
// Umstellung von Q2-walking-days (StepCountEhisPaqQuestionnaire) auf #choice bereit.
// Ordinalreihenfolge: 0=nie/seltener als einmal, 1–7=Anzahl Aktivitätstage.
// =============================================================================

* #ehis-never-or-rarely "Nie oder seltener als einmal pro Woche"
* #ehis-1-day           "1 Tag pro Woche"
* #ehis-2-days          "2 Tage pro Woche"
* #ehis-3-days          "3 Tage pro Woche"
* #ehis-4-days          "4 Tage pro Woche"
* #ehis-5-days          "5 Tage pro Woche"
* #ehis-6-days          "6 Tage pro Woche"
* #ehis-7-days          "7 Tage pro Woche"

// =============================================================================
// GRUPPE 2: Aktivitätsdauer pro Tag  [Prefix: ehis-]
// 6-stufig (Q3) / 5-stufig (Q5): kurz → lang.
// Q3-walking-duration (StepCountEhisPaqQuestionnaire): alle 6 Codes (#ehis-0-9-min bis #ehis-3h-or-more).
// Q5-cycling-duration (EhisPaqPhysicalActivityQuestionnaire): 5 Codes (#ehis-10-29-min bis #ehis-3h-or-more).
// #ehis-0-9-min gilt nur für Q3: Die EHIS-PAQ Fahrrad- und Freizeitfragen setzen
// eine Mindestdauer von 10 Minuten voraus; Q5 beginnt daher bei #ehis-10-29-min.
// Ordinalreihenfolge: 1=unter 10 min, 2=10–29 min, …, 6=3 h oder mehr.
// =============================================================================

* #ehis-0-9-min     "0–9 Minuten pro Tag"
    "Aktivitätsdauer unter 10 Minuten. Gilt ausschließlich für Q3-walking-duration."
* #ehis-10-29-min   "10–29 Minuten pro Tag"
* #ehis-30-59-min   "30–59 Minuten pro Tag"
* #ehis-1h-under-2h "1 Stunde bis unter 2 Stunden pro Tag"
* #ehis-2h-under-3h "2 Stunden bis unter 3 Stunden pro Tag"
* #ehis-3h-or-more  "3 Stunden pro Tag oder mehr"