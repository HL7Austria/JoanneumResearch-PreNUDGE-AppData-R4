// LOINC 61987-4 "My sleep quality was...in past 7 days [PROMIS]" used for self-assessed sleep satisfaction (WHOQOL-BREF Q16 also maps to this Observation)
Profile: AtPrenudgeObservationSleepQuality
Parent: AtPrenudgeObservation
Id: at-prenudge-sleep-quality-observation
Title: "AT PreNUDGE Observation Sleep Quality"
Description: "Records the self-assessed sleep quality from PROMIS (My sleep quality was...in past 7 days). Also used to map WHOQOL-BREF Q16 from standalone SleepQualityQuestionnaire or the full WhoQolBrefQuestionnaire."

* code = http://loinc.org#61987-4 "My sleep quality was...in past 7 days [PROMIS]"

* value[x] 0..1
* value[x] only CodeableConcept

* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this observation was derived"
