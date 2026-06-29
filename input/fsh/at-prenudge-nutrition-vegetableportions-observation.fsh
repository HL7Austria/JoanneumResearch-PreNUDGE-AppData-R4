Profile: AtPrenudgeObservationNutritionVegetablePortions
Parent: AtPrenudgeObservation
Id: at-prenudge-nutrition-vegetableportions-observation
Title: "AT PreNUDGE Observation Nutrition Vegetable Portions"
Description: "Records self-reported daily portions of vegetables or salad based on ATHIS 2025 question DH4. Applicable only for respondents who eat vegetables daily (DH3 = 'Täglich oder mehrmals täglich'). Observation code: LOINC 89764-8 'Servings of vegetables per day [PhenX]'."

* code = http://loinc.org#89764-8 "Servings of vegetables per day [PhenX]"
* value[x] 1..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.unit = "Portionen"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #{serving}
* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this observation was derived"
* obeys nutrition-vegetable-portions-range

Invariant: nutrition-vegetable-portions-range
Severity: #error
Description: "Vegetable portions per day must be between 1 and 99."
Expression: "value.ofType(Quantity).value >= 1 and value.ofType(Quantity).value <= 99"
