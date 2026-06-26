PreNUDGE is an Austrian research project designed to strengthen citizens' personal responsibility for their health. The project aims to increase the number of **healthy life years** through the **digitalization of self-reported health data**.

The core concept is to create a **modular platform** that collects and structures health data from various sources. **Qualified health apps** serve as the interface between citizens and the platform. The project combines nudging strategies with evidence-based health promotion to subtly motivate people to live healthier lives.

PreNUDGE focuses on the **prevention of four diseases**: diabetes, colorectal cancer, depression, and COPD, targeting specific groups such as children, adolescents, and working adults. The FHIR Implementation Guide (IG) is called “PreNUDGE”, which is the agreed English spelling, while the project’s German name is “PräNUDGE.”

For more, see [Background](background.html).

### PreNUDGE FHIR® IG for Data Provider / Data from Apps

This Implementation Guide (IG) explains how application providers can use the **PreNUDGE FHIR API** to deliver **health indicators**.

We focus on narrow standardization of the following **PreNUDGE measurements**:
- Physical Activity: Daily activity as **Steps per day** (from a [**EHIS PAQ questionnaire**](Questionnaire-StepCountEhisPaqQuestionnaire.html), [**quantity questionnaire**](Questionnaire-StepCountQuantityQuestionnaire.html) and from a [**wearable device as an observation**](StructureDefinition-at-prenudge-stepcount-observation.html))
- **Alcohol consumption** as number of drinks (from a [**questionnaire**](Questionnaire-AlcoholUseQuestionnaire.html) and from an [**observation**](StructureDefinition-at-prenudge-alcoholuse-observation.html))
- **Quality of life** (from a [**questionnaire**](Questionnaire-WhoQolBrefQuestionnaire.html) with a calculated [**score as an observation**](StructureDefinition-at-prenudge-whoqol-bref-score-observation.html))
- **Smoking**: Current smoking/tobacco use status (from a [**questionnaire**](Questionnaire-SmokingStatusQuestionnaire.html) and from an [**observation IPS style**](StructureDefinition-at-prenudge-smokingstatus-observation.html))
- **Sleep** duration and quality 
  - Duration - from [**questionnaire**](Questionnaire-SleepDurationQuestionnaire.html) or as an [**observation**](StructureDefinition-at-prenudge-sleep-duration-observation.html)
  - Quality - question 16 from the [**WHOQOL-BRE questionnaire**](Questionnaire-WhoQolBrefQuestionnaire.html) or same question 16 from a  [**single quesion questionnaire**](Questionnaire-SleepQualityQuestionnaire.html) or as an [**observation**](StructureDefinition-at-prenudge-sleep-quality-observation.html)
- Sociodemographic Data: **Highest completed education** (ISCED level) (from a [**questionnaire**](Questionnaire-EducationQuestionnaire.html) and from an [**observation**](StructureDefinition-at-prenudge-education-observation.html))
- **Workability** 
  - Work-related Sense of Coherence (Work-SoC) - [**questionnaire**](Questionnaire-WorkSocQuestionnaire.html) with a calculated score as an [**observation**](StructureDefinition-at-prenudge-work-soc-score-observation.html)
  - Work Ability Index (WAI) - [**questionnaire**](Questionnaire-WorkAbilityIndexQuestionnaire.html) only
- Anthropometry: **Body Mass Index** (BMI) in kg/m² (from a [**questionnaire**](Questionnaire-BmiQuestionnaire.html) and from an [**observation**](StructureDefinition-at-prenudge-bmi-observation.html))
- Psychosocial Factors: 
  - **Self-reported emotional burden** (PHQ-2; „Whooley Questions”) (from a [**questionnaire**](Questionnaire-WhooleyQuestionnaire.html), result mapped to an [**observation**](StructureDefinition-at-prenudge-whooley-observation.html))
  - **Self-reported stress** (PSS-4 / PSS-10) - perceived stress over the past month/four weeks
    - PSS-4 (4-item) - from a [**questionnaire**](Questionnaire-Pss4Questionnaire.html) with calculated score as an [**observation**](StructureDefinition-at-prenudge-pss4-score-observation.html)
    - PSS-10 (10-item) - from a [**questionnaire**](Questionnaire-Pss10Questionnaire.html) with calculated score as an [**observation**](StructureDefinition-at-prenudge-pss10-score-observation.html)
- For Demo Purposes: **Blood glucose** in mg/dL (from a [**questionnaire**](Questionnaire-BloodGlucoseQuestionnaire.html) and from a [**device as an observation**](StructureDefinition-at-prenudge-bloodglucose-observation.html))

For viewing the full questionnaires use tools like [lhcforms](https://lhcfhirtools.nlm.nih.gov/lhcforms).

Each **questionnaire variant** maps **one-way** to its corresponding **observation variant**. The mappings can be found at [StructureMaps](artifacts.html#terminology-structure-maps) and can be executed with [MaLaC-HD](https://gitlab.com/cdehealth/malac-hd). These transformations will be performed on the server side.

Additional PreNUDGE measurements, also narrow standardized, will be specified analogously to the ones mentioned above, based on feedback from the informative ballot. The following are to be specified:
- Physical Activity: Minutes of moderate physical activity (per week), Minutes of physical activity (per week) (from a questionnaire and from a wearable device as an observation)
- Physical Activity: Number of muscle strengthening exercise sessions (per week) (from a questionnaire and from a wearable device as an observation)
- Physical Activity: Sitting hours (per day) (from a questionnaire from a wearable device as an observation)
- Nutrition: Portions of fruit and vegetables (per day) (from a questionnaire)
- Nutrition: Consumption frequency of sugary and salty foods (per week) (from a questionnaire)

The following sociodemographic data are provided as patient demographic data, preferably from ID Austria. They are not collected using PreNUDGE questionnaires and are not represented as observations.
- **Date of birth / age**: The date of birth is represented using the mandatory `Patient.birthDate` element in the AT APS Patient profile. Age is derived from `Patient.birthDate` at the relevant point in time and is not stored as a separate PreNUDGE observation. The corresponding ID Austria attribute is `birthdate` (`urn:oid:1.2.40.0.10.2.1.1.55`).
- **Gender**: Administrative gender is represented using the mandatory `Patient.gender` element in the AT APS Patient profile. The corresponding ID Austria attribute is `gender` (`urn:eidgvat:attributes.gender`).

Besides these narrow standardized measurements, **broad standardized measurements** called [**other quantities observations**](StructureDefinition-at-prenudge-observation-other-quantities.html) and [**other not quantities observations**](StructureDefinition-at-prenudge-observation-other-not-quantities.html) are also supported. Please be aware that such broad standardized measurements do not have a corresponding questionnaire.

### Observation values and missing data

PreNUDGE Observations SHOULD contain `value[x]` when a clinically or analytically meaningful value can be derived. If no such value can be derived, `value[x]` SHALL be absent and `dataAbsentReason` SHALL be provided.

This applies especially to observations derived from questionnaires. The original `QuestionnaireResponse` remains the source record for the submitted answer, including answers such as "unknown" or "not stated". The derived `Observation` represents the clinically or analytically usable result.

If neither `value[x]` nor `dataAbsentReason` is present, the Observation is incomplete and does not conform to the PreNUDGE data quality expectation.