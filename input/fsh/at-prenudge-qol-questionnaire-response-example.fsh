Alias: $whoqol-scale = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/whoqol-bref-scale

Instance: whoqol-bref-response-example
InstanceOf: AtPrenudgeQuestionnaireResponse
Usage: #example
Title: "WHOQOL-BREF Q"
Description: "Example of a completed WHOQOL-BREF QuestionnaireResponse including all 26 items and calculated scores."

* questionnaire = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/QolQuestionnaire"
* status = #completed
* authored = "2026-02-28T10:30:00Z"
* subject = Reference(Patient/example)
* identifier.system = "https://www.joanneum.at"
* identifier.value = "qr-whoqol-2026-02-28-001"

// ============================================================
// Allgemeine Lebensqualität und Gesundheit
// ============================================================
* item[+]
  * linkId = "general"
  * item[+]
    * linkId = "Q1"
    * text = "Wie würden Sie Ihre Lebensqualität beurteilen?"
    * answer[+].valueCoding = $whoqol-scale#Q4 "Gut"
  * item[+]
    * linkId = "Q2"
    * text = "Wie zufrieden sind Sie mit Ihrer Gesundheit?"
    * answer[+].valueCoding = $whoqol-scale#S4 "Zufrieden"

// ============================================================
// Section 1: (Q3–Q9)
// ============================================================
* item[+]
  * linkId = "section-1"
  * item[+]
    * linkId = "Q3"
    * text = "Wie stark werden Sie durch Schmerzen daran gehindert, notwendige Dinge zu tun?"
    * answer[+].valueCoding = $whoqol-scale#I2 "Ein wenig"
  * item[+]
    * linkId = "Q3-reversed"
    * answer[+].valueInteger = 4
  * item[+]
    * linkId = "Q4"
    * text = "Wie sehr sind Sie auf medizinische Behandlung angewiesen, um im Alltag funktionieren zu können?"
    * answer[+].valueCoding = $whoqol-scale#I1 "Überhaupt nicht"
  * item[+]
    * linkId = "Q4-reversed"
    * answer[+].valueInteger = 5
  * item[+]
    * linkId = "Q5"
    * text = "Wie sehr genießen Sie das Leben?"
    * answer[+].valueCoding = $whoqol-scale#I4 "Ziemlich"
  * item[+]
    * linkId = "Q6"
    * text = "In welchem Ausmaß empfinden Sie Ihr Leben als sinnvoll?"
    * answer[+].valueCoding = $whoqol-scale#I4 "Ziemlich"
  * item[+]
    * linkId = "Q7"
    * text = "Wie gut können Sie sich konzentrieren?"
    * answer[+].valueCoding = $whoqol-scale#I1 "Überhaupt nicht"
  * item[+]
    * linkId = "Q8"
    * text = "Wie sicher fühlen Sie sich in Ihrem täglichen Leben?"
    * answer[+].valueCoding = $whoqol-scale#I1 "Überhaupt nicht"
  * item[+]
    * linkId = "Q9"
    * text = "Wie gesund ist Ihre unmittelbare Umgebung?"
    * answer[+].valueCoding = $whoqol-scale#I5 "Äußerst"

// ============================================================
// Section 2: (Q10–Q15)
// ============================================================
* item[+]
  * linkId = "section-2"
  * item[+]
    * linkId = "Q10"
    * text = "Haben Sie genug Energie für das tägliche Leben?"
    * answer[+].valueCoding = $whoqol-scale#C4 "Überwiegend"
  * item[+]
    * linkId = "Q11"
    * text = "Können Sie Ihr Aussehen akzeptieren?"
    * answer[+].valueCoding = $whoqol-scale#C4 "Überwiegend"
  * item[+]
    * linkId = "Q12"
    * text = "Haben Sie genug Geld, um Ihre Bedürfnisse erfüllen zu können?"
    * answer[+].valueCoding = $whoqol-scale#C3 "Halbwegs"
  * item[+]
    * linkId = "Q13"
    * text = "Wie verfügbar sind die Informationen für Sie, die Sie im Alltag brauchen?"
    * answer[+].valueCoding = $whoqol-scale#C4 "Überwiegend"
  * item[+]
    * linkId = "Q14"
    * text = "Haben Sie ausreichend Möglichkeiten zu Freizeitaktivitäten?"
    * answer[+].valueCoding = $whoqol-scale#C3 "Halbwegs"
  * item[+]
    * linkId = "Q15"
    * text = "Wie gut können Sie sich fortbewegen?"
    * answer[+].valueCoding = $whoqol-scale#Q4 "Gut"

// ============================================================
// Section 3: (Q16–Q25)
// ============================================================
* item[+]
  * linkId = "section-3"
  * item[+]
    * linkId = "Q16"
    * text = "Wie zufrieden sind Sie mit Ihrem Schlaf?"
    * answer[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
  * item[+]
    * linkId = "Q17"
    * text = "Wie zufrieden sind Sie mit Ihrer Fähigkeit, alltägliche Dinge erledigen zu können?"
    * answer[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
  * item[+]
    * linkId = "Q18"
    * text = "Wie zufrieden sind Sie mit Ihrer Arbeitsfähigkeit?"
    * answer[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
  * item[+]
    * linkId = "Q19"
    * text = "Wie zufrieden sind Sie mit sich selbst?"
    * answer[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
  * item[+]
    * linkId = "Q20"
    * text = "Wie zufrieden sind Sie mit Ihren persönlichen Beziehungen?"
    * answer[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
  * item[+]
    * linkId = "Q21"
    * text = "Wie zufrieden sind Sie mit Ihrem Sexualleben?"
    * answer[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
  * item[+]
    * linkId = "Q22"
    * text = "Wie zufrieden sind Sie mit der Unterstützung durch Ihre Freunde?"
    * answer[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
  * item[+]
    * linkId = "Q23"
    * text = "Wie zufrieden sind Sie mit Ihren Wohnbedingungen?"
    * answer[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
  * item[+]
    * linkId = "Q24"
    * text = "Wie zufrieden sind Sie mit Ihren Möglichkeiten, Gesundheitsdienste in Anspruch nehmen zu können?"
    * answer[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
  * item[+]
    * linkId = "Q25"
    * text = "Wie zufrieden sind Sie mit den Beförderungsmitteln, die Ihnen zur Verfügung stehen?"
    * answer[+].valueCoding = $whoqol-scale#S3 "Weder zufriede4n noch unzufrieden"

// ============================================================
// Section 4: (Q26)
// ============================================================
* item[+]
  * linkId = "section-4"
  * item[+]
    * linkId = "Q26"
    * text = "Wie häufig haben Sie negative Gefühle wie Traurigkeit, Verzweiflung, Angst oder Depression?"
    * answer[+].valueCoding = $whoqol-scale#F2 "Nicht oft"
  * item[+]
    * linkId = "Q26-reversed"
    * answer[+].valueInteger = 4

// ============================================================
// Section 5: Berechnete Scores
// ============================================================
* item[+]
  * linkId = "section-5"
  * item[+]
    * linkId = "general-comment"
    * answer[+].valueString = "Die Sonne scheint mir auf den Bauch"
  * item[+]
    * linkId = "general-raw"
    * answer[+].valueDecimal = 8
  * item[+]
    * linkId = "general-score"
    * answer[+].valueDecimal = 75.0
  * item[+]
    * linkId = "domain1-raw"
    * answer[+].valueDecimal = 28
  * item[+]
    * linkId = "domain1-score"
    * answer[+].valueDecimal = 75.0
  * item[+]
    * linkId = "domain2-raw"
    * answer[+].valueDecimal = 21
  * item[+]
    * linkId = "domain2-score"
    * answer[+].valueDecimal = 62.5
  * item[+]
    * linkId = "domain3-raw"
    * answer[+].valueDecimal = 11
  * item[+]
    * linkId = "domain3-score"
    * answer[+].valueDecimal = 66.7
  * item[+]
    * linkId = "domain4-raw"
    * answer[+].valueDecimal = 27
  * item[+]
    * linkId = "domain4-score"
    * answer[+].valueDecimal = 59.4
