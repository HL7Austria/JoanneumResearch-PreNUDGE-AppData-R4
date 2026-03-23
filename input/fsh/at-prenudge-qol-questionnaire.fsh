Alias: $whoqol-scale = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/whoqol-bref-scale
Alias: $calcExp = http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-calculatedExpression
Alias: $hidden = http://hl7.org/fhir/StructureDefinition/questionnaire-hidden

Instance: WhoQolBrefQuestionnaire
InstanceOf: AtPrenudgeQuestionnaire
Usage: #definition

* url = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/WhoQolBrefQuestionnaire"
* version = "1.0.0"
* name = "AtPrenudgeQoLByWhoQolBref"
* title = "WHOQOL-BREF Lebensstil Selbsteinschätzung"
* status = #active
* experimental = false
* description = "The WHOQOL-BREF is a 26-item instrument for assessing subjective quality of life in four domains: physical, psychological, social relationships, and environment. Developed by the WHO."
* purpose = "Assessment of subjective quality of life in the general population and in patients."
* copyright = "© World Health Organization. Usage with permission from WHO."
* subjectType = #Patient
* language = #de-AT
* code = http://snomed.info/sct#405152002

// ============================================================
// Einleitung
// ============================================================
* item[+]
  * linkId = "introduction-text"
  * text = "In diesem Fragebogen werden Sie danach gefragt, wie Sie Ihre Lebensqualität, Ihre Gesundheit und andere Bereiche Ihres Lebens beurteilen. Bitte beantworten Sie alle Fragen. Wenn Sie sich bei der Beantwortung einer Frage nicht sicher sind, wählen Sie bitte die Antwortkategorie, die Ihrer Meinung nach am ehesten zutrifft. Oft ist dies die Kategorie, die Ihnen als erstes in den Sinn kommt. Bitte beantworten Sie alle Fragen auf der Grundlage Ihrer eigenen Beurteilungskriterien, Hoffnungen, Vorlieben und Interessen. Bitte denken Sie bei der Beantwortung der Fragen an Ihr Leben während der vergangenen zwei Wochen."
  * type = #display

// ============================================================
// Allgemeine Lebensqualität und Gesundheit
// ============================================================
* item[+]
  * linkId = "general"
  * text = "Allgemeine Lebensqualität und Gesundheit"
  * type = #group

  * item[+]
    * linkId = "Q1"
    * text = "Wie würden Sie Ihre Lebensqualität beurteilen?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#Q1 "Sehr schlecht"
    * answerOption[+].valueCoding = $whoqol-scale#Q2 "Schlecht"
    * answerOption[+].valueCoding = $whoqol-scale#Q3 "Mittelmäßig"
    * answerOption[+].valueCoding = $whoqol-scale#Q4 "Gut"
    * answerOption[+].valueCoding = $whoqol-scale#Q5 "Sehr gut"

  * item[+]
    * linkId = "Q2"
    * text = "Wie zufrieden sind Sie mit Ihrer Gesundheit?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#S1 "Sehr unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S2 "Unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S5 "Sehr zufrieden"

// ============================================================
// Section 1
// ============================================================
* item[+]
  * linkId = "section-1"
  * text = "In den folgenden Fragen geht es darum, wie stark Sie während der vergangenen zwei Wochen bestimmte Dinge erlebt haben."
  * type = #group

  * item[+]
    * linkId = "Q3"
    * text = "Wie stark werden Sie durch Schmerzen daran gehindert, notwendige Dinge zu tun?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#I1 "Überhaupt nicht"
    * answerOption[+].valueCoding = $whoqol-scale#I2 "Ein wenig"
    * answerOption[+].valueCoding = $whoqol-scale#I3 "Mittelmäßig"
    * answerOption[+].valueCoding = $whoqol-scale#I4 "Ziemlich"
    * answerOption[+].valueCoding = $whoqol-scale#I5 "Äußerst"

  * item[+]
    * linkId = "Q3-reversed"
    * text = "Q3 umkodiert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "Reverse scoring für Q3"
        * expression = "6 - %resource.repeat(item).where(linkId='Q3').answer.valueCoding.code.substring(1).toInteger()"

  * item[+]
    * linkId = "Q4"
    * text = "Wie sehr sind Sie auf medizinische Behandlung angewiesen, um das tägliche Leben zu meistern?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#I1 "Überhaupt nicht"
    * answerOption[+].valueCoding = $whoqol-scale#I2 "Ein wenig"
    * answerOption[+].valueCoding = $whoqol-scale#I3 "Mittelmäßig"
    * answerOption[+].valueCoding = $whoqol-scale#I4 "Ziemlich"
    * answerOption[+].valueCoding = $whoqol-scale#I5 "Äußerst"

  * item[+]
    * linkId = "Q4-reversed"
    * text = "Q4 umkodiert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "Reverse scoring für Q4"
        * expression = "6 - %resource.repeat(item).where(linkId='Q4').answer.valueCoding.code.substring(1).toInteger()"

  * item[+]
    * linkId = "Q5"
    * text = "Wie sehr genießen Sie das Leben?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#I1 "Überhaupt nicht"
    * answerOption[+].valueCoding = $whoqol-scale#I2 "Ein wenig"
    * answerOption[+].valueCoding = $whoqol-scale#I3 "Mittelmäßig"
    * answerOption[+].valueCoding = $whoqol-scale#I4 "Ziemlich"
    * answerOption[+].valueCoding = $whoqol-scale#I5 "Äußerst"

  * item[+]
    * linkId = "Q6"
    * text = "In welchem Ausmaß empfinden Sie Ihr Leben als sinnvoll?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#I1 "Überhaupt nicht"
    * answerOption[+].valueCoding = $whoqol-scale#I2 "Ein wenig"
    * answerOption[+].valueCoding = $whoqol-scale#I3 "Mittelmäßig"
    * answerOption[+].valueCoding = $whoqol-scale#I4 "Ziemlich"
    * answerOption[+].valueCoding = $whoqol-scale#I5 "Äußerst"

  * item[+]
    * linkId = "Q7"
    * text = "Wie gut können Sie sich konzentrieren?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#I1 "Überhaupt nicht"
    * answerOption[+].valueCoding = $whoqol-scale#I2 "Ein wenig"
    * answerOption[+].valueCoding = $whoqol-scale#I3 "Mittelmäßig"
    * answerOption[+].valueCoding = $whoqol-scale#I4 "Ziemlich"
    * answerOption[+].valueCoding = $whoqol-scale#I5 "Äußerst"

  * item[+]
    * linkId = "Q8"
    * text = "Wie sicher fühlen Sie sich in Ihrem täglichen Leben?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#I1 "Überhaupt nicht"
    * answerOption[+].valueCoding = $whoqol-scale#I2 "Ein wenig"
    * answerOption[+].valueCoding = $whoqol-scale#I3 "Mittelmäßig"
    * answerOption[+].valueCoding = $whoqol-scale#I4 "Ziemlich"
    * answerOption[+].valueCoding = $whoqol-scale#I5 "Äußerst"

  * item[+]
    * linkId = "Q9"
    * text = "Wie gesund ist Ihre unmittelbare Umgebung?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#I1 "Überhaupt nicht"
    * answerOption[+].valueCoding = $whoqol-scale#I2 "Ein wenig"
    * answerOption[+].valueCoding = $whoqol-scale#I3 "Mittelmäßig"
    * answerOption[+].valueCoding = $whoqol-scale#I4 "Ziemlich"
    * answerOption[+].valueCoding = $whoqol-scale#I5 "Äußerst"

// ============================================================
// Section 2
// ============================================================
* item[+]
  * linkId = "section-2"
  * text = "In den folgenden Fragen geht es darum, im welchem Umfang Sie während der vergangenen zwei Wochen bestimmte Dinge erlebt haben oder in der Lage waren, bestimmte Dinge zu tun."
  * type = #group

  * item[+]
    * linkId = "Q10"
    * text = "Haben Sie genug Energie für das tägliche Leben?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#C1 "Überhaupt nicht"
    * answerOption[+].valueCoding = $whoqol-scale#C2 "Eher nicht"
    * answerOption[+].valueCoding = $whoqol-scale#C3 "Halbwegs"
    * answerOption[+].valueCoding = $whoqol-scale#C4 "Überwiegend"
    * answerOption[+].valueCoding = $whoqol-scale#C5 "Völlig"

  * item[+]
    * linkId = "Q11"
    * text = "Können Sie Ihr Aussehen akzeptieren?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#C1 "Überhaupt nicht"
    * answerOption[+].valueCoding = $whoqol-scale#C2 "Eher nicht"
    * answerOption[+].valueCoding = $whoqol-scale#C3 "Halbwegs"
    * answerOption[+].valueCoding = $whoqol-scale#C4 "Überwiegend"
    * answerOption[+].valueCoding = $whoqol-scale#C5 "Völlig"

  * item[+]
    * linkId = "Q12"
    * text = "Haben Sie genug Geld, um Ihre Bedürfnisse erfüllen zu können?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#C1 "Überhaupt nicht"
    * answerOption[+].valueCoding = $whoqol-scale#C2 "Eher nicht"
    * answerOption[+].valueCoding = $whoqol-scale#C3 "Halbwegs"
    * answerOption[+].valueCoding = $whoqol-scale#C4 "Überwiegend"
    * answerOption[+].valueCoding = $whoqol-scale#C5 "Völlig"

  * item[+]
    * linkId = "Q13"
    * text = "Wie verfügbar sind die Informationen für Sie, die Sie im Alltag brauchen?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#C1 "Überhaupt nicht"
    * answerOption[+].valueCoding = $whoqol-scale#C2 "Eher nicht"
    * answerOption[+].valueCoding = $whoqol-scale#C3 "Halbwegs"
    * answerOption[+].valueCoding = $whoqol-scale#C4 "Überwiegend"
    * answerOption[+].valueCoding = $whoqol-scale#C5 "Völlig"

  * item[+]
    * linkId = "Q14"
    * text = "Haben Sie ausreichend Möglichkeiten zu Freizeitaktivitäten?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#C1 "Überhaupt nicht"
    * answerOption[+].valueCoding = $whoqol-scale#C2 "Eher nicht"
    * answerOption[+].valueCoding = $whoqol-scale#C3 "Halbwegs"
    * answerOption[+].valueCoding = $whoqol-scale#C4 "Überwiegend"
    * answerOption[+].valueCoding = $whoqol-scale#C5 "Völlig"

  * item[+]
    * linkId = "Q15"
    * text = "Wie gut können Sie sich fortbewegen?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#Q1 "Sehr schlecht"
    * answerOption[+].valueCoding = $whoqol-scale#Q2 "Schlecht"
    * answerOption[+].valueCoding = $whoqol-scale#Q3 "Mittelmäßig"
    * answerOption[+].valueCoding = $whoqol-scale#Q4 "Gut"
    * answerOption[+].valueCoding = $whoqol-scale#Q5 "Sehr gut"

// ============================================================
// Section 3
// ============================================================
* item[+]
  * linkId = "section-3"
  * text = "In den folgenden Fragen geht es darum, wie zufrieden, glücklich oder gut Sie sich während der vergangenen zwei Wochen hinsichtlich verschiedener Aspekte Ihres Lebens gefühlt haben. "
  * type = #group

  * item[+]
    * linkId = "Q16"
    * text = "Wie zufrieden sind Sie mit Ihrem Schlaf?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#S1 "Sehr unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S2 "Unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S5 "Sehr zufrieden"

  * item[+]
    * linkId = "Q17"
    * text = "Wie zufrieden sind Sie mit Ihrer Fähigkeit, alltägliche Dinge erledigen zu können?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#S1 "Sehr unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S2 "Unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S5 "Sehr zufrieden"

  * item[+]
    * linkId = "Q18"
    * text = "Wie zufrieden sind Sie mit Ihrer Arbeitsfähigkeit?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#S1 "Sehr unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S2 "Unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S5 "Sehr zufrieden"



  * item[+]
    * linkId = "Q19"
    * text = "Wie zufrieden sind Sie mit sich selbst?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#S1 "Sehr unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S2 "Unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S5 "Sehr zufrieden"

  * item[+]
    * linkId = "Q20"
    * text = "Wie zufrieden sind Sie mit Ihren persönlichen Beziehungen?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#S1 "Sehr unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S2 "Unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S5 "Sehr zufrieden"

  * item[+]
    * linkId = "Q21"
    * text = "Wie zufrieden sind Sie mit Ihrem Sexualleben?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#S1 "Sehr unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S2 "Unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S5 "Sehr zufrieden"

  * item[+]
    * linkId = "Q22"
    * text = "Wie zufrieden sind Sie mit der Unterstützung durch Ihre Freunde?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#S1 "Sehr unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S2 "Unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S5 "Sehr zufrieden"

  * item[+]
    * linkId = "Q23"
    * text = "Wie zufrieden sind Sie mit Ihren Wohnbedingungen?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#S1 "Sehr unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S2 "Unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S5 "Sehr zufrieden"

  * item[+]
    * linkId = "Q24"
    * text = "Wie zufrieden sind Sie mit Ihren Möglichkeiten, Gesundheitsdienste in Anspruch nehmen zu können?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#S1 "Sehr unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S2 "Unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S5 "Sehr zufrieden"

  * item[+]
    * linkId = "Q25"
    * text = "Wie zufrieden sind Sie mit den Beförderungsmitteln, die Ihnen zur Verfügung stehen?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#S1 "Sehr unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S2 "Unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S3 "Weder zufrieden noch unzufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S4 "Zufrieden"
    * answerOption[+].valueCoding = $whoqol-scale#S5 "Sehr zufrieden"

// ============================================================
// Section 4
// ============================================================
* item[+]
  * linkId = "section-4"
  * text = "In der folgenden Frage geht es darum, wie oft sich während der vergangenen zwei Wochen bei Ihnen negative Gefühle eingestellt haben, wie zum Beispiel Angst oder Traurigkeit."
  * type = #group

  * item[+]
    * linkId = "Q26"
    * text = "Wie häufig haben Sie negative Gefühle wie Traurigkeit, Verzweiflung, Angst oder Depression?"
    * type = #choice
    * required = true
    * answerOption[+].valueCoding = $whoqol-scale#F1 "Niemals"
    * answerOption[+].valueCoding = $whoqol-scale#F2 "Nicht oft"
    * answerOption[+].valueCoding = $whoqol-scale#F3 "Zeitweilig"
    * answerOption[+].valueCoding = $whoqol-scale#F4 "Oftmals"
    * answerOption[+].valueCoding = $whoqol-scale#F5 "Immer"

  * item[+]
    * linkId = "Q26-reversed"
    * text = "Q26 umkodiert"
    * type = #integer
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "Reverse scoring für Q26"
        * expression = "6 - %resource.repeat(item).where(linkId='Q26').answer.valueCoding.code.substring(1).toInteger()"

// ============================================================
// Section 5
// ============================================================
* item[+]
  * linkId = "section-5"
  * text = "Haben Sie irgendwelche Anmerkungen zu diesem Fragebogen?"
  * type = #group

  * item[+]
    * linkId = "general-comment"
    * text = "Haben Sie allgemein noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

  * item[+]
    * linkId = "domain1-comment"
    * text = "Haben Sie zu ihrer physischen Gesundheit noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

  * item[+]
    * linkId = "domain2-comment"
    * text = "Haben Sie zu ihrem psychisches Wohlbefinden noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

  * item[+]
    * linkId = "domain3-comment"
    * text = "Haben Sie zu ihren sozialen Beziehungen noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

  * item[+]
    * linkId = "domain4-comment"
    * text = "Haben Sie zu ihrer Umwelt noch einen Kommentar oder etwas hinzuzufügen?"
    * type = #string

// ============================================================
// Section 6 (automatische Berechnungen)
// ============================================================
* item[+]
  * linkId = "section-6"
  * text = "automatische Berechnungen"
  * type = #group

  * item[+]
    * linkId = "general-raw"
    * text = "Allgemeiner Rohwert"
    * type = #decimal
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "Summe Q1 + Q2"
        * expression = "%resource.repeat(item).where(linkId='Q1').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q2').answer.valueCoding.code.substring(1).toInteger()"

  * item[+]
    * linkId = "general-score"
    * text = "Allgemeiner Score (0-100)"
    * type = #decimal
    * readOnly = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "Transformierter Score: ((Mittelwert - 1) * 25)"
        * expression = "((%resource.repeat(item).where(linkId='general-raw').answer.valueDecimal / 2) - 1) * 25"

  * item[+]
    * linkId = "domain1-raw"
    * text = "Domäne 1 Rohwert"
    * type = #decimal
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "Summe der 7 Items (Q3r, Q4r, Q10, Q15, Q16, Q17, Q18)"
        * expression = "%resource.repeat(item).where(linkId='Q3-reversed').answer.valueInteger + %resource.repeat(item).where(linkId='Q4-reversed').answer.valueInteger + %resource.repeat(item).where(linkId='Q10').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q15').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q16').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q17').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q18').answer.valueCoding.code.substring(1).toInteger()"

  * item[+]
    * linkId = "domain1-score"
    * text = "Domäne 1: Physische Gesundheit (0-100)"
    * type = #decimal
    * readOnly = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "Transformierter Score: ((Mittelwert - 1) * 25)"
        * expression = "((%resource.repeat(item).where(linkId='domain1-raw').answer.valueDecimal / 7) - 1) * 25"

  * item[+]
    * linkId = "domain2-raw"
    * text = "Domäne 2 Rohwert"
    * type = #decimal
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "Summe der 6 Items (Q5, Q6, Q7, Q11, Q19, Q26r)"
        * expression = "%resource.repeat(item).where(linkId='Q5').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q6').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q7').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q11').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q19').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q26-reversed').answer.valueInteger"

  * item[+]
    * linkId = "domain2-score"
    * text = "Domäne 2: Psychisches Wohlbefinden (0-100)"
    * type = #decimal
    * readOnly = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "Transformierter Score: ((Mittelwert - 1) * 25)"
        * expression = "((%resource.repeat(item).where(linkId='domain2-raw').answer.valueDecimal / 6) - 1) * 25"

  * item[+]
    * linkId = "domain3-raw"
    * text = "Domäne 3 Rohwert"
    * type = #decimal
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "Summe der 3 Items (Q20, Q21, Q22)"
        * expression = "%resource.repeat(item).where(linkId='Q20').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q21').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q22').answer.valueCoding.code.substring(1).toInteger()"

  * item[+]
    * linkId = "domain3-score"
    * text = "Domäne 3: Soziale Beziehungen (0-100)"
    * type = #decimal
    * readOnly = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "Transformierter Score: ((Mittelwert - 1) * 25)"
        * expression = "((%resource.repeat(item).where(linkId='domain3-raw').answer.valueDecimal / 3) - 1) * 25"

  * item[+]
    * linkId = "domain4-raw"
    * text = "Domäne 4 Rohwert"
    * type = #decimal
    * readOnly = true
    * extension[+]
      * url = $hidden
      * valueBoolean = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "Summe der 8 Items (Q8, Q9, Q12, Q13, Q14, Q23, Q24, Q25)"
        * expression = "%resource.repeat(item).where(linkId='Q8').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q9').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q12').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q13').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q14').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q23').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q24').answer.valueCoding.code.substring(1).toInteger() + %resource.repeat(item).where(linkId='Q25').answer.valueCoding.code.substring(1).toInteger()"

  * item[+]
    * linkId = "domain4-score"
    * text = "Domäne 4: Umwelt (0-100)"
    * type = #decimal
    * readOnly = true
    * extension[+]
      * url = $calcExp
      * valueExpression
        * language = #text/fhirpath
        * description = "Transformierter Score: ((Mittelwert - 1) * 25)"
        * expression = "((%resource.repeat(item).where(linkId='domain4-raw').answer.valueDecimal / 8) - 1) * 25"

    
// Alias: $SF36CS = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/rand-sf36-answers
//Description: "Der RAND 36-Item Health Survey (SF-36) Version 1.0 erfasst die gesundheitsbezogene Lebensqualität in 8 Subskalen: Körperliche Funktionsfähigkeit, Körperliche Rollenfunktion, Körperliche Schmerzen, Allgemeine Gesundheitswahrnehmung, Vitalität, Soziale Funktionsfähigkeit, Emotionale Rollenfunktion und Psychisches Wohlbefinden. Die RAND-Version ist Public Domain."
// * name = "QoLByRandSF36v1"
// * title = "Quality of life by RAND 36-Item Health Survey 1.0 (SF-36)"
// * status = #active
// * subjectType = #Patient
// * language = #de-AT

// // ============================================================
// // ITEM 1: Allgemeiner Gesundheitszustand
// // Subskala: General Health (GH)
// // ============================================================
// * item[0]
//   * linkId = "Q1"
//   * text = "Wie würden Sie Ihren Gesundheitszustand im Allgemeinen beschreiben?"
//   * type = #choice
//   * required = true
//   * answerOption[0].valueCoding = $SF36CS#health-excellent "Ausgezeichnet"
//   * answerOption[+].valueCoding = $SF36CS#health-very-good "Sehr gut"
//   * answerOption[+].valueCoding = $SF36CS#health-good "Gut"
//   * answerOption[+].valueCoding = $SF36CS#health-fair "Weniger gut"
//   * answerOption[+].valueCoding = $SF36CS#health-poor "Schlecht"
//   * item[+]
//     * linkId = "Q1-comment"
//     * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
//     * type = #string

// // ============================================================
// // ITEM 2: Gesundheitsveränderung
// // Subskala: Health Transition (nicht in Scoring)
// // ============================================================
// * item[+]
//   * linkId = "Q2"
//   * text = "Im Vergleich zum vergangenen Jahr, wie würden Sie Ihren derzeitigen Gesundheitszustand beschreiben?"
//   * type = #choice
//   * required = true
//   * answerOption[0].valueCoding = $SF36CS#change-much-better "Derzeit viel besser als vor einem Jahr"
//   * answerOption[+].valueCoding = $SF36CS#change-somewhat-better "Derzeit etwas besser als vor einem Jahr"
//   * answerOption[+].valueCoding = $SF36CS#change-same "Etwa so wie vor einem Jahr"
//   * answerOption[+].valueCoding = $SF36CS#change-somewhat-worse "Derzeit etwas schlechter als vor einem Jahr"
//   * answerOption[+].valueCoding = $SF36CS#change-much-worse "Derzeit viel schlechter als vor einem Jahr"
//   * item[+]
//     * linkId = "Q2-comment"
//     * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
//     * type = #string

// // ============================================================
// // ITEMS 3a-3j: Körperliche Funktionsfähigkeit (Physical Functioning - PF)
// // ============================================================
// * item[+]
//   * linkId = "Q3"
//   * text = "Im Folgenden sind einige Tätigkeiten beschrieben, die Sie vielleicht an einem normalen Tag ausüben. Sind Sie durch Ihren derzeitigen Gesundheitszustand bei diesen Tätigkeiten eingeschränkt? Wenn ja, wie stark?"
//   * type = #group

//   * item[0]
//     * linkId = "Q3a"
//     * text = "Anstrengende Tätigkeiten, z.B. schnell laufen, schwere Gegenstände heben, anstrengenden Sport treiben"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

//   * item[+]
//     * linkId = "Q3b"
//     * text = "Mittelschwere Tätigkeiten, z.B. einen Tisch verschieben, staubsaugen, kegeln, Golf spielen"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

//   * item[+]
//     * linkId = "Q3c"
//     * text = "Einkaufstaschen heben oder tragen"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

//   * item[+]
//     * linkId = "Q3d"
//     * text = "Mehrere Treppenabsätze steigen"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

//   * item[+]
//     * linkId = "Q3e"
//     * text = "Einen Treppenabsatz steigen"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

//   * item[+]
//     * linkId = "Q3f"
//     * text = "Sich beugen, knien, bücken"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

//   * item[+]
//     * linkId = "Q3g"
//     * text = "Mehr als 1 Kilometer zu Fuß gehen"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

//   * item[+]
//     * linkId = "Q3h"
//     * text = "Mehrere Straßenkreuzungen weit zu Fuß gehen"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

//   * item[+]
//     * linkId = "Q3i"
//     * text = "Eine Straßenkreuzung weit zu Fuß gehen"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

//   * item[+]
//     * linkId = "Q3j"
//     * text = "Sich baden oder anziehen"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#limited-a-lot "Ja, stark eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#limited-a-little "Ja, etwas eingeschränkt"
//     * answerOption[+].valueCoding = $SF36CS#not-limited "Nein, überhaupt nicht eingeschränkt"

//   * item[+]
//     * linkId = "Q3-comment"
//     * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
//     * type = #string

// // ============================================================
// // ITEMS 4a-4d: Körperliche Rollenfunktion (Role Physical - RP)
// // ============================================================
// * item[+]
//   * linkId = "Q4"
//   * text = "Hatten Sie in den vergangenen 4 Wochen aufgrund Ihrer körperlichen Gesundheit irgendwelche Schwierigkeiten bei der Arbeit oder anderen alltäglichen Tätigkeiten im Beruf bzw. zu Hause?"
//   * type = #group

//   * item[0]
//     * linkId = "Q4a"
//     * text = "Ich konnte nicht so lange wie üblich tätig sein"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#yes "Ja"
//     * answerOption[+].valueCoding = $SF36CS#no "Nein"

//   * item[+]
//     * linkId = "Q4b"
//     * text = "Ich habe weniger geschafft als ich wollte"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#yes "Ja"
//     * answerOption[+].valueCoding = $SF36CS#no "Nein"

//   * item[+]
//     * linkId = "Q4c"
//     * text = "Ich konnte nur bestimmte Dinge tun"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#yes "Ja"
//     * answerOption[+].valueCoding = $SF36CS#no "Nein"

//   * item[+]
//     * linkId = "Q4d"
//     * text = "Ich hatte Schwierigkeiten bei der Ausführung (z.B. ich musste mich besonders anstrengen)"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#yes "Ja"
//     * answerOption[+].valueCoding = $SF36CS#no "Nein"

//   * item[+]
//     * linkId = "Q4-comment"
//     * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
//     * type = #string

// // ============================================================
// // ITEMS 5a-5c: Emotionale Rollenfunktion (Role Emotional - RE)
// // ============================================================
// * item[+]
//   * linkId = "Q5"
//   * text = "Hatten Sie in den vergangenen 4 Wochen aufgrund seelischer Probleme irgendwelche Schwierigkeiten bei der Arbeit oder anderen alltäglichen Tätigkeiten im Beruf bzw. zu Hause (z.B. weil Sie sich niedergeschlagen oder ängstlich fühlten)?"
//   * type = #group

//   * item[0]
//     * linkId = "Q5a"
//     * text = "Ich konnte nicht so lange wie üblich tätig sein"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#yes "Ja"
//     * answerOption[+].valueCoding = $SF36CS#no "Nein"

//   * item[+]
//     * linkId = "Q5b"
//     * text = "Ich habe weniger geschafft als ich wollte"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#yes "Ja"
//     * answerOption[+].valueCoding = $SF36CS#no "Nein"

//   * item[+]
//     * linkId = "Q5c"
//     * text = "Ich konnte nicht so sorgfältig wie üblich arbeiten"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#yes "Ja"
//     * answerOption[+].valueCoding = $SF36CS#no "Nein"

//   * item[+]
//     * linkId = "Q5-comment"
//     * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
//     * type = #string

// // ============================================================
// // ITEM 6: Soziale Funktionsfähigkeit (Social Functioning - SF) Teil 1
// // ============================================================
// * item[+]
//   * linkId = "Q6"
//   * text = "Wie sehr haben Ihre körperliche Gesundheit oder seelischen Probleme in den vergangenen 4 Wochen Ihre normalen Kontakte zu Familienangehörigen, Freunden, Nachbarn oder zum Bekanntenkreis beeinträchtigt?"
//   * type = #choice
//   * required = true
//   * answerOption[0].valueCoding = $SF36CS#interfere-not-at-all "Überhaupt nicht"
//   * answerOption[+].valueCoding = $SF36CS#interfere-slightly "Etwas"
//   * answerOption[+].valueCoding = $SF36CS#interfere-moderately "Mäßig"
//   * answerOption[+].valueCoding = $SF36CS#interfere-quite-a-bit "Ziemlich"
//   * answerOption[+].valueCoding = $SF36CS#interfere-extremely "Sehr"

//   * item[+]
//     * linkId = "Q6-comment"
//     * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
//     * type = #string

// // ============================================================
// // ITEM 7: Körperliche Schmerzen (Bodily Pain - BP) Teil 1
// // ============================================================
// * item[+]
//   * linkId = "Q7"
//   * text = "Wie stark waren Ihre Schmerzen in den vergangenen 4 Wochen?"
//   * type = #choice
//   * required = true
//   * answerOption[0].valueCoding = $SF36CS#pain-none "Keine Schmerzen"
//   * answerOption[+].valueCoding = $SF36CS#pain-very-mild "Sehr leicht"
//   * answerOption[+].valueCoding = $SF36CS#pain-mild "Leicht"
//   * answerOption[+].valueCoding = $SF36CS#pain-moderate "Mäßig"
//   * answerOption[+].valueCoding = $SF36CS#pain-severe "Stark"
//   * answerOption[+].valueCoding = $SF36CS#pain-very-severe "Sehr stark"

//   * item[+]
//     * linkId = "Q7-comment"
//     * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
//     * type = #string

// // ============================================================
// // ITEM 8: Körperliche Schmerzen (Bodily Pain - BP) Teil 2
// // ============================================================
// * item[+]
//   * linkId = "Q8"
//   * text = "Inwieweit haben die Schmerzen Sie in den vergangenen 4 Wochen bei der Ausübung Ihrer Alltagstätigkeiten zu Hause und im Beruf behindert?"
//   * type = #choice
//   * required = true
//   * answerOption[0].valueCoding = $SF36CS#interfere-not-at-all "Überhaupt nicht"
//   * answerOption[+].valueCoding = $SF36CS#interfere-slightly "Etwas"
//   * answerOption[+].valueCoding = $SF36CS#interfere-moderately "Mäßig"
//   * answerOption[+].valueCoding = $SF36CS#interfere-quite-a-bit "Ziemlich"
//   * answerOption[+].valueCoding = $SF36CS#interfere-extremely "Sehr"

//   * item[+]
//     * linkId = "Q8-comment"
//     * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
//     * type = #string

// // ============================================================
// // ITEMS 9a-9i: Vitalität (VT) & Psychisches Wohlbefinden (MH)
// // 9a (VT), 9b (MH), 9c (MH), 9d (MH), 9e (VT),
// // 9f (MH), 9g (VT), 9h (MH), 9i (VT)
// // ============================================================
// * item[+]
//   * linkId = "Q9"
//   * text = "In diesen Fragen geht es darum, wie Sie sich fühlen und wie es Ihnen in den vergangenen 4 Wochen gegangen ist. Bitte kreuzen Sie in jeder Zeile die Zahl an, die Ihrem Befinden am ehesten entspricht. Wie oft waren Sie in den vergangenen 4 Wochen..."
//   * type = #group

//   * item[0]
//     * linkId = "Q9a"
//     * text = "...voller Schwung?"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
//     * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
//     * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
//     * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
//     * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
//     * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

//   * item[+]
//     * linkId = "Q9b"
//     * text = "...sehr nervös?"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
//     * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
//     * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
//     * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
//     * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
//     * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

//   * item[+]
//     * linkId = "Q9c"
//     * text = "...so niedergeschlagen, dass Sie nichts aufheitern konnte?"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
//     * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
//     * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
//     * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
//     * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
//     * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

//   * item[+]
//     * linkId = "Q9d"
//     * text = "...ruhig und gelassen?"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
//     * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
//     * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
//     * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
//     * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
//     * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

//   * item[+]
//     * linkId = "Q9e"
//     * text = "...voller Energie?"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
//     * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
//     * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
//     * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
//     * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
//     * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

//   * item[+]
//     * linkId = "Q9f"
//     * text = "...entmutigt und traurig?"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
//     * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
//     * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
//     * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
//     * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
//     * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

//   * item[+]
//     * linkId = "Q9g"
//     * text = "...erschöpft?"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
//     * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
//     * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
//     * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
//     * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
//     * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

//   * item[+]
//     * linkId = "Q9h"
//     * text = "...glücklich?"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
//     * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
//     * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
//     * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
//     * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
//     * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

//   * item[+]
//     * linkId = "Q9i"
//     * text = "...müde?"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#freq-all "Immer"
//     * answerOption[+].valueCoding = $SF36CS#freq-most "Meistens"
//     * answerOption[+].valueCoding = $SF36CS#freq-good-bit "Ziemlich oft"
//     * answerOption[+].valueCoding = $SF36CS#freq-some "Manchmal"
//     * answerOption[+].valueCoding = $SF36CS#freq-little "Selten"
//     * answerOption[+].valueCoding = $SF36CS#freq-none "Nie"

//   * item[+]
//     * linkId = "Q9-comment"
//     * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
//     * type = #string

// // ============================================================
// // ITEM 10: Soziale Funktionsfähigkeit (SF) Teil 2
// // ============================================================
// * item[+]
//   * linkId = "Q10"
//   * text = "Wie häufig haben Ihre körperliche Gesundheit oder seelischen Probleme in den vergangenen 4 Wochen Ihre Kontakte zu anderen Menschen (Besuche bei Freunden, Verwandten usw.) beeinträchtigt?"
//   * type = #choice
//   * required = true
//   * answerOption[0].valueCoding = $SF36CS#freq5-all "Immer"
//   * answerOption[+].valueCoding = $SF36CS#freq5-most "Meistens"
//   * answerOption[+].valueCoding = $SF36CS#freq5-some "Manchmal"
//   * answerOption[+].valueCoding = $SF36CS#freq5-little "Selten"
//   * answerOption[+].valueCoding = $SF36CS#freq5-none "Nie"

//   * item[+]
//     * linkId = "Q10-comment"
//     * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
//     * type = #string

// // ============================================================
// // ITEMS 11a-11d: Allgemeine Gesundheitswahrnehmung (General Health - GH)
// // ============================================================
// * item[+]
//   * linkId = "Q11"
//   * text = "Inwieweit trifft jede der folgenden Aussagen auf Sie zu?"
//   * type = #group

//   * item[0]
//     * linkId = "Q11a"
//     * text = "Ich scheine etwas leichter als andere krank zu werden"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#agree-definitely-true "Trifft ganz zu"
//     * answerOption[+].valueCoding = $SF36CS#agree-mostly-true "Trifft weitgehend zu"
//     * answerOption[+].valueCoding = $SF36CS#agree-dont-know "Weiß nicht"
//     * answerOption[+].valueCoding = $SF36CS#agree-mostly-false "Trifft weitgehend nicht zu"
//     * answerOption[+].valueCoding = $SF36CS#agree-definitely-false "Trifft überhaupt nicht zu"

//   * item[+]
//     * linkId = "Q11b"
//     * text = "Ich bin genauso gesund wie alle anderen, die ich kenne"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#agree-definitely-true "Trifft ganz zu"
//     * answerOption[+].valueCoding = $SF36CS#agree-mostly-true "Trifft weitgehend zu"
//     * answerOption[+].valueCoding = $SF36CS#agree-dont-know "Weiß nicht"
//     * answerOption[+].valueCoding = $SF36CS#agree-mostly-false "Trifft weitgehend nicht zu"
//     * answerOption[+].valueCoding = $SF36CS#agree-definitely-false "Trifft überhaupt nicht zu"

//   * item[+]
//     * linkId = "Q11c"
//     * text = "Ich erwarte, dass meine Gesundheit nachlässt"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#agree-definitely-true "Trifft ganz zu"
//     * answerOption[+].valueCoding = $SF36CS#agree-mostly-true "Trifft weitgehend zu"
//     * answerOption[+].valueCoding = $SF36CS#agree-dont-know "Weiß nicht"
//     * answerOption[+].valueCoding = $SF36CS#agree-mostly-false "Trifft weitgehend nicht zu"
//     * answerOption[+].valueCoding = $SF36CS#agree-definitely-false "Trifft überhaupt nicht zu"

//   * item[+]
//     * linkId = "Q11d"
//     * text = "Ich erfreue mich ausgezeichneter Gesundheit"
//     * type = #choice
//     * required = true
//     * answerOption[0].valueCoding = $SF36CS#agree-definitely-true "Trifft ganz zu"
//     * answerOption[+].valueCoding = $SF36CS#agree-mostly-true "Trifft weitgehend zu"
//     * answerOption[+].valueCoding = $SF36CS#agree-dont-know "Weiß nicht"
//     * answerOption[+].valueCoding = $SF36CS#agree-mostly-false "Trifft weitgehend nicht zu"
//     * answerOption[+].valueCoding = $SF36CS#agree-definitely-false "Trifft überhaupt nicht zu"

//   * item[+]
//     * linkId = "Q11-comment"
//     * text = "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
//     * type = #string


// CodeSystem: RandSF36Answers
// Id: rand-sf36-answers
// Title: "RAND SF-36 answer options in german"
// Description: "Answer options for den RAND SF-36 Health Survey, translated to german"
// * ^url = "https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/rand-sf36-answers"
// * ^status = #active
// * ^caseSensitive = true
// * ^content = #complete

// // Skala: Allgemeiner Gesundheitszustand (5-stufig)
// * #health-excellent "Ausgezeichnet"
// * #health-very-good "Sehr gut"
// * #health-good "Gut"
// * #health-fair "Weniger gut"
// * #health-poor "Schlecht"

// // Skala: Gesundheitsveränderung (5-stufig)
// * #change-much-better "Derzeit viel besser als vor einem Jahr"
// * #change-somewhat-better "Derzeit etwas besser als vor einem Jahr"
// * #change-same "Etwa so wie vor einem Jahr"
// * #change-somewhat-worse "Derzeit etwas schlechter als vor einem Jahr"
// * #change-much-worse "Derzeit viel schlechter als vor einem Jahr"

// // Skala: Einschränkung (3-stufig)
// * #limited-a-lot "Ja, stark eingeschränkt"
// * #limited-a-little "Ja, etwas eingeschränkt"
// * #not-limited "Nein, überhaupt nicht eingeschränkt"

// // Skala: Ja/Nein
// * #yes "Ja"
// * #no "Nein"

// // Skala: Häufigkeit 6-stufig
// * #freq-all "Immer"
// * #freq-most "Meistens"
// * #freq-good-bit "Ziemlich oft"
// * #freq-some "Manchmal"
// * #freq-little "Selten"
// * #freq-none "Nie"

// // Skala: Häufigkeit 5-stufig (für Frage 10)
// * #freq5-all "Immer"
// * #freq5-most "Meistens"
// * #freq5-some "Manchmal"
// * #freq5-little "Selten"
// * #freq5-none "Nie"

// // Skala: Beeinträchtigung (5-stufig)
// * #interfere-not-at-all "Überhaupt nicht"
// * #interfere-slightly "Etwas"
// * #interfere-moderately "Mäßig"
// * #interfere-quite-a-bit "Ziemlich"
// * #interfere-extremely "Sehr"

// // Skala: Schmerzstärke (6-stufig)
// * #pain-none "Keine Schmerzen"
// * #pain-very-mild "Sehr leicht"
// * #pain-mild "Leicht"
// * #pain-moderate "Mäßig"
// * #pain-severe "Stark"
// * #pain-very-severe "Sehr stark"

// // Skala: Zustimmung (5-stufig)
// * #agree-definitely-true "Trifft ganz zu"
// * #agree-mostly-true "Trifft weitgehend zu"
// * #agree-dont-know "Weiß nicht"
// * #agree-mostly-false "Trifft weitgehend nicht zu"
// * #agree-definitely-false "Trifft überhaupt nicht zu"