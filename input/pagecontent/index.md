PreNUDGE is an Austrian research project designed to strengthen citizens' personal responsibility for their health. The project aims to increase the number of **healthy life years** through the **digitalization of self-reported health data**.

The core concept is to create a **modular platform** that collects and structures health data from various sources. **Qualified health apps** serve as the interface between citizens and the platform. The project combines nudging strategies with evidence-based health promotion to subtly motivate people to live healthier lives.

PreNUDGE focuses on the **prevention of four diseases**: diabetes, colorectal cancer, depression, and COPD, targeting specific groups such as children, adolescents, and working adults. The FHIR Implementation Guide (IG) is called “PreNUDGE”, which is the agreed English spelling, while the project’s German name is “PräNUDGE.”

For more, see [Background](background.html).

### PreNUDGE FHIR® IG for Data Provider / Data from Apps

This Implementation Guide (IG) explains how application providers can use the **PreNUDGE FHIR API** to deliver **health indicators**.

We focus on narrow standardization of **four PreNUDGE measurements**:
- Physical Activity: Daily activity as **Steps per day** (from a [**questionnaire**](Questionnaire-StepCountQuestionnaire.html) and from a [**wearable device as an observation**](StructureDefinition-at-prenudge-stepcount-observation.html))
- **Alcohol consumption** as number of drinks (from a [**questionnaire**](Questionnaire-AlcoholUseQuestionnaire.html) and from an [**observation**](StructureDefinition-at-prenudge-alcoholuse-observation.html))
- **Quality of life** (from a [**questionnaire**](Questionnaire-WhoQolBrefQuestionnaire.html) with a calculated [**score as an observation**](StructureDefinition-at-prenudge-whoqol-bref-score-observation.html))
- For Demo Purposes: **Blood glucose** in mg/dL (from a [**questionnaire**](Questionnaire-BloodGlucoseQuestionnaire.html) and from a [**device as an observation**](StructureDefinition-at-prenudge-bloodglucose-observation.html))

For viewing the full questionnaires use tools like [lhcforms](https://lhcfhirtools.nlm.nih.gov/lhcforms).

Each **questionnaire variant** maps **one-way** to its corresponding **observation variant**. The mappings can be found at [StructureMaps](artifacts.html#terminology-structure-maps) and can be executed with [MaLaC-HD](https://gitlab.com/cdehealth/malac-hd). These transformations will be performed on the server side.

Additional PreNUDGE measurements, also narrow standardized, will be specified analogously to these four, based on feedback from the informative ballot. The following are to be specified:
- Physical Activity: Minutes of moderate physical activity (per week), Minutes of physical activity (per week) (from a questionnaire and from a wearable device as an observation)
- Physical Activity: Number of muscle strengthening exercise sessions (per week) (from a questionnaire and from a wearable device as an observation)
- Physical Activity: Sitting hours (per day) (from a questionnaire from a wearable device as an observation)
- Smoking: Current status (from a questionnaire and from an observation)
- Sleep: Average sleep duration (hours per night) (from a questionnaire and from a wearable device as an observation)
- Sleep: Self-assessment of sleep quality (from a questionnaire as part of the WHOQOL-BREF)
- Nutrition: Portions of fruit and vegetables (per day) (from a questionnaire)
- Nutrition: Consumption frequency of sugary and salty foods (per week) (from a questionnaire)
- Sociodemographic Data: Age (from a questionnaire)
- Sociodemographic Data: Gender (from a questionnaire)
- Sociodemographic Data: Highest completed education (ISCED level) (from a questionnaire)
- Psychosocial Factors: Self reported emotional burden (from a questionnaire)
- Psychosocial Factors: Self reported stress (from a questionnaire with a calculated score as an observation)
- Anthropometry: Body Mass Index (kg/m²) (from a questionnaire and from a wearable device as an observation)
- Workability (score per category) (from a questionnaire with a calculated score as an observation)

Besides these narrow standardized measurements, **broad standardized measurements** called [**other quantities observations**](StructureDefinition-at-prenudge-observation-other-quantities.html) and [**other not quantities observations**](StructureDefinition-at-prenudge-observation-other-not-quantities.html) are also supported. Please be aware that such broad standardized measurements do not have a corresponding questionnaire.
