CodeSystem: AtPrenudgeCodeSystemAthis
Id: athis-answers
Title: "ATHIS – Antwortmöglichkeiten"
Description: "Antwortmöglichkeiten aus dem ATHIS Fragebogen (Österreichische Gesundheitsbefragung, STATISTIK AUSTRIA). Version vom 31.03.2025; Codes sind englisch; Display-Werte bleiben deutsch. Gruppiert nach Skalentypen für die Wiederverwendung in PreNUDGE Questionnaires. Hinweis: Bestehende PreNUDGE CodeSystems bleiben gültig – whoqol-bref-scale (LQ16-Zufriedenheitsskala), prenudge-nutrition-consumption-frequency (DH1/DH3 numerische ATHIS-Codes), prenudge-alcoholuse-frequency (AL1 SNOMED-basiert)."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^copyright = "STATISTIK AUSTRIA – Bundesanstalt Statistik Österreich. Reproduziert für das PreNUDGE Forschungsprojekt."

// =============================================================================
// GRUPPE 1: Universelle Standardantworten  [Prefix: meta-]
// ATHIS Default-Antworten, gültig für (fast) alle Fragen: Weiß nicht [-1], Keine Angabe [-2]
// =============================================================================

* #meta-unknown "Weiß nicht"
* #meta-not-stated "Keine Angabe"

// =============================================================================
// GRUPPE 2: Ja/Nein  [Prefix: yn-]
// Standard-Binärantworten [1]=Ja, [2]=Nein.
// Tabakprodukt-Varianten (SK1, SK6A, SK6B, SK6C) mit täglich/gelegentlich/nie.
// =============================================================================

* #yn-yes "Ja"
* #yn-no "Nein"
* #yn-yes-daily "Ja, täglich"
* #yn-yes-occasionally "Ja, gelegentlich"
* #yn-no-not-at-all "Nein, überhaupt nicht"
* #yn-no-but-formerly "Nein, aber früher"
* #yn-no-never "Nein, noch nie genutzt/konsumiert"

// =============================================================================
// GRUPPE 3: Allgemeiner Gesundheitszustand (5-stufig)  [Prefix: hs-]
// Skala: sehr gut → sehr schlecht. Verwendet in: HS1, CD2 (Zähne), KIG1, LQ15 (Fortbewegung).
// Ordinalreihenfolge: 1=sehr gut, 2=gut, 3=mittelmäßig, 4=schlecht, 5=sehr schlecht.
// =============================================================================

* #hs-very-good "Sehr gut"
* #hs-good "Gut"
* #hs-fair "Mittelmäßig"
* #hs-poor "Schlecht"
* #hs-very-poor "Sehr schlecht"

// =============================================================================
// GRUPPE 4: Funktionseinschränkung  [Prefix: func-]
// 4-stufig: keine → gar nicht (PL2–PL9, PC1).
// 5-stufig: + "Nicht zutreffend" (HA1) oder + "Kein Interesse" (BA1).
// Sub-Skala HS3a (3-stufig: stark → nicht eingeschränkt): func-limited-*
// Ordinalreihenfolge: 1=keine, 2=einige, 3=große, 4=gar nicht.
// =============================================================================

* #func-no-difficulty "Keine Schwierigkeiten"
* #func-some-difficulty "Einige Schwierigkeiten"
* #func-a-lot-of-difficulty "Große Schwierigkeiten"
* #func-cannot-do-at-all "Es ist zu schwierig, ich kann es gar nicht"
* #func-not-applicable "Nicht zutreffend"
* #func-not-interested "Kein Interesse an dieser Aktivität, möchte ich nicht tun"

// Gesundheitliche Aktivitätseinschränkung (HS3a), 3-stufig.
// Ordinalreihenfolge: 1=stark, 2=etwas, 3=nicht.
* #func-limited-severely "Stark eingeschränkt"
* #func-limited-somewhat "Etwas eingeschränkt"
* #func-not-limited "Nicht eingeschränkt"

// =============================================================================
// GRUPPE 5: Schmerzintensität und Schmerzbeeinträchtigung  [Prefix: pain-]
// pain-* (PN1): Intensität 6-stufig: keine → sehr stark.
// pain-interf-* (PN2): Beeinträchtigung 5-stufig: überhaupt nicht → äußerst.
// =============================================================================

// PN1 – Schmerzintensität. Ordinalreihenfolge: 1=keine, …, 6=sehr stark.
* #pain-none "Keine Schmerzen"
* #pain-very-mild "Sehr leicht"
* #pain-mild "Leicht"
* #pain-moderate "Mäßig"
* #pain-severe "Stark"
* #pain-very-severe "Sehr stark"

// PN2 – Schmerzbeeinträchtigung. Ordinalreihenfolge: 1=überhaupt nicht, …, 5=äußerst.
* #pain-interf-not-at-all "Überhaupt nicht"
* #pain-interf-slightly "Etwas"
* #pain-interf-moderately "Mäßig"
* #pain-interf-quite-a-bit "Ziemlich"
* #pain-interf-extremely "Äußerst"

// =============================================================================
// GRUPPE 6: PHQ-9 – Häufigkeit in den letzten 2 Wochen  [Prefix: phq-]
// 4-stufig: Nie → Beinahe jeden Tag. Verwendet in: MH1.
// Ordinalreihenfolge: 1=nie, 2=manche Tage, 3=mehr als Hälfte, 4=beinahe täglich.
// =============================================================================

* #phq-never "Nie"
* #phq-several-days "An manchen Tagen"
* #phq-more-than-half-the-days "An mehr als der Hälfte der Tage"
* #phq-nearly-every-day "Beinahe jeden Tag"

// =============================================================================
// GRUPPE 7: WHO-5 – Zeitanteil in den letzten 2 Wochen  [Prefix: who5-]
// 6-stufig: Die ganze Zeit → Zu keinem Zeitpunkt. Verwendet in: MH2.
// Ordinalreihenfolge: 1=ganze Zeit, …, 6=nie.
// =============================================================================

* #who5-all-the-time "Die ganze Zeit"
* #who5-most-of-the-time "Meistens"
* #who5-more-than-half-the-time "Etwas mehr als die Hälfte der Zeit"
* #who5-less-than-half-the-time "Etwas weniger als die Hälfte der Zeit"
* #who5-some-of-the-time "Ab und zu"
* #who5-none-of-the-time "Zu keinem Zeitpunkt"

// =============================================================================
// GRUPPE 8: Ernährungshäufigkeit (DH-Skalen)  [Prefix: dh-]
// Skala A (DH1 Obst, DH3 Gemüse, DH5 Säfte): 5-stufig täglich→nie + Weiß nicht=#meta-unknown.
// Skala B (DH6 Süßes/Salziges): gleiche 5 Stufen, kein Weiß nicht.
// Skala C (DH7 rotes Fleisch, DH8_neu Wurstwaren): abweichende Stufe-1/4-Formulierung.
// Skala D (DH8 Fisch): feinere Monatsgranularität (6-stufig).
// Ordinalreihenfolge jeweils: häufig → nie.
// =============================================================================

// Skala A und B (DH1, DH3, DH5, DH6)
* #dh-daily-or-more "Täglich oder mehrmals täglich"
* #dh-4-6-per-week "4 bis 6 Mal pro Woche"
* #dh-1-3-per-week "1 bis 3 Mal pro Woche"
* #dh-less-than-once-per-week "Weniger als einmal pro Woche"
* #dh-never "Nie"

// Skala C: abweichende Formulierungen (DH7, DH8_neu)
* #dh-daily-or-nearly-daily "Täglich oder beinahe täglich"
* #dh-less-often-than-once-per-week "Seltener als einmal pro Woche"

// Skala D: Fischkonsum DH8 (6-stufig, feinere Monatsgranularität)
* #dh-3-4-per-week "3 bis 4 Mal pro Woche"
* #dh-1-2-per-week "1 bis 2 Mal pro Woche"
* #dh-1-2-per-month "1 bis 2 Mal pro Monat"
* #dh-less-than-once-per-month "Seltener als einmal pro Monat"

// =============================================================================
// GRUPPE 9: Körperliche Aktivität  [Prefix: pe-]
// pe-*-day(s): Tage pro Woche (0–7), 8-stufig. Verwendet in: PE2, PE4, PE6, PE8.
// pe-*-min / pe-*h-*: Tägliche Dauer (5-stufig). Verwendet in: PE3, PE5.
// pe-sitting-* / pe-walking-* / pe-heavy-* / pe-no-*: Belastung Arbeit (4-stufig). Verwendet in: PE1.
// =============================================================================

// Tage pro Woche (PE2, PE4, PE6, PE8). Ordinalreihenfolge: 0=nie/selten, …, 7=täglich.
* #pe-never-or-rarely "Nie oder seltener als einmal pro Woche"
* #pe-1-day "1 Tag pro Woche"
* #pe-2-days "2 Tage pro Woche"
* #pe-3-days "3 Tage pro Woche"
* #pe-4-days "4 Tage pro Woche"
* #pe-5-days "5 Tage pro Woche"
* #pe-6-days "6 Tage pro Woche"
* #pe-7-days "7 Tage pro Woche"

// Tägliche Aktivitätsdauer (PE3, PE5). Ordinalreihenfolge: 1=kurz, …, 5=lang.
* #pe-10-29-min "10 bis 29 Minuten pro Tag"
* #pe-30-59-min "30 bis 59 Minuten pro Tag"
* #pe-1h-under-2h "1 Stunde bis unter 2 Stunden pro Tag"
* #pe-2h-under-3h "2 Stunden bis unter 3 Stunden pro Tag"
* #pe-3h-or-more "3 Stunden pro Tag oder mehr"

// Körperliche Belastung bei der Arbeit (PE1).
* #pe-sitting-or-standing "Vorwiegend sitzen oder stehen"
* #pe-walking-or-moderate "Vorwiegend gehen oder mäßig anstrengende körperliche Tätigkeiten"
* #pe-heavy-physical-work "Vorwiegend schwere körperliche Arbeit oder körperlich beanspruchende Tätigkeiten"
* #pe-no-work-activities "Ich führe keine arbeitsbezogenen Tätigkeiten aus"

// =============================================================================
// GRUPPE 10: Tabakrauch-Passivexposition  [Prefix: sk5-]
// 5-stufig: täglich viel → nie. Verwendet in: SK5.
// Ordinalreihenfolge: 1=täglich/viel, …, 5=nie.
// =============================================================================

* #sk5-daily-1h-or-more "Täglich, eine Stunde oder mehr pro Tag"
* #sk5-daily-less-than-1h "Täglich, weniger als 1 Stunde pro Tag"
* #sk5-at-least-weekly "Mindestens einmal pro Woche (aber nicht täglich)"
* #sk5-less-than-weekly "Weniger als einmal pro Woche"
* #sk5-never-or-rarely "Nie oder fast nie"

// =============================================================================
// GRUPPE 11: WHOQOL-BREF Skalen  [Prefix: whoqol-]
// whoqol-int-*: Intensitätsskala (LQ3, "Wie stark …"), 5-stufig.
// whoqol-cap-*: Kapazitätsskala (LQ10, "In welchem Umfang …"), 5-stufig.
// whoqol-neg-*: Negativgefühle-Häufigkeit (LQ26), 5-stufig.
// Hinweis: Die Zufriedenheitsskala (LQ1, LQ2, LQ16) ist im whoqol-bref-scale CodeSystem definiert.
// =============================================================================

// Intensitätsskala (LQ3). Ordinalreihenfolge: 1=überhaupt nicht, …, 5=äußerst.
* #whoqol-int-not-at-all "Überhaupt nicht"
* #whoqol-int-a-little "Ein wenig"
* #whoqol-int-moderately "Mittelmäßig"
* #whoqol-int-quite "Ziemlich"
* #whoqol-int-extremely "Äußerst"

// Kapazitätsskala (LQ10). Ordinalreihenfolge: 1=überhaupt nicht, …, 5=völlig.
* #whoqol-cap-not-at-all "Überhaupt nicht"
* #whoqol-cap-not-really "Eher nicht"
* #whoqol-cap-moderately "Halbwegs"
* #whoqol-cap-mostly "Überwiegend"
* #whoqol-cap-completely "Völlig"

// Negativgefühle-Häufigkeit (LQ26). Ordinalreihenfolge: 1=niemals, …, 5=immer.
* #whoqol-neg-never "Niemals"
* #whoqol-neg-not-often "Nicht oft"
* #whoqol-neg-sometimes "Zeitweilig"
* #whoqol-neg-often "Oftmals"
* #whoqol-neg-always "Immer"

// =============================================================================
// GRUPPE 12: Kindheitliche Häufigkeit – KID-Skala  [Prefix: kig-]
// Berichtet durch Eltern für die vergangene Woche des Kindes (KIG18).
// 4-stufig (kig-never … kig-often) oder 5-stufig (+ kig-always).
// Ordinalreihenfolge: 1=nie, …, 4/5=oft/immer.
// =============================================================================

* #kig-never "Nie"
* #kig-seldom "Selten"
* #kig-sometimes "Manchmal"
* #kig-often "Oft"
* #kig-always "Immer"

// =============================================================================
// GRUPPE 13: Soziodemographie  [Prefix: socio-]
// socio-employed … socio-other: Erwerbsstatus (ATHIS_L1), 8-stufig.
// socio-compulsory-school … socio-other-post-secondary: Schulbildung (ATHIS_K9), 6-stufig.
// =============================================================================

// Erwerbsstatus (ATHIS_L1). Antwortmöglichkeiten [1]–[8].
* #socio-employed "Erwerbstätig oder Lehrling"
* #socio-unemployed "Arbeitssuchend, arbeitslos"
* #socio-retired "In Pension"
* #socio-permanently-disabled "Dauerhaft arbeitsunfähig aus gesundheitlichen Gründen"
* #socio-in-education "In Ausbildung"
* #socio-homemaker "Haushaltsführend"
* #socio-military-or-civil-service "Im Präsenz- oder Zivildienst"
* #socio-other "Sonstiges"

// Höchste erfolgreich abgeschlossene Schulbildung (ATHIS_K9). Antwortmöglichkeiten [1]–[6].
* #socio-compulsory-school "Pflichtschule"
* #socio-apprenticeship "Lehre mit Berufsschule"
* #socio-vocational-school "Fach- oder Handelsschule"
* #socio-matura "Matura"
* #socio-university-degree "Abschluss an einer Universität oder Hochschule"
* #socio-other-post-secondary "Anderer Abschluss nach der Matura"
