Profile: AtPrenudgeObservationNutritionSugarSaltyFrequency
Parent: AtPrenudgeObservation
Id: at-prenudge-nutrition-sugarsalty-observation
Title: "AT PreNUDGE Observation Nutrition Sugar Salty Frequency"
Description: "Records self-reported consumption frequency of sugary, fatty, and salty foods and energy-dense drinks, based on ATHIS 2025 question DH6. Coded using SNOMED CT 364395008 'Pattern of food and drink intake (observable entity)' as the observation concept; update if a more specific LOINC code is identified for this measurement."

* code = http://snomed.info/sct#364395008 "Pattern of food and drink intake (observable entity)"
* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from AtPrenudgeValueSetNutritionSugarSaltyFrequency (required)
* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this observation was derived"
