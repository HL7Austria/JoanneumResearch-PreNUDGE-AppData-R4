Alias: $athis-smoking = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-athis-smoking

CodeSystem: AtPrenudgeCodeSystemAthisSmoking
Id: prenudge-athis-smoking
Title: "AT PreNUDGE ATHIS Smoking Answer Codes"
Description: "Local answer codes for ATHIS smoking questionnaire items used in the PreNUDGE smoking status questionnaire. These codes preserve the questionnaire semantics and are mapped to SNOMED CT only where a clinical smoking-status Observation is derived."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/prenudge-athis-smoking"
* ^status = #active
* ^experimental = false
* ^caseSensitive = true
* #status-no "Nein"
* #status-occasional "Ja, gelegentlich"
* #status-daily "Ja, täglich"
* #yes "Ja"
* #no "Nein"
* #use-daily "Ja, täglich"
* #use-occasional "Ja, gelegentlich"
* #use-former "Nein, aber früher"
* #use-never "Nein, habe ich noch nie genutzt"

ValueSet: AtPrenudgeValueSetAthisTobaccoSmokingSnomedVS
Id: prenudge-smokingstatus-snomed
Title: "AT PreNUDGE Smoking Status Current/Past"
Description: "Current/Past smoking status answer options used for the derived PreNUDGE smoking status observation. The SNOMED CT concepts follow the IPS smoking-status mapping for LOINC 72166-2 where possible. The ATHIS questionnaire itself uses local survey answer codes."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-smokingstatus"
* ^status = #active
* ^experimental = false
* ^copyright = "Description: Contains information protected by copyright of SNOMED International. Any use of SNOMED CT in Austria requires a valid affiliate license or sublicense. The corresponding license is free of charge, provided that the use only takes place in Austria and fulfills the conditions of the Affiliate License Agreement. Affiliate licenses can be requested directly from the respective NRC via the Member Licensing and Distribution Service (MLDS).https://wiki.hl7.at/index.php?title=SCT:SNOMED_CT\n\nBeschreibung: Enthält durch SNOMED International urheberrechtlich geschützte Information. Jede Verwendung von SNOMED CT in Österreich erfordert eine aufrechte Affiliate Lizenz oder eine Sublizenz. Die entsprechende Lizenz ist kostenlos, vorausgesetzt die Verwendung findet nur in Österreich statt und erfüllt die Bedingungen des Affiliate License Agreements. Affiliate Lizenzen können über das Member Licensing and Distribution Service (MLDS) direkt beim jeweiligen NRC beantragt werden.https://wiki.hl7.at/index.php?title=SCT:SNOMED_CT"

* http://snomed.info/sct#449868002 "Smokes tobacco daily"
* http://snomed.info/sct#449868002 ^designation.use = http://snomed.info/sct#405672008 "Direct questioning"
* http://snomed.info/sct#449868002 ^designation.value = "Ich rauche täglich"
* http://snomed.info/sct#428041000124106 "Occasional tobacco smoker"
* http://snomed.info/sct#428041000124106 ^designation.use = http://snomed.info/sct#405672008 "Direct questioning"
* http://snomed.info/sct#428041000124106 ^designation.value = "Ich rauche gelegentlich, aber nicht täglich"
* http://snomed.info/sct#8517006 "Ex-smoker"
* http://snomed.info/sct#8517006 ^designation.use = http://snomed.info/sct#405672008 "Direct questioning"
* http://snomed.info/sct#8517006 ^designation.value = "Ich habe früher geraucht, rauche derzeit aber nicht"
* http://snomed.info/sct#266919005 "Never smoked tobacco"
* http://snomed.info/sct#266919005 ^designation.use = http://snomed.info/sct#405672008 "Direct questioning"
* http://snomed.info/sct#266919005 ^designation.value = "Ich habe nie geraucht"
* http://snomed.info/sct#77176002 "Smoker"
* http://snomed.info/sct#77176002 ^designation.use = http://snomed.info/sct#405672008 "Direct questioning"
* http://snomed.info/sct#77176002 ^designation.value = "Ich rauche, mein aktueller Rauchstatus ist aber unbekannt"
* http://snomed.info/sct#266927001 "Tobacco smoking consumption unknown"
* http://snomed.info/sct#266927001 ^designation.use = http://snomed.info/sct#405672008 "Direct questioning"
* http://snomed.info/sct#266927001 ^designation.value = "Unbekannt, ob ich jemals geraucht habe"

ValueSet: AtPrenudgeValueSetAthisTobaccoSmokingVS
Id: prenudge-athis-smoking-tobacco
Title: "AT PreNUDGE ATHIS Current/Past Tobacco Smoking"
Description: "ATHIS answer options for current or past use of tobacco products, excluding tobacco heaters, electronic cigarettes and similar electronic products."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-athis-smoking-tobacco"
* ^status = #active
* ^experimental = false
* $athis-smoking#status-no "Nein"
* $athis-smoking#status-occasional "Ja, gelegentlich"
* $athis-smoking#status-daily "Ja, täglich"

ValueSet: AtPrenudgeValueSetAthisYesNoVS
Id: prenudge-athis-yes-no
Title: "AT PreNUDGE ATHIS Yes No"
Description: "ATHIS yes/no answer options."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-athis-yes-no"
* ^status = #active
* ^experimental = false
* $athis-smoking#yes "Ja"
* $athis-smoking#no "Nein"

ValueSet: AtPrenudgeValueSetAthisProductUseFrequencyVS
Id: prenudge-athis-product-use-frequency
Title: "AT PreNUDGE ATHIS Product Use Frequency"
Description: "ATHIS answer options for current and past use of tobacco heaters, electronic cigarettes or similar electronic products, and nicotine pouches."
* ^url = "https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-athis-product-use-frequency"
* ^status = #active
* ^experimental = false
* $athis-smoking#use-daily "Ja, täglich"
* $athis-smoking#use-occasional "Ja, gelegentlich"
* $athis-smoking#use-former "Nein, aber früher"
* $athis-smoking#use-never "Nein, noch nie konsumiert"