PräNUDGE is an Austrian research project designed to strengthen citizens' personal responsibility for their health. The project aims to increase the number of **healthy life years** through the **digitalization of self-reported health data**.

The core concept is to create a **modular platform** that collects and structures health data from various sources. **Qualified health apps** serve as the interface between citizens and the platform. The project combines nudging strategies with evidence-based health promotion to subtly motivate people to live healthier lives.

PräNUDGE focuses on the **prevention of four diseases**: diabetes, colorectal cancer, depression, and COPD, targeting specific groups such as children, adolescents, and working adults. The FHIR Implementation Guide (IG) is called “PreNUDGE”, which is the agreed English spelling, while the project’s German name is “PräNUDGE.”

For more, see [Background](background.html).

### PreNUDGE FHIR® IG for Data Provider / Data from Apps

This Implementation Guide (IG) explains how application providers can use the **PreNUDGE FHIR API** to deliver **health indicators**.

We focus on narrow standardization of **four PreNUDGE measurements**:
- Daily activity as **Steps per day** (from a [**questionnaire**](Questionnaire-StepCountQuestionnaire.html) and from a [**wearable device as an observation**](StructureDefinition-at-prenudge-stepcount-observation.html))
- **Alcohol consumption** as number of drinks (from a [**questionnaire**](Questionnaire-StepCountQuestionnaire.html) and from an [**observation**](StructureDefinition-at-prenudge-alcoholuse-observation.html))
- **Blood glucose** in mg/dL (from a [**questionnaire**](Questionnaire-BloodGlucoseQuestionnaire.html) and from a [**device as an observation**](StructureDefinition-at-prenudge-bloodglucose-observation.html))
- **Quality of life** (from a [**questionnaire**](Questionnaire-QolQuestionnaire.html) with a calculated [**score as an observation**](StructureDefinition-at-prenudge-whoqol-bref-score-observation.html))

For viewing the full questionnaires use tools like [lhcforms](https://lhcfhirtools.nlm.nih.gov/lhcforms).

Each **questionnaire variant** maps **one-way** to its corresponding **observation variant**. The mappings can be found at [StructureMaps](artifacts.html#terminology-structure-maps) and can be executed with [MaLaC-HD](https://gitlab.com/cdehealth/malac-hd) (small workaround because of [a IG Publisher compatibility issue](https://gitlab.com/cdehealth/malac-hd/-/issues/129) needed, for MaLaC-HD v1.4.1 replace all http://hl7.org/fhir/StructureDefinition/ to http://hl7.org/fhir/4.0/StructureDefinition/).

Additional PreNUDGE measurements, also narrow standardized, will be specified analogously to these four, based on feedback from this informative ballot.

Besides these narrow standardized measurements, **broad standardized measurements** called [**other observations**](StructureDefinition-at-prenudge-observation-other.html) are also supported. Please be aware that such broad standardized measurements does not have a corresponding questionnaire.

### Ballot Info

Communication regarding the **ballot** will take place exclusively through the **TC FHIR mailing list**.  
Consensus group registrations and questions should be sent to [tc-fhir@hl7.at](mailto:tc-fhir@hl7.at).

General information and deadlines according to HL7 Austria voting procedures:

- **Registration phase:** February 2, 2026 – March 3, 2026  
- **Eligibility:** Only current members of **HL7 Austria** may register  
- **Balloting phase:** Opens March 4, 2026 (ballot materials made available)  
- **Balloting closes:** March 18, 2026  
- **Resolution phase:** Minimum duration of 2 weeks  
- **Objection (appeal) phase:** 2 weeks after release of corrected materials  
- **Voting:** Only consensus group members may submit votes  

We look forward to your active participation in the balloting process, which makes a vital contribution to quality assurance and the success of Austrian e-health applications.  
Thank you very much for your commitment!