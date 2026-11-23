Profile: AtPrenudgeObservationNutritionSugarSaltyFrequency
Parent: AtPrenudgeObservation
Id: at-prenudge-nutrition-sugarsalty-observation
Title: "AT PreNUDGE Observation Nutrition Sugar Salty Frequency"
Description: "Records the self-reported consumption frequency category for fatty, sugary, and salty foods and energy-dense drinks in a typical week, using the PreNUDGE minimal-set adaptation of ATHIS 2025 item DH6. Coded using SNOMED CT 364395008 'Dietary intake (observable entity)' as the observation concept; update if a more specific LOINC code is identified for this measurement."

* code = http://snomed.info/sct#364395008 "Dietary intake (observable entity)"
* value[x] 0..1
* value[x] only CodeableConcept
* valueCodeableConcept from AtPrenudgeValueSetNutritionSugarSaltyFrequency (required)
* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this observation was derived"
