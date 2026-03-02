Instance: alcoholuse-occasional-example
InstanceOf: AtPrenudgeObservationAlcoholUse
Usage: #example
Title: "Alcohol Use O - Daily"
Description: "Observation example of an alcohol use observation for a daily drinker (1 drink per day)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-alc-2026-02-20-001"
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
Title: "Alcohol Use O - Non-Drinker"
Description: "Observation example of an alcohol use observation for a lifetime non-drinker (0 drinks per day)."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-alc-2026-02-27-001"
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