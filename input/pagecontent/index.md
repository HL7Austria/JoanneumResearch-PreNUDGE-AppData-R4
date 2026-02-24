PräNUDGE is an Austrian research project designed to strengthen citizens' personal responsibility for their health. The project aims to increase the number of **healthy life years** through the **digitalization of self-reported health data**.

The core concept is to create a **modular platform** that collects and structures health data from various sources. **Qualified health apps** serve as the interface between citizens and the platform. The project combines nudging strategies with evidence-based health promotion to subtly motivate people to live healthier lives.

PräNUDGE focuses on the **prevention of four diseases**: diabetes, colorectal cancer, depression, and COPD, targeting specific groups such as children, adolescents, and working adults. The FHIR Implementation Guide (IG) is called “PreNUDGE”, which is the agreed English spelling, while the project’s German name is “PräNUDGE.”

### PreNUDGE FHIR® IG for Data Provider / Data from Apps

This Implementation Guide (IG) explains how to use the **PreNUDGE FHIR API** to deliver **health indicators** as an application provider.  
It is a **work in progress** and represents a **continuous integration (CI) build**. Substantial changes may occur before the ballot starts.

We will focus on fully specifying **four PreNUDGE measurements**:
- Daily activity as **Steps per day** (from a **questionnaire**)
- Daily activity as **Steps per day** (from a **wearable device**)
- **Alcohol consumption** as number of drinks (per day/week)
- **Quality of life** (score)

Additional PreNUDGE measurements may be specified and listed here prior to the ballot.

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

### About the Project

The PreNUDGE project is an Austrian FFG funded research initiative.

In german, **PräNUDGE** stands for:

**Prä**vention und Gesundheitsförderung durch intelligente  
**Nu**tzung von  
**D**aten und Innovationen zur Stärkung der  
**Ge**sundheitskompetenz  

Translated to English, this means: 

Prevention and Health Promotion through Intelligent  
Use of  
Data and Innovations to Strengthen  
Health Literacy  

#### Why

We aim for Austria to **stay healthy longer**.

To achieve this, health indicators of the Austrian population should be **systematically collected** and **made available for evidence-based prevention**.

[![aim](PreNUDGE_Vision.png){: style="width: 100%"}](PreNUDGE_Vision.png)

#### How

We collaborate by leveraging the knowledge and vision of **14 different companies**:

- AstraZeneca – Pharmaceutical expertise and access to millions of patients for evidence-based prevention data.
- APCA – Consulting competence for health policy and implementation of national prevention strategies.
- dccx – Technological platform solutions and digital infrastructure for data collection and management.
- Duervation – Specialization in data analysis and behavioral insights for prevention programs.
- Future Health Lab – Innovation and research in future-oriented health promotion and technology.
- Kurvenkratzer – das Magazin – Media reach and storytelling for communication and awareness of health projects.
- medicus.ai – Artificial intelligence and machine learning for health profiles and risk prediction.
- TEL-BIO-MED – Biomedical and telemetric technologies for capturing health indicators.
- AIT Austrian Institute of Technology – Research competence and technological innovation in applied research.
- Joanneum Research – Extramural research and expertise in health systems and prevention research.
- Med Uni Graz – Medical expertise and clinical validation of health indicators.
- Medizinische Universität Wien – Academic excellence and clinical expertise in preventive medicine.
- Universität Wien – Research competence in data science, public health, and behavioral economics.
- Wirtschaftsuniversität Wien – Expertise in economics, incentive design, and behavioral economics for nudging strategies.

#### What

We will **focus** on:
- Investigation of motivational factors and incentivization measures (nudging) for participation and adherence to prevention programs
- Definition of a standardized set of health indicators for prevention work and analyses for 4 disease entities
- Development of a platform for creating health profiles of Austrian citizens
- Establishment of an ecosystem of app providers for collecting health indicators: interface between citizens and platform
- Making the platform accessible for primary and secondary data use
- Ensuring sustainable utilization