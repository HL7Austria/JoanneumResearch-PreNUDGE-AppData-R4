CodeSystem: AtPrenudgeCodeSystemAthis
Id: athis-answers
Title: "ATHIS – Antwortmöglichkeiten"
Description: "Vollständige Antwortmöglichkeiten aus dem ATHIS Fragebogen (Österreichische Gesundheitsbefragung, STATISTIK AUSTRIA, Version 31.03.2025). Codes sind englisch; Display-Werte bleiben deutsch. Gruppiert nach Skalentypen. Hinweis: Bestehende PreNUDGE CodeSystems bleiben gültig – whoqol-bref-scale (LQ16-Zufriedenheitsskala), prenudge-nutrition-consumption-frequency (DH1/DH3 numerische Codes), prenudge-alcoholuse-frequency (AL1 SNOMED-basiert)."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* ^content = #complete
* ^copyright = "STATISTIK AUSTRIA – Bundesanstalt Statistik Österreich. Reproduziert für das PreNUDGE Forschungsprojekt."

// =============================================================================
// GRUPPE 1: Universelle Standardantworten  [Prefix: meta-]
// ATHIS Default-Antworten: Weiß nicht [-1], Keine Angabe [-2]
// =============================================================================

* #meta-unknown "Weiß nicht"
* #meta-not-stated "Keine Angabe"

// =============================================================================
// GRUPPE 2: Ja/Nein und Varianten  [Prefix: yn-]
// Standard Ja [1] / Nein [2] plus ATHIS-spezifische Erweiterungen.
// =============================================================================

* #yn-yes "Ja"
* #yn-no "Nein"
// SK1: Tabakprodukte
* #yn-yes-daily "Ja, täglich"
* #yn-yes-occasionally "Ja, gelegentlich"
* #yn-no-not-at-all "Nein, überhaupt nicht"
// SK6A-C: Tabakerhitzer / E-Zigaretten / Nikotinbeutel
* #yn-no-but-formerly "Nein, aber früher"
* #yn-no-never "Nein, noch nie genutzt/konsumiert"
// PL1: Brille/Sehbehinderung
* #yn-severely-visually-impaired "Ich bin stark sehbehindert oder kann nicht sehen"
// PL3: Hörgerät/Gehörlosigkeit
* #yn-severely-hearing-impaired "Ich bin hochgradig schwerhörig oder gehörlos"
// PC2, PC3, HA2, HA3: Hilfe bei Tätigkeiten
* #yn-yes-at-least-one "Ja, bei mindestens einer Tätigkeit"
// UN2A_neu: Psychische Gesundheitsbehandlung erhalten
* #yn-yes-at-least-once "Ja, mindestens einmal"
// UN2A1_neu: Behandlung jedes Mal erhalten
* #yn-yes-always "Ja, jedes Mal"
* #yn-no-not-always "Nein, mindestens einmal nicht"
// UN1A: Behandlung verzögert
* #yn-no-need "Kein Bedarf an medizinischer Versorgung"

// =============================================================================
// GRUPPE 3: Allgemeiner Gesundheitszustand (5-stufig)  [Prefix: health-]
// Skala sehr gut → sehr schlecht (HS1, CD2, KIG1) oder sehr schlecht → sehr gut (LQ1, LQ15).
// Die Ordinalrichtung hängt von der Frage ab; die Codes sind semantisch.
// =============================================================================

* #health-very-good "Sehr gut"
* #health-good "Gut"
* #health-fair "Mittelmäßig"
* #health-poor "Schlecht"
* #health-very-poor "Sehr schlecht"

// =============================================================================
// GRUPPE 4: Funktionseinschränkung  [Prefix: func-]
// 4-stufig: keine → gar nicht (PL2–PL9, PC1, BA1).
// 5-stufig: + "Nicht zutreffend" (HA1) oder + "Kein Interesse" (BA1).
// Sub-Skala HS3a (3-stufig stark/etwas/nicht): func-limited-*
// =============================================================================

* #func-no-difficulty "Keine Schwierigkeiten"
* #func-some-difficulty "Einige Schwierigkeiten"
* #func-a-lot-of-difficulty "Große Schwierigkeiten"
* #func-cannot-do-at-all "Es ist zu schwierig, ich kann es gar nicht"
* #func-not-applicable "Nicht zutreffend"
* #func-not-interested "Kein Interesse an dieser Aktivität, möchte ich nicht tun"
// HS3a – Langzeit-Einschränkungsgrad
* #func-limited-severely "Stark eingeschränkt"
* #func-limited-somewhat "Etwas eingeschränkt"
* #func-not-limited "Nicht eingeschränkt"

// =============================================================================
// GRUPPE 5: Schmerzintensität und -beeinträchtigung  [Prefix: pain-]
// pain-* (PN1): Intensität 6-stufig.
// pain-interf-* (PN2): Alltagsbeeinträchtigung 5-stufig.
// =============================================================================

* #pain-none "Keine Schmerzen"
* #pain-very-mild "Sehr leicht"
* #pain-mild "Leicht"
* #pain-moderate "Mäßig"
* #pain-severe "Stark"
* #pain-very-severe "Sehr stark"
// PN2 – Beeinträchtigung
* #pain-interf-not-at-all "Überhaupt nicht"
* #pain-interf-slightly "Etwas"
* #pain-interf-moderately "Mäßig"
* #pain-interf-quite-a-bit "Ziemlich"
* #pain-interf-extremely "Äußerst"

// =============================================================================
// GRUPPE 6: PHQ-9 – Häufigkeit letzte 2 Wochen  [Prefix: phq-]
// 4-stufig: Nie → Beinahe jeden Tag (MH1).
// =============================================================================

* #phq-never "Nie"
* #phq-several-days "An manchen Tagen"
* #phq-more-than-half-the-days "An mehr als der Hälfte der Tage"
* #phq-nearly-every-day "Beinahe jeden Tag"

// =============================================================================
// GRUPPE 7: WHO-5 – Zeitanteil letzte 2 Wochen  [Prefix: who5-]
// 6-stufig: Die ganze Zeit → Zu keinem Zeitpunkt (MH2).
// =============================================================================

* #who5-all-the-time "Die ganze Zeit"
* #who5-most-of-the-time "Meistens"
* #who5-more-than-half-the-time "Etwas mehr als die Hälfte der Zeit"
* #who5-less-than-half-the-time "Etwas weniger als die Hälfte der Zeit"
* #who5-some-of-the-time "Ab und zu"
* #who5-none-of-the-time "Zu keinem Zeitpunkt"

// =============================================================================
// GRUPPE 8: Ernährungshäufigkeit  [Prefix: diet-]
// Skala A (DH1, DH3, DH5): täglich → nie + meta-unknown.
// Skala B (DH6): wie A, ohne Weiß nicht.
// Skala C (DH7, DH8_neu): abweichende Formulierung Stufe 1 und 4.
// Skala D (DH8 Fisch): feinere Monatsgranularität.
// =============================================================================

* #diet-daily-or-more "Täglich oder mehrmals täglich"
* #diet-4-6-per-week "4 bis 6 Mal pro Woche"
* #diet-1-3-per-week "1 bis 3 Mal pro Woche"
* #diet-less-than-once-per-week "Weniger als einmal pro Woche"
* #diet-never "Nie"
// Skala C: DH7, DH8_neu
* #diet-daily-or-nearly-daily "Täglich oder beinahe täglich"
* #diet-less-often-than-once-per-week "Seltener als einmal pro Woche"
// Skala D: DH8 Fisch
* #diet-3-4-per-week "3 bis 4 Mal pro Woche"
* #diet-1-2-per-week "1 bis 2 Mal pro Woche"
* #diet-1-2-per-month "1 bis 2 Mal pro Monat"
* #diet-less-than-once-per-month "Seltener als einmal pro Monat"

// =============================================================================
// GRUPPE 9: Körperliche Aktivität  [Prefix: activity-]
// activity-*-day(s): Tage/Woche 0–7 (PE2, PE4, PE6, PE8).
// activity-*-min / activity-*h-*: Tagesdauer (PE3, PE5).
// activity-sitting-* …: Arbeitsbelastung (PE1).
// =============================================================================

* #activity-never-or-rarely "Nie oder seltener als einmal pro Woche"
* #activity-1-day "1 Tag pro Woche"
* #activity-2-days "2 Tage pro Woche"
* #activity-3-days "3 Tage pro Woche"
* #activity-4-days "4 Tage pro Woche"
* #activity-5-days "5 Tage pro Woche"
* #activity-6-days "6 Tage pro Woche"
* #activity-7-days "7 Tage pro Woche"
// Tagesdauer
* #activity-10-29-min "10 bis 29 Minuten pro Tag"
* #activity-30-59-min "30 bis 59 Minuten pro Tag"
* #activity-1h-under-2h "1 Stunde bis unter 2 Stunden pro Tag"
* #activity-2h-under-3h "2 Stunden bis unter 3 Stunden pro Tag"
* #activity-3h-or-more "3 Stunden pro Tag oder mehr"
// Arbeitsbelastung (PE1)
* #activity-sitting-or-standing "Vorwiegend sitzen oder stehen"
* #activity-walking-or-moderate "Vorwiegend gehen oder mäßig anstrengende körperliche Tätigkeiten"
* #activity-heavy-physical-work "Vorwiegend schwere körperliche Arbeit oder körperlich beanspruchende Tätigkeiten"
* #activity-no-work-activities "Ich führe keine arbeitsbezogenen Tätigkeiten aus"

// =============================================================================
// GRUPPE 10: Tabakrauch-Passivexposition  [Prefix: smoke-]
// 5-stufig: täglich viel → nie (SK5).
// =============================================================================

* #smoke-daily-1h-or-more "Täglich, eine Stunde oder mehr pro Tag"
* #smoke-daily-less-than-1h "Täglich, weniger als 1 Stunde pro Tag"
* #smoke-at-least-weekly "Mindestens einmal pro Woche (aber nicht täglich)"
* #smoke-less-than-weekly "Weniger als einmal pro Woche"
* #smoke-never-or-rarely "Nie oder fast nie"

// =============================================================================
// GRUPPE 11: WHOQOL-BREF Skalen  [Prefix: whoqol-]
// whoqol-int-*: Intensität (LQ3). whoqol-cap-*: Kapazität (LQ10).
// whoqol-neg-*: Negativgefühle-Häufigkeit (LQ26).
// Die Zufriedenheitsskala (LQ2, LQ16) ist im whoqol-bref-scale CodeSystem definiert.
// =============================================================================

* #whoqol-int-not-at-all "Überhaupt nicht"
* #whoqol-int-a-little "Ein wenig"
* #whoqol-int-moderately "Mittelmäßig"
* #whoqol-int-quite "Ziemlich"
* #whoqol-int-extremely "Äußerst"
* #whoqol-cap-not-at-all "Überhaupt nicht"
* #whoqol-cap-not-really "Eher nicht"
* #whoqol-cap-moderately "Halbwegs"
* #whoqol-cap-mostly "Überwiegend"
* #whoqol-cap-completely "Völlig"
* #whoqol-neg-never "Niemals"
* #whoqol-neg-not-often "Nicht oft"
* #whoqol-neg-sometimes "Zeitweilig"
* #whoqol-neg-often "Oftmals"
* #whoqol-neg-always "Immer"

// =============================================================================
// GRUPPE 12: Kindheitliche Häufigkeit  [Prefix: child-]
// 4- oder 5-stufig (KIG18), berichtet durch Eltern für die vergangene Woche.
// =============================================================================

* #child-never "Nie"
* #child-seldom "Selten"
* #child-sometimes "Manchmal"
* #child-often "Oft"
* #child-always "Immer"

// =============================================================================
// GRUPPE 13: Soziodemographie  [Prefix: socio-]
// Erwerbsstatus (ATHIS_L1), Beschäftigungsform (ATHIS_D2), Teilzeit/Vollzeit (ATHIS_D14),
// Schulbildung (ATHIS_K9), Bildungsdetails (K9a–K9e, K11), Einkommensklassen (H039005).
// =============================================================================

// Erwerbsstatus ATHIS_L1
* #socio-employed "Erwerbstätig oder Lehrling"
* #socio-unemployed "Arbeitssuchend, arbeitslos"
* #socio-retired "In Pension"
* #socio-permanently-disabled "Dauerhaft arbeitsunfähig aus gesundheitlichen Gründen"
* #socio-in-education "In Ausbildung"
* #socio-homemaker "Haushaltsführend"
* #socio-military-or-civil-service "Im Präsenz- oder Zivildienst"
* #socio-other "Sonstiges"
// Beschäftigungsform ATHIS_D2
* #socio-apprentice "Lehrling"
* #socio-worker "Arbeiter:in"
* #socio-employee "Angestellte:r"
* #socio-civil-servant-contract "Vertragsbedienstete:r"
* #socio-civil-servant "Beamt:in"
* #socio-freelancer "Freie:r Dienstnehmer:in"
* #socio-self-employed "Selbstständige:r"
* #socio-unpaid-family-helper "Unbezahlt Mithelfende:r im Familienbetrieb"
// Arbeitszeit ATHIS_D14
* #socio-part-time "Teilzeit"
* #socio-full-time "Vollzeit"
// Schulbildung ATHIS_K9
* #socio-compulsory-school "Pflichtschule"
* #socio-apprenticeship "Lehre mit Berufsschule"
* #socio-vocational-school "Fach- oder Handelsschule"
* #socio-matura "Matura"
* #socio-university-degree "Abschluss an einer Universität oder Hochschule"
* #socio-other-post-secondary "Anderer Abschluss nach der Matura"
// Pflichtschulabschluss ATHIS_K9a
* #socio-completed "Abgeschlossen"
* #socio-not-completed "Nicht abgeschlossen"
// Dauer Fach-/Handelsschule ATHIS_K9b
* #socio-voc-under-2y "Kürzer als 2 Jahre"
* #socio-voc-2y-or-more "2 Jahre und länger"
* #socio-voc-health-diploma "Diplomabschluss in der Gesundheits- und Krankenpflege"
// Maturatyp ATHIS_K9c
* #socio-matura-ahs "AHS wie zum Beispiel Gymnasium, Realgymnasium, ORG"
* #socio-matura-bhs "BHS wie zum Beispiel HAK, HTL, HBLA"
* #socio-matura-apprenticeship "Lehre mit Matura oder Berufsreifeprüfung"
// Hochschulabschluss ATHIS_K9d
* #socio-degree-bachelor "Bachelor/Bakkalaureat"
* #socio-degree-master "Master-, Magister-, Diplomabschluss"
* #socio-degree-doctorate-first "Doktorat als Erstabschluss"
* #socio-degree-postgraduate "Postgradualer Lehrgang wie zum Beispiel MBA, MAS, MSc"
* #socio-degree-doctorate-after "Doktorat nach akademischem Abschluss"
// Sonstiger Abschluss nach Matura ATHIS_K9e
* #socio-other-academy "Akademie, wie zum Beispiel Pädak, SozAK, Med. Tech. Akad, MilAK"
* #socio-other-kolleg "Kolleg, Abiturient:innenlehrgang an einer BHS"
* #socio-other-uni-lehrgang "Hochschul-/Universitätslehrgang als akademisch geprüfte:r 'Berufsbezeichnung'"
// Zusatzausbildung ATHIS_K11
* #socio-add-master-craftsperson "Meister:innen- oder Werkmeister:innenprüfung"
* #socio-add-health-diploma "Diplomabschluss der Gesundheits- und Krankenpflege"
* #socio-add-other "Anderes"
* #socio-add-none "Keine weitere Ausbildung"
// Einkommensklassen ATHIS_H039005 (Haushaltsnettoeinkommen/Monat)
* #socio-income-up-to-600 "Bis 600 Euro"
* #socio-income-up-to-900 "Bis 900 Euro"
* #socio-income-up-to-1200 "Bis 1 200 Euro"
* #socio-income-up-to-1500 "Bis 1 500 Euro"
* #socio-income-up-to-1800 "Bis 1 800 Euro"
* #socio-income-up-to-2200 "Bis 2 200 Euro"
* #socio-income-up-to-2600 "Bis 2 600 Euro"
* #socio-income-up-to-3000 "Bis 3 000 Euro"
* #socio-income-up-to-3500 "Bis 3 500 Euro"
* #socio-income-up-to-4000 "Bis 4 000 Euro"
* #socio-income-up-to-4500 "Bis 4 500 Euro"
* #socio-income-up-to-5000 "Bis 5 000 Euro"
* #socio-income-up-to-6000 "Bis 6 000 Euro"
* #socio-income-up-to-8000 "Bis 8 000 Euro"
* #socio-income-over-8000 "Mehr als 8 000 Euro"

// =============================================================================
// GRUPPE 14: Geschlecht  [Prefix: sex-]
// B1, B2. Codes: [1]=Männlich, [2]=Weiblich, [3]=Anderes.
// =============================================================================

* #sex-male "Männlich"
* #sex-female "Weiblich"
* #sex-other "Anderes"

// =============================================================================
// GRUPPE 15: Familienstand  [Prefix: marital-]
// ATHIS_B4. Codes: [1]–[4].
// =============================================================================

* #marital-single "Ledig"
* #marital-married "Verheiratet oder eingetragene Partnerschaft"
* #marital-widowed "Verwitwet oder hinterbliebene eingetragene Partnerschaft"
* #marital-divorced "Geschieden oder aufgelöste eingetragene Partnerschaft"

// =============================================================================
// GRUPPE 16: Haushaltsbeziehung  [Prefix: relation-]
// C2 (Beziehung zu Ihnen). Codes: [1]–[5].
// =============================================================================

* #relation-partner "Partner:in"
* #relation-child "Kind"
* #relation-parent "Elternteil"
* #relation-sibling "Geschwister"
* #relation-other-member "Anderes Haushaltsmitglied"

// =============================================================================
// GRUPPE 17: Zeitpunkt / Wie lange her  [Prefix: recency-]
// Verschiedene Zeitpunkt-Skalen für Arztbesuche, Vorsorgeuntersuchungen und Impfungen.
// recency-within-6m / recency-6-12m: AM1 (Zahnarzt, 4-stufig)
// recency-within-12m / recency-12m-or-more: AM2, AM8, AM8J (Arzt, 3-stufig)
// recency-within-12m / recency-1-3y … recency-5y-or-more: PA1_2_3 (5-stufig)
// recency-within-12m / recency-1-2y / recency-2-3y / recency-3y-or-more: PA5, PA7_8 (5-stufig)
// recency-within-12m / recency-1-5y / recency-5-10y / recency-10y-or-more: PA6 (5-stufig)
// recency-within-1m … recency-over-1y: KIG25A (Kinderarzt, 5-stufig)
// =============================================================================

* #recency-within-1m "Während des letzten Monats"
* #recency-1-3m "Vor einem bis zu 3 Monaten"
* #recency-3-12m "Vor 3 bis zu 12 Monaten"
* #recency-within-6m "Vor weniger als 6 Monaten"
* #recency-6-12m "Vor 6 bis weniger als 12 Monaten"
* #recency-within-12m "Vor weniger als 12 Monaten / Innerhalb der letzten 12 Monate"
* #recency-12m-or-more "Vor 12 Monaten oder länger"
* #recency-over-1y "Vor mehr als einem Jahr"
* #recency-1-2y "Vor 1 bis weniger als 2 Jahren"
* #recency-1-3y "Vor 1 bis weniger als 3 Jahren"
* #recency-1-5y "Vor 1 bis weniger als 5 Jahren"
* #recency-2-3y "Vor 2 bis weniger als 3 Jahren"
* #recency-3-5y "Vor 3 bis weniger als 5 Jahren"
* #recency-3y-or-more "Vor 3 Jahren oder länger"
* #recency-5-10y "Vor 5 bis weniger als 10 Jahren"
* #recency-5y-or-more "Vor 5 Jahren oder länger"
* #recency-10y-or-more "Vor 10 Jahren oder länger"
* #recency-never "Nie / Noch nie"

// =============================================================================
// GRUPPE 18: Wartezeiten  [Prefix: wait-]
// wait-days-* (AM9): Terminwartezeit in Tagen/Wochen, 6-stufig.
// wait-op-* (OP3): OP-Wartezeit in Wochen/Monaten, 6-stufig.
// =============================================================================

* #wait-days-up-to-1 "Bis zu 1 Tag"
* #wait-days-2-7 "2 bis 7 Tage"
* #wait-days-8-14 "8 bis 14 Tage"
* #wait-days-3-4-weeks "3 bis 4 Wochen"
* #wait-days-5-8-weeks "5 bis 8 Wochen"
* #wait-days-over-8-weeks "Mehr als 8 Wochen"
* #wait-op-up-to-2-weeks "Bis zu 2 Wochen"
* #wait-op-2w-under-1m "2 Wochen bis unter 1 Monat"
* #wait-op-1m-under-2m "1 Monat bis unter 2 Monate"
* #wait-op-2m-under-3m "2 Monate bis unter 3 Monate"
* #wait-op-3m-under-6m "3 Monate bis unter 6 Monate"
* #wait-op-6m-or-more "6 Monate oder mehr"

// =============================================================================
// GRUPPE 19: Pflege und Betreuung  [Prefix: care-]
// care-hours-* (LT3, IC3): Pflegestunden pro Woche, 6-stufig.
// care-provider-* (LT1): Wer pflegt, 3-stufig.
// =============================================================================

* #care-hours-under-5 "Weniger als 5 Stunden pro Woche"
* #care-hours-5-10 "5 Stunden bis weniger als 10 Stunden pro Woche"
* #care-hours-10-20 "10 Stunden bis weniger als 20 Stunden pro Woche"
* #care-hours-20-30 "20 Stunden bis weniger als 30 Stunden pro Woche"
* #care-hours-30-40 "30 Stunden bis weniger als 40 Stunden pro Woche"
* #care-hours-40-or-more "40 Stunden pro Woche oder mehr"
* #care-provider-family "Ja, hauptsächlich durch ein Familienmitglied"
* #care-provider-non-family "Ja, hauptsächlich durch ein Nicht-Familienmitglied"
* #care-provider-none "Nein"

// =============================================================================
// GRUPPE 20: Zufriedenheit Gesundheitsversorgung  [Prefix: satisfaction-]
// satisfaction-quality-* (ZG1): Qualität allgemein, 5-stufig.
// satisfaction-service-* (ZG3): Zufriedenheit mit Diensten, 6-stufig (+ nicht zutreffend).
// =============================================================================

* #satisfaction-quality-excellent "Hervorragend"
* #satisfaction-quality-very-good "Sehr gut"
* #satisfaction-quality-good "Gut"
* #satisfaction-quality-adequate "Ausreichend"
* #satisfaction-quality-poor "Schlecht"
* #satisfaction-service-very-satisfied "Sehr zufrieden"
* #satisfaction-service-rather-satisfied "Eher zufrieden"
* #satisfaction-service-moderate "Mittelmäßig"
* #satisfaction-service-rather-unsatisfied "Eher unzufrieden"
* #satisfaction-service-very-unsatisfied "Sehr unzufrieden"
* #satisfaction-service-not-applicable "Nicht zutreffend"

// =============================================================================
// GRUPPE 21: Soziale Faktoren  [Prefix: social-]
// social-support-* (SS1): Anzahl vertrauenswerter Personen, 4-stufig.
// social-interest-* (SS2): Anteilnahme anderer, 5-stufig.
// social-help-* (SS3): Einfachheit Nachbarschaftshilfe, 5-stufig.
// =============================================================================

* #social-support-none "Keine"
* #social-support-1-2 "1 oder 2 Personen"
* #social-support-3-5 "3 bis 5 Personen"
* #social-support-6-or-more "6 Personen oder mehr"
* #social-interest-a-lot "Viel"
* #social-interest-some "Etwas"
* #social-interest-neither "Weder viel noch wenig"
* #social-interest-little "Wenig"
* #social-interest-none "Keinerlei Anteilnahme und Interesse"
* #social-help-very-easy "Sehr einfach"
* #social-help-easy "Einfach"
* #social-help-possible "Möglich"
* #social-help-difficult "Schwierig"
* #social-help-very-difficult "Sehr schwierig"

// =============================================================================
// GRUPPE 22: Alkohol – Konsumtage  [Prefix: alcohol-]
// alcohol-wkday-* (AL2): Montag–Donnerstag (4 Tage), 5-stufig.
// alcohol-wkend-* (AL4): Freitag–Sonntag (3 Tage), 4-stufig.
// =============================================================================

* #alcohol-wkday-all-4 "An allen 4 Tagen"
* #alcohol-wkday-3 "An 3 Tagen"
* #alcohol-wkday-2 "An 2 Tagen"
* #alcohol-wkday-1 "An 1 Tag"
* #alcohol-wkday-none "An keinem dieser 4 Tage"
* #alcohol-wkend-all-3 "An allen 3 Tagen"
* #alcohol-wkend-2 "An 2 Tagen"
* #alcohol-wkend-1 "An 1 Tag"
* #alcohol-wkend-none "An keinem dieser 3 Tage"

// =============================================================================
// GRUPPE 23: Praxistyp  [Prefix: practice-]
// AM10, KIG25B: Kassenordination vs. Wahlordination/Privatordination.
// =============================================================================

* #practice-health-fund "Kassenordination"
* #practice-private "Wahlordination/Privatordination"

// =============================================================================
// GRUPPE 24: Kostenübernahme Krankenkasse  [Prefix: insurance-]
// KIG26B: Kostenübernahme für Psychotherapie/Psychologie.
// =============================================================================

* #insurance-fully-covered "Ja, die gesamten Kosten wurden übernommen"
* #insurance-partially-covered "Ja, ein Teil der Kosten wurde übernommen"
* #insurance-not-covered "Nein, die Kosten wurden nicht übernommen"

// =============================================================================
// GRUPPE 25: Barrieren für psychische Gesundheitsversorgung  [Prefix: barrier-]
// UN2B_neu: Hauptgrund für ausgebliebene Psychotherapie/Beratung, 9-stufig.
// =============================================================================

* #barrier-too-expensive "Konnte es mir nicht leisten (zu teuer oder nicht von der Krankenkasse übernommen)"
* #barrier-waiting-list "Warteliste"
* #barrier-no-time "Keine Zeit wegen Arbeit/Betreuung von Kindern oder anderen Personen"
* #barrier-too-far "Zu weite Anreise/kein Verkehrsmittel verfügbar"
* #barrier-confidentiality-concerns "Bedenken hinsichtlich Vertraulichkeit und Diskretion"
* #barrier-fear-of-reactions "Angst vor negativen Reaktionen oder Kommentaren von Familie, Freund:innen oder Kolleg:innen"
* #barrier-fear-of-treatment "Angst vor der Beratung oder Behandlung (zum Beispiel Angst vor einem negativen Ausgang oder Angst vor den Nebenwirkungen von Medikamenten)"
* #barrier-no-knowledge "Kein Wissen darüber, wo man Hilfe suchen kann"
* #barrier-other-reason "Anderer Grund"
