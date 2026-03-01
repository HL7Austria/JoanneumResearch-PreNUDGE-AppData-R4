Instance: whoqol-bref-score-example
InstanceOf: AtPrenudgeObservationWHOQOLBrefScore
Usage: #example
Title: "WHOQOL-BREF Score"
Description: "Example of a WHOQOL-BREF score observation with a general score and all four domain scores."

* identifier[+]
  * system = "http://cdehealth.org/fhir/observation-id"
  * value = "whoqol-bref-2026-02-28-001"
* status = #final
* code = http://snomed.info/sct#405152002
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-02-28"
* method = http://snomed.info/sct#8359006 "Automated"
* derivedFrom = Reference(QuestionnaireResponse/whoqol-bref-response-example)

* component[generalized]
  * code = http://snomed.info/sct#60132005 "Generalized"
  * valueQuantity
    * value = 75.0
    * unit = "score"
    * system = "http://unitsofmeasure.org"
    * code = #{score}

* component[physical]
  * code = http://snomed.info/sct#19388002 "Physical"
  * valueQuantity
    * value = 78.6
    * unit = "score"
    * system = "http://unitsofmeasure.org"
    * code = #{score}

* component[psychological]
  * code = http://snomed.info/sct#60224009 "Psychologic"
  * valueQuantity
    * value = 70.8
    * unit = "score"
    * system = "http://unitsofmeasure.org"
    * code = #{score}

* component[relationships]
  * code = http://snomed.info/sct#272151006 "Relationships"
  * valueQuantity
    * value = 66.7
    * unit = "score"
    * system = "http://unitsofmeasure.org"
    * code = #{score}

* component[environment]
  * code = http://snomed.info/sct#276339004 "Environment"
  * valueQuantity
    * value = 62.5
    * unit = "score"
    * system = "http://unitsofmeasure.org"
    * code = #{score}