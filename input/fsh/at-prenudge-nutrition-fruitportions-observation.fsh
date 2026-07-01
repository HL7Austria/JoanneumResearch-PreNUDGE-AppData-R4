Profile: AtPrenudgeObservationNutritionFruitPortions
Parent: AtPrenudgeObservation
Id: at-prenudge-nutrition-fruitportions-observation
Title: "AT PreNUDGE Observation Nutrition Fruit Portions"
Description: "Records self-reported daily portions of fruit based on ATHIS 2025 question DH2. Applicable only for respondents who eat fruit daily (DH1 = 'Täglich oder mehrmals täglich'). Observation code: LOINC 80457-5 'Fruit servings 24 hour Estimated'."

* code = http://loinc.org#80457-5 "Fruit servings 24 hour Estimated"
* value[x] 1..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.unit = "Portionen"
* valueQuantity.system = "http://unitsofmeasure.org"
* valueQuantity.code = #{serving}
* derivedFrom 0..* MS
* derivedFrom only Reference(QuestionnaireResponse)
* derivedFrom ^short = "Reference to the QuestionnaireResponse from which this observation was derived"
* obeys nutrition-fruit-portions-range

Invariant: nutrition-fruit-portions-range
Severity: #error
Description: "Fruit portions per day must be between 1 and 99."
Expression: "value.ofType(Quantity).value >= 1 and value.ofType(Quantity).value <= 99"
