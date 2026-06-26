// LOINC 73832-8 "Adult depression screening assessment" is used as a tool-agnostic code
// for the binary screening result. It is designed for quality reporting where the exact
// instrument is not specified and supports positive/negative answer values.
Profile: AtPrenudgeObservationWhooley
Parent: AtPrenudgeObservation
Id: at-prenudge-whooley-observation
Title: "AT PreNUDGE Observation Whooley Depression Screening"
Description: "Records the binary result of the PHQ-2/Whooley depression screening (Ja/Nein-Version) as referenced in the Nationale VersorgungsLeitlinie Depression (AWMF nvl-005, https://register.awmf.org/de/leitlinien/detail/nvl-005). The reference period is the last month (letzter Monat), not the standard PHQ-2 period of two weeks. Interpretation of valueCodeableConcept: SNOMED CT 10828004 (Positive) = both Whooley questions answered 'Ja' (positive depression screen); SNOMED CT 260385009 (Negative) = at least one answer was 'Nein' (negative screen). Werden beide Fragen mit 'Ja' beantwortet, identifiziert der Test das Vorliegen depressiver Störungen mit einer Sensitivität von 96 % und einer Spezifität von 57 % (NVL Depression, AWMF nvl-005)."

* code = http://loinc.org#73832-8 "Adult depression screening assessment"

* value[x] 0..1
* value[x] only CodeableConcept
* valueCodeableConcept from AtPrenudgeValueSetWhooleyScreenResult (required)
* valueCodeableConcept ^short = "SNOMED 10828004 = positive screen (both Ja); SNOMED 260385009 = negative screen (at least one Nein)"

* derivedFrom MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "QuestionnaireResponse from which this screening result was derived"
