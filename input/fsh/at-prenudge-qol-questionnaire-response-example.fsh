Instance: whoqol-bref-response-example
InstanceOf: QuestionnaireResponse
Usage: #example
Title: "WHOQOL-BREF QuestionnaireResponse - Example"
Description: "Example of a completed WHOQOL-BREF QuestionnaireResponse including all 26 items and calculated scores."

* questionnaire = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/QolQuestionnaire"
* status = #completed
* authored = "2026-02-28T10:30:00Z"
* subject = Reference(Patient/example)

// ============================================================
// Allgemeine Lebensqualität und Gesundheit
// ============================================================
* item[+]
  * linkId = "general"
  * text = "Allgemeine Lebensqualität und Gesundheit"

  * item[+]
    * linkId = "Q1"
    * text = "Wie würden Sie Ihre Lebensqualität beurteilen?"
    * answer[+].valueCoding = $whoqol-scale#Q4 "Gut"

  * item[+]
    * linkId = "Q2"
    * text = "Wie zufrieden sind Sie mit Ihrer Gesundheit?"
    * answer[+].valueCoding = $whoqol-scale#S4 "Zufrieden"

  * item[+]
    * linkId = "general-raw"
    * answer[+].valueDecimal = 8

  * item[+]
    * linkId = "general-score"
    * answer[+].valueDecimal = 75.0

// ============================================================
// Domäne 1: Physische Gesundheit
// ============================================================
* item[+]
  * linkId = "domain1"
  * text = "Domäne 1: Physische Gesundheit"

  * item[+]
    * linkId = "Q3"
    * text = "Wie stark werden Sie durch Schmerzen daran gehindert, notwendige Dinge zu tun?"
    * answer[+].valueCoding = $whoqol-scale#I2 "Ein wenig"

  * item[+]
    * linkId = "Q4"
    * text = "Wie sehr sind Sie auf medizinische Behandlung angewiesen, um im Alltag funktionieren zu können?"
    * answer[+].valueCoding = $whoqol-scale#I1 "Überhaupt nicht"

  * item[+]
    * linkId = "Q10"
    * text = "Haben Sie genug Energie für das tägliche Leben?"
    * answer[+].valueCoding = $whoqol-scale#C4 "Überwiegend"

  * item[+]
    * linkId = "Q15"
    * text = "Wie gut können Sie sich fortbewegen?"
    * answer[+].valueCoding = $whoqol-scale#C5 "Völlig"

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
    * linkId = "Q3-reversed"
    * answer[+].valueInteger = 4

  * item[+]
    * linkId = "Q4-reversed"
    * answer[+].valueInteger = 5

  * item[+]
    * linkId = "domain1-raw"
    * answer[+].valueDecimal = 29

  * item[+]
    * linkId = "domain1-score"
    * answer[+].valueDecimal = 78.6

// ============================================================
// Domäne 2: Psychisches Wohlbefinden
// ============================================================
* item[+]
  * linkId = "domain2"
  * text = "Domäne 2: Psychisches Wohlbefinden"

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
    * answer[+].valueCoding = $whoqol-scale#C3 "Mittelmäßig"

  * item[+]
    * linkId = "Q11"
    * text = "Können Sie Ihr Aussehen akzeptieren?"
    * answer[+].valueCoding = $whoqol-scale#C4 "Überwiegend"

  * item[+]
    * linkId = "Q19"
    * text = "Wie zufrieden sind Sie mit sich selbst?"
    * answer[+].valueCoding = $whoqol-scale#S4 "Zufrieden"

  * item[+]
    * linkId = "Q26"
    * text = "Wie häufig haben Sie negative Gefühle wie Traurigkeit, Verzweiflung, Angst oder Depression?"
    * answer[+].valueCoding = $whoqol-scale#F2 "Selten"

  * item[+]
    * linkId = "Q26-reversed"
    * answer[+].valueInteger = 4

  * item[+]
    * linkId = "domain2-raw"
    * answer[+].valueDecimal = 23

  * item[+]
    * linkId = "domain2-score"
    * answer[+].valueDecimal = 70.8

// ============================================================
// Domäne 3: Soziale Beziehungen
// ============================================================
* item[+]
  * linkId = "domain3"
  * text = "Domäne 3: Soziale Beziehungen"

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
    * linkId = "domain3-raw"
    * answer[+].valueDecimal = 11

  * item[+]
    * linkId = "domain3-score"
    * answer[+].valueDecimal = 66.7

// ============================================================
// Domäne 4: Umwelt
// ============================================================
* item[+]
  * linkId = "domain4"
  * text = "Domäne 4: Umwelt"

  * item[+]
    * linkId = "Q8"
    * text = "Wie sicher fühlen Sie sich in Ihrem täglichen Leben?"
    * answer[+].valueCoding = $whoqol-scale#C4 "Überwiegend"

  * item[+]
    * linkId = "Q9"
    * text = "Wie gesund ist Ihre unmittelbare Umgebung?"
    * answer[+].valueCoding = $whoqol-scale#C3 "Mittelmäßig"

  * item[+]
    * linkId = "Q12"
    * text = "Haben Sie genug Geld, um Ihre Bedürfnisse erfüllen zu können?"
    * answer[+].valueCoding = $whoqol-scale#C3 "Mittelmäßig"

  * item[+]
    * linkId = "Q13"
    * text = "Wie verfügbar sind die Informationen für Sie, die Sie im Alltag brauchen?"
    * answer[+].valueCoding = $whoqol-scale#C4 "Überwiegend"

  * item[+]
    * linkId = "Q14"
    * text = "Haben Sie ausreichend Möglichkeiten zu Freizeitaktivitäten?"
    * answer[+].valueCoding = $whoqol-scale#C3 "Mittelmäßig"

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
    * answer[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"

  * item[+]
    * linkId = "domain4-raw"
    * answer[+].valueDecimal = 28

  * item[+]
    * linkId = "domain4-score"
    * answer[+].valueDecimal = 62.5
