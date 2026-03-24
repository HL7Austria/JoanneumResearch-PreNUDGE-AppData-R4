Instance: alcoholuse-occasional-example
InstanceOf: AtPrenudgeObservationAlcoholUse
Usage: #example
Title: "Alcohol Use O mapped from Q - Daily"
Description: "Example of an alcohol use observation for a daily drinker (1 drink per day)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-alc-2026-02-20-001"
* status = #final
* code = http://loinc.org#74013-4 "Alcoholic drinks per day"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-02-20"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 1
  * unit = "drinks/day"
  * system = "http://unitsofmeasure.org"
  * code = #{drinks}/d

Instance: alcoholuse-never-example
InstanceOf: AtPrenudgeObservationAlcoholUse
Usage: #example
Title: "Alcohol Use O mapped from Q - Non-Drinker"
Description: "Example of an alcohol use observation for a lifetime non-drinker (0 drinks per day)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "qr-alc-2026-02-27-001"
* status = #final
* code = http://loinc.org#74013-4 "Alcoholic drinks per day"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-02-27"
* method = http://snomed.info/sct#87982008 "Manual"
* valueQuantity
  * value = 0
  * unit = "drinks/day"
  * system = "http://unitsofmeasure.org"
  * code = #{drinks}/d
* note[+].text = "Ich trinke zwar nicht, bin aber als Kind in ein Fass hausgemachten Schnaps gefallen. Zählt das?"

Instance: alcoholuse-moderate-example
InstanceOf: AtPrenudgeObservationAlcoholUse
Usage: #example
Title: "Alcohol Use O - Moderate (3-4 times weekly)"
Description: "Example of an alcohol use observation for a moderate drinker consuming alcohol 3-4 times per week (0.5 drinks per day)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-alc-2026-03-03-001"
* status = #final
* code = http://loinc.org#74013-4 "Alcoholic drinks per day"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-03"
* method = http://snomed.info/sct#8359006 "Automated"
* valueQuantity
  * value = 0.5
  * unit = "drinks/day"
  * system = "http://unitsofmeasure.org"
  * code = #{drinks}/d