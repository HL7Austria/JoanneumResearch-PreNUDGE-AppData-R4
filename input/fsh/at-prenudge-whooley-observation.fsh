// LOINC 55757-9 "Patient Health Questionnaire 2 item (PHQ-2) [Reported]" is the closest
// available standardised code for a PHQ-2 screening result. The Whooley variant used here
// differs from the standard PHQ-2: binary Ja/Nein responses over the last month instead of
// a 0-3 severity score over two weeks.
Profile: AtPrenudgeObservationWhooley
Parent: AtPrenudgeObservation
Id: at-prenudge-whooley-observation
Title: "AT PreNUDGE Observation Whooley Depression Screening"
Description: "Records the binary result of the PHQ-2/Whooley depression screening (Ja/Nein-Version) as referenced in the Nationale VersorgungsLeitlinie Depression (AWMF nvl-005, https://register.awmf.org/de/leitlinien/detail/nvl-005). The reference period is the last month (letzter Monat), not the standard PHQ-2 period of two weeks. Interpretation of valueCodeableConcept: SNOMED CT 10828004 (Positive) = both Whooley questions answered 'Ja' (positive depression screen); SNOMED CT 260385009 (Negative) = at least one answer was 'Nein' (negative screen). Werden beide Fragen mit 'Ja' beantwortet, identifiziert der Test das Vorliegen depressiver Störungen mit einer Sensitivität von 96 % und einer Spezifität von 57 % (NVL Depression, AWMF nvl-005)."

* code = http://loinc.org#55757-9 "Patient Health Questionnaire 2 item (PHQ-2) [Reported]"

* value[x] 0..1
* value[x] only CodeableConcept
* valueCodeableConcept from AtPrenudgeValueSetWhooleyScreenResult (required)
* valueCodeableConcept ^short = "SNOMED 10828004 = positive screen (both Ja); SNOMED 260385009 = negative screen (at least one Nein)"

* derivedFrom MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "QuestionnaireResponse from which this screening result was derived"
