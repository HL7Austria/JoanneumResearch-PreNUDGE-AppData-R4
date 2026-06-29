Alias: $athis = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers

Instance: NutritionFruitVegetableQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/NutritionFruitVegetableQuestionnaire"
* name = "NutritionFruitVegetableQuestionnaire"
* title = "Portionen Obst und Gemüse pro Tag"
* status = #active
* experimental = false
* subjectType = #Patient
* description = "Questionnaire based on ATHIS 2025 questions DH1–DH4 (STATISTIK AUSTRIA) to self-report daily portions of fruit and vegetables. DH2 is only enabled when DH1 = 'Täglich oder mehrmals täglich'; DH4 is only enabled when DH3 = 'Täglich oder mehrmals täglich'."

* item[+]
  * linkId = "DH1"
  * text = "Zunächst geht es um Obst, das können frische oder gefrorene, getrocknete oder pürierte Früchte sein. Nicht gemeint sind Obstsäfte.\n\nDH1 - Wie oft essen Sie Obst?"
  * type = #choice
  * required = true
  * repeats = false
  * answerOption[+].valueCoding = $athis#diet-daily-or-more "Täglich oder mehrmals täglich"
  * answerOption[+].valueCoding = $athis#diet-4-6-per-week "4 bis 6 Mal pro Woche"
  * answerOption[+].valueCoding = $athis#diet-1-3-per-week "1 bis 3 Mal pro Woche"
  * answerOption[+].valueCoding = $athis#diet-less-than-once-per-week "Weniger als einmal pro Woche"
  * answerOption[+].valueCoding = $athis#diet-never "Nie"
  * answerOption[+].valueCoding = $athis#meta-unknown "Weiß nicht"
  * item[+]
    * linkId = "DH1-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

* item[+]
  * linkId = "DH2"
  * text = "DH2: Wie viele Portionen Obst essen Sie pro Tag? Eine Portion entspricht einer Handvoll Obst.\n\nEine Handvoll Obst kann sein:\n- 1 Apfel, 1 Banane, 1 Pfirsich, 2 Zwetschken, 2 Mandarinen, 2 Kiwis, 3 Marillen, 7 Erdbeeren, eine halbe Grapefruit\n- drei große Löffel ungezuckerter Obstsalat\n- bei halben Portionen aufrunden."
  * type = #integer
  * required = true
  * repeats = false
  * enableWhen[+]
    * question = "DH1"
    * operator = #=
    * answerCoding = $athis#diet-daily-or-more
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/minValue"
    * valueInteger = 1
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
    * valueInteger = 99
  * item[+]
    * linkId = "DH2-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

* item[+]
  * linkId = "DH3"
  * text = "Und nun zum Gemüse, das kann frisch oder gefroren, roh oder gekocht sein. Kartoffeln, Gemüsesäfte oder Gemüsesuppen zählen nicht dazu.\n\nDH3: Wie oft essen Sie Gemüse oder Salat?"
  * type = #choice
  * required = true
  * repeats = false
  * answerOption[+].valueCoding = $athis#diet-daily-or-more "Täglich oder mehrmals täglich"
  * answerOption[+].valueCoding = $athis#diet-4-6-per-week "4 bis 6 Mal pro Woche"
  * answerOption[+].valueCoding = $athis#diet-1-3-per-week "1 bis 3 Mal pro Woche"
  * answerOption[+].valueCoding = $athis#diet-less-than-once-per-week "Weniger als einmal pro Woche"
  * answerOption[+].valueCoding = $athis#diet-never "Nie"
  * answerOption[+].valueCoding = $athis#meta-unknown "Weiß nicht"
  * item[+]
    * linkId = "DH3-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

* item[+]
  * linkId = "DH4"
  * text = "DH4: Wie viele Portionen Gemüse oder Salat essen Sie pro Tag? Eine Portion entspricht einer Handvoll Gemüse oder Salat.\n\nEine Handvoll Gemüse oder Salat kann sein:\n- 2 Brokkoli-Stämme, 8 Karfiol-Rosen, 4 gehäufte Suppenlöffel Kraut oder Spinat\n- 3 gehäufte Suppenlöffel gedünstetes Gemüse\n- ein mittlerer Paradeiser, ein 5 cm großes Stück Gurke\n- bei halben Portionen aufrunden."
  * type = #integer
  * required = true
  * repeats = false
  * enableWhen[+]
    * question = "DH3"
    * operator = #=
    * answerCoding = $athis#diet-daily-or-more
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/minValue"
    * valueInteger = 1
  * extension[+]
    * url = "http://hl7.org/fhir/StructureDefinition/maxValue"
    * valueInteger = 99
  * item[+]
    * linkId = "DH4-comment"
    * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string
