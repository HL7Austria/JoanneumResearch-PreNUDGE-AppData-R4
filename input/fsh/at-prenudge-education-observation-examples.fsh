Alias: $isced = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-isced-2011-education-level

Instance: education-bachelor-example
InstanceOf: AtPrenudgeObservationEducation
Usage: #example
Title: "Education O mapped from Q - ISCED 6–8 Higher Education Example"
Description: "Example of a highest completed education observation mapped from the EducationQuestionnaire."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-education-2026-03-20-001"
* status = #final
* code = http://loinc.org#82589-3 "Highest level of education"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-20T09:00:00Z"
* issued = "2026-03-20T09:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueCodeableConcept = $isced#isced-6-8 "ISCED 6–8: Hochschulabschlüsse (Bachelor, Master, Doktor)"
* note[+].text = "Bachelorabschluss an einer Fachhochschule."
* derivedFrom = Reference(QuestionnaireResponse/education-response-bachelor-example)


Instance: education-upper-secondary-example
InstanceOf: AtPrenudgeObservationEducation
Usage: #example
Title: "Education O mapped from Q - ISCED 3c Example"
Description: "Example of a highest completed education observation mapped from the EducationQuestionnaire."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-education-2026-03-21-001"
* status = #final
* code = http://loinc.org#82589-3 "Highest level of education"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-21T10:30:00Z"
* issued = "2026-03-21T10:30:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueCodeableConcept = $isced#isced-3c "ISCED 3c: Berufsbildende höhere Schulen (HAK, HBLA, HTL) und AHS-Oberstufe"
* derivedFrom = Reference(QuestionnaireResponse/education-response-upper-secondary-example)
