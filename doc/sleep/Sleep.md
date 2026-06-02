# Prompt

---
Claude Code Prompt: Sleep Domain Implementation

Extend the PreNUDGE FHIR R4 Implementation Guide with a Sleep domain.
This IG defines how app and wearable providers deliver health observations
to the PreNUDGE platform. The toolchain is SUSHI (FSH → FHIR JSON) +
HL7 FHIR IG Publisher.

## What to implement

Two measurement concepts:

### A) Sleep Duration (average hours per night)
Sources: wearables/smartwatches (automated) AND self-reported via questionnaire (manual).
Both produce the same Observation profile — the `method` field distinguishes them.

### B) Sleep Quality (from WHOQOL-BREF Q16) — MODULAR DESIGN

Q16 must be fillable BOTH standalone (for a sleep-quality-only submission)
AND as part of the full WHOQOL-BREF. Achieve this via SDC sub-questionnaire
composition (sdc-questionnaire-subQuestionnaire extension, already available
via the hl7.fhir.uv.sdc: 3.0.0 dependency).

#### Files to read additionally before writing:
- `input/fsh/at-prenudge-qol-questionnaire.fsh` — find the exact linkId of
  the parent group that currently contains the inline Q16 item, and locate
  the FHIRPath expression in `domain1-raw` that references Q16 (to verify
  it still works after refactoring)

#### New file: `input/fsh/at-prenudge-sleep-quality-questionnaire.fsh`
- Instance name: `SleepQualityQuestionnaire`
- Instance of: `AtPrenudgeQuestionnaire`
- Single top-level item `Q16` (type = choice), same as currently inline in
  WHOQOL-BREF:
    - text: "Wie zufrieden sind Sie mit Ihrem Schlaf?"
    - required = true
    - answerOption: S1–S5 from CodeSystem `whoqol-bref-scale` (Satisfaction scale),
      identical to the existing inline Q16 in the WHOQOL-BREF
    - Sub-item `comment` (string) — required by project invariant (every
      top-level item needs a comment sub-item)

#### New file: `input/fsh/at-prenudge-sleep-quality-questionnaire-response-examples.fsh`
2 standalone QR examples answering only Q16:
- Satisfied: Q16 = S4 "Zufrieden", comment = ""
- Dissatisfied: Q16 = S2 "Unzufrieden", comment = ""
  Each references `SleepQualityQuestionnaire` as questionnaire.

#### Modify: `input/fsh/at-prenudge-qol-questionnaire.fsh`
Replace the currently inline Q16 item block with a `display` item that
carries the `sdc-questionnaire-subQuestionnaire` extension pointing to the
canonical URL of `SleepQualityQuestionnaire`. Example pattern:

* item[+]
    * type = #display
    * linkId = "Q16-sub"
    * extension[+]
        * url = "http://hl7.org/fhir/uv/sdc/StructureDefinition/sdc-questionnaire-subQuestionnaire"
        * valueCanonical = "https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/SleepQualityQuestionnaire"

IMPORTANT: The `domain1-raw` calculation uses
`%resource.repeat(item).where(linkId='Q16')` — this traverses all items
recursively and STILL finds Q16 in the assembled questionnaire, so the
score calculation does NOT need to change. Verify this by checking the
FHIRPath expression before and after; add a comment confirming it remains
valid.

#### New file: `input/fsh/at-prenudge-sleep-quality-observation.fsh`
- Profile name: `AtPrenudgeObservationSleepQuality`
- Id: `at-prenudge-sleep-quality-observation`
- Title: "AT PreNUDGE Observation Sleep Quality (WHOQOL-BREF Q16)"
- Extends: `AtPrenudgeObservation`
- Observation code: search LOINC for "satisfaction with sleep" or
  "sleep quality self-assessment". Candidate: LOINC `93830-8`.
  Verify and document choice in a single-line FSH comment.
- value: `CodeableConcept` (1..1), bound REQUIRED to
  `AtPrenudgeCodeSystemWHOQOLBrefScale` — codes S1–S5 (Satisfaction scale)
- `derivedFrom`: Reference to either a `SleepQualityQuestionnaire` response
  OR a full `WHOQOLBrefQuestionnaire` response (both are valid sources)

#### New file: `input/fsh/at-prenudge-sleep-quality-observation-examples.fsh`
2 examples derived from the standalone `SleepQualityQuestionnaire` response
examples (not the WHOQOL-BREF response):
- Satisfied: valueCodeableConcept = S4, method = manual,
  derivedFrom → satisfied QR example
- Dissatisfied: valueCodeableConcept = S2, method = manual,
  derivedFrom → dissatisfied QR example

#### New file: `input/maps/at-prenudge-sleep-quality-mapping.map`
- URL/name: `SleepQualityQuestionnaireResponseToObservation`
- Maps the STANDALONE `SleepQualityQuestionnaire` response →
  `AtPrenudgeObservationSleepQuality` observation
- Navigate directly to the top-level item with linkId = 'Q16'
- Extract Q16's valueCoding → tgt.value as CodeableConcept
- Set effectiveDateTime from `authored` (pattern from WHOQOL-BREF map)
- Set profile and observation code
- Comment out note mapping (MaLaC-HD bug — same comment pattern as other maps)

NOTE: A separate map for WHOQOL-BREF QR → SleepQuality observation is NOT
needed in this iteration, since the standalone questionnaire covers the
primary use case. The StructureMap for the existing WHOQOL-BREF
(at-prenudge-qol-mapping-q-score-to-o-score.map) remains unchanged.
---

## Files to read BEFORE writing anything

Study these files in full to understand exact patterns to replicate:

1. `input/fsh/at-prenudge-bloodglucose-observation.fsh` — profile pattern
2. `input/fsh/at-prenudge-bloodglucose-observation-examples.fsh` — example pattern
3. `input/fsh/at-prenudge-bloodglucose-questionnaire.fsh` — questionnaire pattern
4. `input/fsh/at-prenudge-bloodglucose-questionnaire-response-examples.fsh`
5. `input/maps/at-prenudge-bloodglucose-mapping.map` — StructureMap pattern
6. `input/fsh/at-prenudge-stepcount-observation.fsh` — invariant pattern
7. `input/fsh/at-prenudge-stepcount-quantity-questionnaire.fsh` — quantity questionnaire pattern
8. `input/fsh/at-prenudge-observation.fsh` — abstract base profile
9. `input/fsh/at-prenudge-questionnaire.fsh` — abstract questionnaire base
10. `input/fsh/at-prenudge-qol-questionnaire.fsh` — WHOQOL-BREF structure (find Q16's exact
    nesting path: which group linkIds lead to Q16)
11. `input/fsh/at-prenudge-qol-observation.fsh` — WHOQOL-BREF observation profile
12. `input/fsh/at-prenudge-qol-codesystem-whoqol-bref-scale.fsh` — scale codes S1–S5
13. `input/maps/at-prenudge-qol-mapping-q-score-to-o-score.map` — WHOQOL StructureMap pattern
14. `input/maps/at-prenudge-q-to-o-base.map` — base map (understand what SetObservationBase does)
15. `sushi-config.yaml` — IG metadata, canonical base URL

---

## Files to CREATE

### A) Sleep Duration

**`input/fsh/at-prenudge-sleep-observation.fsh`**
- Profile name: `AtPrenudgeObservationSleepDuration`
- Id: `at-prenudge-sleep-observation`
- Title: "AT PreNUDGE Observation Sleep Duration"
- Extends: `AtPrenudgeObservation`
- LOINC code: `93832-4` "Sleep duration"
- valueQuantity only (1..1), unit: `h/d` (hours per day), UCUM system
- Invariant `sleep-duration-range`: value must be 0–24 (hours)
- No additional components needed

**`input/fsh/at-prenudge-sleep-observation-examples.fsh`**
3 examples:
- Normal, automated (wearable): 7.5 h/d, method = automated
  (`http://snomed.info/sct#8359006`), no derivedFrom
- Normal, manual (questionnaire-derived): 7.0 h/d, method = manual
  (`http://snomed.info/sct#87982008`), derivedFrom → the example QR below
- Short, automated: 5.5 h/d, method = automated

Each example must have: identifier (1..*), status, code, subject
(→ `at-prenudge-patient-example`), effectiveDateTime, issued, method,
valueQuantity, note.

**`input/fsh/at-prenudge-sleep-questionnaire.fsh`**
- Instance name: `SleepDurationQuestionnaire`
- Instance of: `AtPrenudgeQuestionnaire`
- Follow blood glucose questionnaire structure exactly
- One top-level item `sleep-duration` (type = quantity):
    - text (German): "Wie viele Stunden haben Sie durchschnittlich pro Nacht geschlafen?"
    - unitOption extension: `h/d` from http://unitsofmeasure.org
    - minValue extension: 0, maxValue extension: 24
    - Sub-item `date` (dateTime): initialExpression = now()
    - Sub-item `comment` (string): required by project invariant

**`input/fsh/at-prenudge-sleep-questionnaire-response-examples.fsh`**
2 examples (normal 7.5h, short 5.5h) following blood glucose QR example structure exactly.

**`input/maps/at-prenudge-sleep-mapping.map`**
- URL/name: `SleepDurationQuestionnaireResponseToObservation`
- Pattern: identical to `at-prenudge-bloodglucose-mapping.map`
- Import base map `QuestionnaireResponseToObservationBase`
- Extract quantity from `sleep-duration` item, dateTime from nested `date` item
- Set profile to `at-prenudge-sleep-observation`, code to LOINC `93832-4`
- Comment out note mapping (MaLaC-HD bug — see comment pattern in blood glucose map)

---

### B) Sleep Quality (from WHOQOL-BREF Q16)

**`input/fsh/at-prenudge-sleep-quality-observation.fsh`**
- Profile name: `AtPrenudgeObservationSleepQuality`
- Id: `at-prenudge-sleep-quality-observation`
- Title: "AT PreNUDGE Observation Sleep Quality (WHOQOL-BREF Q16)"
- Extends: `AtPrenudgeObservation`
- For the observation code: search LOINC for the best match to
  "sleep quality self-assessment" or "satisfaction with sleep" from a
  questionnaire. Candidate: LOINC `93830-8`. Verify and document your choice
  in a code comment in the FSH file (one line: which LOINC was chosen and why).
  If no precise LOINC exists, use a SNOMED CT code for sleep quality.
- value: `CodeableConcept` (1..1), bound REQUIRED to the existing
  `AtPrenudgeCodeSystemWHOQOLBrefScale` — codes S1–S5 (Satisfaction scale)
- Add a short description clarifying this records the raw Q16 answer (1-5 scale)
- `derivedFrom` references the WHOQOL-BREF QuestionnaireResponse

**`input/fsh/at-prenudge-sleep-quality-observation-examples.fsh`**
2 examples:
- Satisfied: Q16 = S4 ("Zufrieden"), derivedFrom → the existing WHOQOL-BREF
  QuestionnaireResponse example
- Dissatisfied: Q16 = S2 ("Unzufrieden")

Each must have: identifier, status, code, subject, effectiveDateTime, issued,
method (manual, since questionnaire-based), valueCodeableConcept, note.

**`input/maps/at-prenudge-sleep-quality-mapping.map`**
- URL/name: `WHOQOLBrefQuestionnaireResponseToSleepQualityObservation`
- Import base map + FHIR built-ins
- Source: WHOQOL-BREF QuestionnaireResponse
- Target: AtPrenudgeObservationSleepQuality observation
- Navigate the QR structure to find Q16 (inspect the questionnaire file to
  determine the exact linkId path through parent groups)
- Extract Q16's valueCoding → tgt.value as CodeableConcept
- Set effectiveDateTime from `authored` (same pattern as WHOQOL-BREF map)
- Set profile and observation code
- Comment out note mapping (MaLaC-HD bug)

---

## Conventions to follow strictly

- All user-facing text (question labels, answer options, notes) in Austrian German
- Commit message format: `#<issue-number> <description>` — use issue #5 as placeholder
  since this is the sleep domain branch
- File naming: `at-prenudge-sleep-*.fsh` and `at-prenudge-sleep-quality-*.fsh`
- `manualSliceOrdering: true` is set globally — reference slices by name
- Every Observation example needs: `identifier` (1..*), `effectiveDateTime`,
  `issued`, `method` (bound to `AtPrenudgeValueSetMethodManualAutomated`)
- Every questionnaire must have a top-level sub-item whose linkId ends with
  `comment` and type is `string`
- Do NOT edit `fsh-generated/` or `output/` directories
- Canonical base URL: `https://fhir.hl7.at/prenudge/appdata/r4`

---

## After writing all files

Run `_genonce.bat` to verify the build succeeds. Fix any SUSHI or IG Publisher
errors. If there are new false-positive IG Publisher warnings related to
StructureMap path validation (R4 FML limitation), add them to
`input/ignoreWarnings.txt` following the existing format with an explanation comment.

---
Der Prompt ist auf Englisch, weil Claude Code in diesem IG-Projekt auf Englisch arbeitet (CLAUDE.md ist Englisch, FSH-Code ist Englisch). Die FHIR-Inhalte (Fragestellungen etc.) sollen weiterhin auf Deutsch sein — das ist im Prompt festgehalten.

Ein paar offene Punkte, die Claude im Prompt selbst researchen soll:
- Den besten LOINC-Code für die Schlafqualitäts-Observation (Q16 Satisfaction-Skala)
- Den genauen Pfad zu Q16 in der WHOQOL-BREF QR-Hierarchie (über Gruppenstruktur)


## Sub-Thread - Schlafdauer-Codes

Erweiterung PreNUDGE FHIR-IG https://fhir.hl7.at/r4-JoanneumResearch-PreNUDGE-AppData-main um Schlaf. Welcher Code (Loinc oder Snomed-ct) soll für die Schlafdauer Observation verwendet werden? Welche werden bereits in anderen IGs verwendet (IPS)?

---

Ich habe nun alle relevanten Informationen zusammen. Hier ist eine strukturierte Analyse:

---

## Schlaf-Codes für die PreNUDGE FHIR-IG Erweiterung

### 1. Empfohlener Code: **LOINC 93832-4 „Sleep duration"**

LOINC **93832-4** hat den vollständigen Namen `Sleep duration : Time : Pt : ^Patient : Qn` (Class: H&P.HX, Type: Clinical). Die empfohlene UCUM-Einheit ist `h` (Stunden). Es handelt sich um eine reine Observation (kein Order-Code).

Dies ist der **klar empfohlene Code** für die PreNUDGE-Schlafdauer-Observation vom Wearable, da er:
- quantitativ (Qn) und patientenbezogen ist,
- die direkte Entsprechung zu den anderen PreNUDGE-Observations wie Step Count darstellt (die ebenfalls LOINC nutzen),
- breite Akzeptanz in FHIR-IGs hat (s.u.).

---

### 2. Verwendung in anderen FHIR-IGs

#### HL7 Personal Health Record (PHR) Format IG *(HL7 UV — Patient Empowerment)*

Das **HL7 Personal Health Record Format IG** (`hl7.fhir.uv.phr`) definiert ein ValueSet `pcd-sleep-observation-code`, das explizit folgende Codes enthält:

| Code | System | Display |
|---|---|---|
| **93832-4** | LOINC | Sleep duration |
| 93831-6 | LOINC | Deep sleep duration |
| 93830-8 | LOINC | Light sleep duration |
| 93829-0 | LOINC | REM sleep duration |
| **258158006** | SNOMED CT | Sleep, function (observable entity) |


Dies ist der direkteste Bezugspunkt: Ein offizieller HL7-IG mit identischem Use Case (patientenerfasste Daten / Wearables) setzt **LOINC 93832-4** als primären Code für die Schlafdauer.

#### ABDM IG (National Health Data Exchange, Indien)

Das **ABDM FHIR IG** (`ndhm.in`) der National Resource Center for EHR Standards verwendet LOINC 93832-4 ebenfalls direkt in einem Observation-Beispiel für Schlafdaten.

---

### 3. SNOMED CT — Relevante Codes

Aus der Suche ergeben sich zwei SNOMED-Konzepte:

| SNOMED Code | Display | Typ |
|---|---|---|
| **248263006** | Duration of sleep (observable entity) | Observable entity — direkt quantifizierbar |
| **258158006** | Sleep, function (observable entity) | Observable entity — allgemeiner |

**248263006** ist semantisch präziser für die Schlafdauer, wird aber in bekannten FHIR-IGs seltener als primärer `Observation.code` genutzt. **258158006** taucht im PHR-IG ValueSet auf, allerdings als generischer Fallback.

---

### 4. Empfehlung für PreNUDGE

Analog zur bestehenden Modellierung der Step-Count-Observation (`LOINC 55423-8`) empfiehlt sich folgendes Muster:

```json
"code": {
  "coding": [
    {
      "system": "http://loinc.org",
      "code": "93832-4",
      "display": "Sleep duration"
    },
    {
      "system": "http://snomed.info/sct",
      "code": "248263006",
      "display": "Duration of sleep (observable entity)"
    }
  ]
},
"valueQuantity": {
  "value": 7.5,
  "unit": "h",
  "system": "http://unitsofmeasure.org",
  "code": "h"
}
```

**Begründung:**
- **Primärcode LOINC 93832-4**: Konsistent mit dem PHR-IG und ABDM-IG, passt zur LOINC-Strategie der bestehenden PreNUDGE-Observations.
- **Sekundärcode SNOMED 248263006** als Translation: präziserer semantischer Begriff speziell für die *Dauer*.
- Das PHR-IG nutzt **258158006** als SNOMED-Fallback — für PreNUDGE wäre 248263006 (spezifischer für Dauer) vorzuziehen.
- IPS (International Patient Summary) enthält aktuell keine dezidierte Schlafdauer-Observation; Schlaf ist dort kein standardisiertes Measurement-Profil.

---

**Zusammenfassung:** LOINC **93832-4** ist die klare Wahl — standardisiert, quantitativ, in relevanten HL7-IGs (PHR-IG) für exakt diesen Use Case etabliert und direkt analog zur Step-Count-Modellierung in PreNUDGE.


---



