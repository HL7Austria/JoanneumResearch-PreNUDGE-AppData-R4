// LOINC 61987-4 "Sleep quality" used for self-assessed sleep satisfaction (WHOQOL-BREF Q16)
Profile: AtPrenudgeObservationSleepQuality
Parent: AtPrenudgeObservation
Id: at-prenudge-sleep-quality-observation
Title: "AT PreNUDGE Observation Sleep Quality (WHOQOL-BREF Q16)"
Description: "Records the self-assessed sleep quality from WHOQOL-BREF Q16 ('Wie zufrieden sind Sie mit Ihrem Schlaf?') as a raw answer on the WHOQOL-BREF Satisfaction scale (S1-S5). Can be derived from the standalone SleepQualityQuestionnaire or the full WhoQolBrefQuestionnaire."

* code = http://loinc.org#61987-4 "Sleep quality"

* value[x] 1..1
* value[x] only CodeableConcept

* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this observation was derived"
