Profile: AtPrenudgeObservationSleepQuality
Parent: AtPrenudgeObservation
Id: at-prenudge-sleep-quality-observation
Title: "AT PreNUDGE Observation Sleep Quality"
Description: "Records self-reported satisfaction with sleep over the past two weeks (WHOQOL-BREF Q16), collected via the standalone sleep questionnaire or the full WHOQOL-BREF."

* code = http://loinc.org#98933-5 "Satisfaction with sleep in last 2 weeks"
* method = http://snomed.info/sct#87982008 "Manual"

* value[x] 0..1
* value[x] only CodeableConcept
* valueCodeableConcept from AtPrenudgeValueSetSleepSatisfaction (required)

* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this observation was derived"
