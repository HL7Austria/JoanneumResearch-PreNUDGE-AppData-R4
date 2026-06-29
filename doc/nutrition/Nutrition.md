# Prompt

This FHIR-IG defines how app and wearable providers deliver health observations
to the PreNUDGE platform. The toolchain is SUSHI (FSH → FHIR JSON) + HL7 FHIR IG Publisher.

Please create a prompt for Claude Code to extend this PreNUDGE FHIR R4 Implementation Guide with a `Nutrition` domain for the following two questionnaires - `ATHIS 2025 Erhebung Gesundheit und Lebensstil` (STATISTIK AUSTRIA - https://www.statistik.at/fileadmin/pages/2099/ATHIS_2025.pdf)

The questions must be in german.

Feel free to ask questions.

## Portions of fruit and vegetables (per day)

**Zunächst geht es um Obst, das können frische oder gefrorene, getrocknete oder pürierte
Früchte sein. Nicht gemeint sind Obstsäfte.**
 
**DH1 - Wie oft essen Sie Obst?**

Antwortmöglichkeiten:

* Täglich oder mehrmals täglich [1] 
* 4 bis 6 Mal pro Woche [2] 
* 1 bis 3 Mal pro Woche [3] 
* Weniger als einmal pro Woche [4] 
* Nie [5]
* Weiß nicht [-1]

**DH2: Wie viele Portionen Obst essen Sie pro Tag? Eine Portion entspricht einer Handvoll Obst.**

Eine Handvoll Obst kann sein: 
* 1 Apfel, 1 Banane, 1 Pfirsich, 2 Zwetschken, 2 Mandarinen, 2 Kiwis, 3 Marillen, 7
Erdbeeren, eine halbe Grapefruit 
* drei große Löffel ungezuckerter Obstsalat
* bei halben Portionen aufrunden.

___ Portionen (Wertebereich: 1–99)
    
**Und nun zum Gemüse, das kann frisch oder gefroren, roh oder gekocht sein. Kartoffeln, Gemüsesäfte oder Gemüsesuppen zählen nicht dazu**
  
**DH3: Wie oft essen Sie Gemüse oder Salat?** 

Antwortmöglichkeiten: 

* Täglich oder mehrmals täglich [1]
* 4 bis 6 Mal pro Woche [2]
* 1 bis 3 Mal pro Woche [3]
* Weniger als einmal pro Woche [4]
* Nie [5]
* Weiß nicht [-1]

**DH4: Wie viele Portionen Gemüse oder Salat essen Sie pro Tag? Eine Portion entspricht einer Handvoll Gemüse oder Salat.**

Eine Handvoll Gemüse oder Salat kann sein:
* 2 Brokkoli-Stämme, 8 Karfiol-Rosen, 4 gehäufte Suppenlöffel Kraut oder Spinat
* 3 gehäufte Suppenlöffel gedünstetes Gemüse
* ein mittlerer Paradeiser, ein 5 cm großes Stück Gurke
* bei halben Portionen aufrunden.

___ Portionen (Wertebereich: 1–99)


## Consumption frequency of sugary and salty foods (per week)

**DH6: Wie oft konsumieren Sie fett-, zucker- und salzreiche Lebensmittel, wie Süßigkeiten, Mehlspeisen, Knabbereien und trinken Sie energiereiche Getränke wie Limonaden?**

Antwortmöglichkeiten:

* Täglich oder mehrmals täglich [1]
* 4 bis 6 Mal pro Woche [2]
* 1 bis 3 Mal pro Woche [3]
* Weniger als einmal pro Woche [4]
* Nie [5]

Sie sind unsicher, was mit zuckerhaltigen Erfrischungsgetränken gemeint ist?

Dazu zählen:
* zuckerhaltige Erfrischungsgetränke („Softdrinks“) wie zum Beispiel Cola, Fanta, Sprite, Eistee, Energy-
Drinks
* zuckerhaltige Limonaden
* zuckerhaltige Sirup-Getränke

Nicht dazu zählen:
* Erfrischungsgetränke mit ausschließlich künstlichen Süßstoffen
* Diät-, Light- und Zero-Getränke
* gezuckerter Tee oder Kaffee