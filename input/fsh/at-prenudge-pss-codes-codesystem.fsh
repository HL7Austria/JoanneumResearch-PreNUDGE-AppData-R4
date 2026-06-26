// IG-internal codes for PSS-4 instrument identification and per-item Observation component codes.
// PSS-10 panel (LOINC 106875-8) and total score (LOINC 106860-0) are covered by LOINC.
// PSS-4 has no LOINC equivalent; IG-internal codes are used for Questionnaire.code and
// Observation.code. Per-item component codes are IG-internal for both PSS-4 and PSS-10.
CodeSystem: AtPrenudgePSSCodesCS
Id: at-prenudge-pss-codes-codesystem
Title: "AT PreNUDGE PSS Instrument Codes"
Description: "IG-internal codes for PSS-4 instrument identification and per-item Observation component codes for PSS-4 and PSS-10."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/at-prenudge-pss-codes-codesystem"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete

// PSS-4 instrument code (no LOINC equivalent exists for PSS-4).
// Used as Questionnaire.code and Observation.code for the PSS-4 score observation.
* #pss4 "PSS-4 Perceived Stress Scale (4-item)"

// PSS-4 per-item component codes.
// Negative items (used as-is in scoring): pss4-q1, pss4-q4.
// Positive items (reversed in scoring: 4 – raw): pss4-q2, pss4-q3.
// PSS-4 items q1/q2/q3/q4 correspond exactly to PSS-10 items q2/q4/q5/q10.
* #pss4-q1 "PSS-4 Item 1 (Kontrollverlust)"
* #pss4-q2 "PSS-4 Item 2 (Selbstwirksamkeit — positiv)"
* #pss4-q3 "PSS-4 Item 3 (Kontrolle — positiv)"
* #pss4-q4 "PSS-4 Item 4 (Überforderung)"

// PSS-10 per-item component codes.
// Positive items (reversed in scoring): pss10-q4, pss10-q5, pss10-q7, pss10-q8.
// Negative items (used as-is): pss10-q1, pss10-q2, pss10-q3, pss10-q6, pss10-q9, pss10-q10.
* #pss10-q1 "PSS-10 Item 1"
* #pss10-q2 "PSS-10 Item 2"
* #pss10-q3 "PSS-10 Item 3"
* #pss10-q4 "PSS-10 Item 4 (positiv)"
* #pss10-q5 "PSS-10 Item 5 (positiv)"
* #pss10-q6 "PSS-10 Item 6"
* #pss10-q7 "PSS-10 Item 7 (positiv)"
* #pss10-q8 "PSS-10 Item 8 (positiv)"
* #pss10-q9 "PSS-10 Item 9"
* #pss10-q10 "PSS-10 Item 10"
