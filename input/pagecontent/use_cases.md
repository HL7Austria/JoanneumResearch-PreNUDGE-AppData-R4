The transmission of health profile data from the qualified apps to the **PräNUDGE platform** is optional.
Health profile data will only be sent once citizens establish the connection within the app and give their **consent**.  
After successful app pairing, the mobile application communicates with the PräNUDGE platform via standard **FHIR RESTful interactions** that must comply with this **Implementation Guide (IG)**.

### Process of App Pairing initiated by the citizen from within the app

This sequence describes the process of a citizen connecting their mobile application to the **PreNUDGE platform** using **ID-Austria** for identity verification and authorization.

1. **Privacy Information**: The citizen reviews the data processing terms, transfer protocols, and the platform's privacy policy.  
2. **Initiation**: The citizen starts the "App Pairing" process within the app.  
3. **Authorization Request**: The app initiates an **OAuth2 Authorization Code Flow** by redirecting to the **PreNUDGE IAM**.  
4. **Authentication**: The citizen authenticates via **ID-Austria**.  
5. **Identity Exchange**: ID-Austria provides verified user information (e.g., `gh:bpk`, `ssn`) to the PreNUDGE IAM, which then persists the user identity.  
6. **Consent Management**: The citizen provides explicit consent for both the platform usage and the specific app pairing.  
7. **Token Issuance**: Upon successful consent, the PreNUDGE IAM issues a **token set** to the app, containing a **pairwise subject identifier**.  
8. **Profile Integration**: The app stores the token set within the local user profile. The **pairwise subject identifier** is used as the **FHIR Patient ID** to reference all subsequent clinical resources (e.g., `Observation`, `QuestionnaireResponse`, etc.).

[![Flow diagram](flow.png){: style="width: 100%"}](flow.png)

### FHIR Communication

After the app pairing is successfully completed, the mobile application can communicate with the **PreNUDGE platform** through standard **FHIR RESTful interactions**.  
Using the obtained access token, the app can perform authorized operations such as:

- **GET** requests to retrieve patient-related resources (e.g., `GET /Patient/{id}`, `GET /Observation?patient={id}`)  
- **POST** requests to submit new data like observations or questionnaire responses  
- **PUT** requests to update existing resources  

All interactions **MUST** conform to the specifications, resource profiles, and security guidelines defined in this **Implementation Guide (IG)** to ensure compliance, interoperability, and data integrity.  
These interactions follow the [HL7® FHIR R4 REST API](https://www.hl7.org/fhir/http.html) principles, ensuring full interoperability and secure data exchange between the citizen's app and the platform.