Instance: smokingstatus-current-every-day-example
InstanceOf: AtPrenudgeObservationSmokingStatus
Usage: #example
Title: "Smoking Status O mapped from ATHIS Q - Current Daily Tobacco Smoker Example"
Description: "Example of a smoking status observation for a current daily tobacco smoker, mapped from SK1 of the ATHIS-based SmokingStatusQuestionnaire."
* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-smokingstatus-2026-03-10-001"
* status = #final
* code = http://loinc.org#72166-2 "Tobacco smoking status"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-10"
* issued = "2026-03-10T00:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueCodeableConcept = http://snomed.info/sct#449868002 "Smokes tobacco daily"
* note[+].text = "Ich rauche derzeit täglich, aber weniger als früher."
* derivedFrom = Reference(QuestionnaireResponse/SmokingStatusResponseCurrentEveryDay)

Instance: smokingstatus-former-example
InstanceOf: AtPrenudgeObservationSmokingStatus
Usage: #example
Title: "Smoking Status O mapped from ATHIS Q - Former Tobacco Smoker Example"
Description: "Example of a smoking status observation for a former tobacco smoker, mapped from SK1 and the past tobacco smoking question of the ATHIS-based SmokingStatusQuestionnaire."
* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-smokingstatus-2026-03-11-001"
* status = #final
* code = http://loinc.org#72166-2 "Tobacco smoking status"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-11"
* issued = "2026-03-11T00:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueCodeableConcept = http://snomed.info/sct#8517006 "Ex-smoker"
* derivedFrom = Reference(QuestionnaireResponse/SmokingStatusResponseFormer)

Instance: smokingstatus-never-example
InstanceOf: AtPrenudgeObservationSmokingStatus
Usage: #example
Title: "Smoking Status O mapped from ATHIS Q - Never Tobacco Smoker Example"
Description: "Example of a smoking status observation for a person who never smoked tobacco, mapped from SK1 and the past tobacco smoking question of the ATHIS-based SmokingStatusQuestionnaire."
* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-smokingstatus-2026-03-12-001"
* status = #final
* code = http://loinc.org#72166-2 "Tobacco smoking status"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-12"
* issued = "2026-03-12T00:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* valueCodeableConcept = http://snomed.info/sct#266919005 "Never smoked tobacco"
* derivedFrom = Reference(QuestionnaireResponse/SmokingStatusResponseNever)

Instance: smokingstatus-not-stated-example
InstanceOf: AtPrenudgeObservationSmokingStatus
Usage: #example
Title: "Smoking Status O - Not Stated Example"
Description: "Example of a smoking status observation where no clinically meaningful smoking status could be derived because the respondent declined to answer."

* identifier[+]
  * system = "https://www.joanneum.at"
  * value = "obs-smokingstatus-2026-03-13-not-stated"
* status = #final
* code = http://loinc.org#72166-2 "Tobacco smoking status"
* subject = Reference(Patient/example)
* effectiveDateTime = "2026-03-13"
* issued = "2026-03-13T00:00:00Z"
* method = http://snomed.info/sct#87982008 "Manual"
* dataAbsentReason = http://terminology.hl7.org/CodeSystem/data-absent-reason#asked-declined "Asked But Declined"
* derivedFrom = Reference(QuestionnaireResponse/SmokingStatusResponseNotStated)