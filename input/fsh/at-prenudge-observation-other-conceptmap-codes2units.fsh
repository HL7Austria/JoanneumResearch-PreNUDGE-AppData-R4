Instance: AtPrenudgeCodeUnitMap
InstanceOf: ConceptMap
Usage: #definition
Title: "AT PreNUDGE Code-to-Unit Mapping"
Description: "Maps observation codes to their expected UCUM units for the 'Other' observation profile."

* url = "https://fhir.hl7.at/prenudge/appdata/r4/ConceptMap/AtPrenudgeCodeUnitMap"
* status = #active
* experimental = false
* sourceUri = "https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-other-observations-codes"
* targetUri = "https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-other-observations-units"

* group[+]
  * source = "http://snomed.info/sct"
  * target = "http://unitsofmeasure.org"
  * element[+]
    * code = #82832008
    * display = "General body state finding (finding)"
    * target[+]
      * code = #{finding}
      * display = "finding"
      * equivalence = #equivalent
      * comment = "Subjective well-being rating on a numeric scale (e.g., 1-10)."

* group[+]
  * source = "http://loinc.org"
  * target = "http://unitsofmeasure.org"
  * element[+]
    * code = #66266-8
    * display = "Time doing this activity"
    * target[+]
      * code = #min
      * display = "minute"
      * equivalence = #equivalent
      * comment = "Duration of the activity in minutes."
  * element[+]
    * code = #66270-0
    * display = "Activity intensity"
    * target[+]
      * code = #{intensity}
      * display = "intensity"
      * equivalence = #equivalent
      * comment = "Subjective intensity rating on a numeric scale (e.g., 1-10, where 1 = very light and 10 = maximum effort)."