---
# Implement Nutrition Domain — PreNUDGE FHIR R4 IG

## Context

You are working in the PreNUDGE FHIR R4 Implementation Guide repository. The toolchain is SUSHI (FSH → FHIR JSON) + HL7 FHIR IG Publisher. All FSH source is in `input/fsh/`, StructureMaps in `input/maps/`, narratives in `input/pagecontent/`.

**Before writing any file, read the full sleep domain as your canonical reference:**

```
input/fsh/at-prenudge-sleep-duration-observation.fsh
input/fsh/at-prenudge-sleep-duration-observation-examples.fsh
input/fsh/at-prenudge-sleep-duration-questionnaire.fsh
input/fsh/at-prenudge-sleep-duration-questionnaire-response-examples.fsh
input/fsh/at-prenudge-sleep-quality-observation.fsh
input/fsh/at-prenudge-sleep-quality-observation-examples.fsh
input/fsh/at-prenudge-sleep-quality-questionnaire.fsh
input/fsh/at-prenudge-sleep-quality-questionnaire-response-examples.fsh
input/maps/at-prenudge-sleep-duration-mapping.map
input/maps/at-prenudge-sleep-quality-mapping.map
```

Also read the base profiles and the alcohol value set for style:
```
input/fsh/at-prenudge-observation.fsh
input/fsh/at-prenudge-questionnaire.fsh
input/fsh/at-prenudge-questionnaire-response.fsh
input/fsh/at-prenudge-alcoholuse-valueset-frequency.fsh
```

---

## Goal

Implement the **Nutrition domain** based on two questionnaires from **ATHIS 2025** (Österreichische Gesundheitsbefragung, STATISTIK AUSTRIA). All question text must remain in **German** exactly as specified below.

---

## Domain Design

### Three Observation Profiles

| FSH Profile name | ID | Measures | Value type | Derived from |
|---|---|---|---|---|
| `AtPrenudgeObservationNutritionFruitPortions` | `at-prenudge-nutrition-fruitportions-observation` | Portions of fruit per day | integer Quantity (1–99) | DH2 |
| `AtPrenudgeObservationNutritionVegetablePortions` | `at-prenudge-nutrition-vegetableportions-observation` | Portions of vegetables/salad per day | integer Quantity (1–99) | DH4 |
| `AtPrenudgeObservationNutritionSugarSaltyFrequency` | `at-prenudge-nutrition-sugarsalty-observation` | Frequency of sugary/salty food consumption | CodeableConcept | DH6 |

All three extend `AtPrenudgeObservation` (abstract). All require `identifier`, `effectiveDateTime`, `issued`, `method`.

### Two Questionnaires

| Instance name | File | Covers |
|---|---|---|
| `NutritionFruitVegetableQuestionnaire` | `at-prenudge-nutrition-fruitvegetable-questionnaire.fsh` | DH1, DH2, DH3, DH4 |
| `NutritionSugarSaltyQuestionnaire` | `at-prenudge-nutrition-sugarsalty-questionnaire.fsh` | DH6 |

### Three StructureMaps

| Map name | Source questionnaire | Target observation |
|---|---|---|
| `NutritionFruitPortionsQuestionnaireResponseToObservation` | `NutritionFruitVegetableQuestionnaire` | `AtPrenudgeObservationNutritionFruitPortions` |
| `NutritionVegetablePortionsQuestionnaireResponseToObservation` | `NutritionFruitVegetableQuestionnaire` | `AtPrenudgeObservationNutritionVegetablePortions` |
| `NutritionSugarSaltyFrequencyQuestionnaireResponseToObservation` | `NutritionSugarSaltyQuestionnaire` | `AtPrenudgeObservationNutritionSugarSaltyFrequency` |

---

## Files to Create

**`input/fsh/`:**
1. `at-prenudge-nutrition-valueset-consumption-frequency.fsh`
2. `at-prenudge-nutrition-valueset-sugarsalty-frequency.fsh`
3. `at-prenudge-nutrition-fruitportions-observation.fsh`
4. `at-prenudge-nutrition-fruitportions-observation-examples.fsh`
5. `at-prenudge-nutrition-vegetableportions-observation.fsh`
6. `at-prenudge-nutrition-vegetableportions-observation-examples.fsh`
7. `at-prenudge-nutrition-sugarsalty-observation.fsh`
8. `at-prenudge-nutrition-sugarsalty-observation-examples.fsh`
9. `at-prenudge-nutrition-fruitvegetable-questionnaire.fsh`
10. `at-prenudge-nutrition-fruitvegetable-questionnaire-response-examples.fsh`
11. `at-prenudge-nutrition-sugarsalty-questionnaire.fsh`
12. `at-prenudge-nutrition-sugarsalty-questionnaire-response-examples.fsh`

**`input/maps/`:**
14. `at-prenudge-nutrition-fruitportions-mapping.map`
15. `at-prenudge-nutrition-vegetableportions-mapping.map`
16. `at-prenudge-nutrition-sugarsalty-mapping.map`

---

## Step 1 — Terminology

> **Note:** No custom CodeSystem is needed. Reuse the existing `at-prenudge-athis-codesystem.fsh` (URL: `https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers`). The relevant codes are in **Gruppe 8 — Ernährungshäufigkeit** (`#diet-*`) and the universal unknown answer `#meta-unknown`.

| ATHIS value | `athis-answers` code | German display |
|---|---|---|
| [1] | `#diet-daily-or-more` | Täglich oder mehrmals täglich |
| [2] | `#diet-4-6-per-week` | 4 bis 6 Mal pro Woche |
| [3] | `#diet-1-3-per-week` | 1 bis 3 Mal pro Woche |
| [4] | `#diet-less-than-once-per-week` | Weniger als einmal pro Woche |
| [5] | `#diet-never` | Nie |
| [-1] | `#meta-unknown` | Weiß nicht |

### ValueSet: `AtPrenudgeValueSetNutritionConsumptionFrequency` (for DH1 and DH3)

```
Id:          prenudge-nutrition-consumption-frequency-vs
URL:         https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-nutrition-consumption-frequency-vs
Title:       "AT PreNUDGE Nutrition Consumption Frequency"
```

Explicitly includes `#diet-daily-or-more`, `#diet-4-6-per-week`, `#diet-1-3-per-week`, `#diet-less-than-once-per-week`, `#diet-never`, and `#meta-unknown` from `athis-answers`.

### ValueSet: `AtPrenudgeValueSetNutritionSugarSaltyFrequency` (for DH6 — no "Weiß nicht")

```
Id:          prenudge-nutrition-sugarsalty-frequency-vs
URL:         https://fhir.hl7.at/prenudge/appdata/r4/ValueSet/prenudge-nutrition-sugarsalty-frequency-vs
Title:       "AT PreNUDGE Nutrition Sugar Salty Consumption Frequency"
```

Explicitly includes only `#diet-daily-or-more`, `#diet-4-6-per-week`, `#diet-1-3-per-week`, `#diet-less-than-once-per-week`, `#diet-never` from `athis-answers` (DH6 has no "Weiß nicht" option).

---

## Step 2 — Questionnaire 1: Fruit and Vegetable Portions (DH1–DH4)

File: `at-prenudge-nutrition-fruitvegetable-questionnaire.fsh`

```
Instance:    NutritionFruitVegetableQuestionnaire
InstanceOf:  AtPrenudgeQuestionnaire
Usage:       #definition
url:         https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/NutritionFruitVegetableQuestionnaire
name:        "NutritionFruitVegetableQuestionnaire"
title:       "Portionen Obst und Gemüse pro Tag"
status:      #active
experimental: false
subjectType: #Patient
description: "Questionnaire based on ATHIS 2025 questions DH1–DH4 to self-report daily fruit and vegetable portions. DH2 is only enabled for daily fruit eaters (DH1 = diet-daily-or-more); DH4 only for daily vegetable eaters (DH3 = diet-daily-or-more)."
```

Define an `Alias` at the top of the file:
```fsh
Alias: $athis = https://fhir.hl7.at/prenudge/appdata/r4/CodeSystem/athis-answers
```

### Item DH1 — Obst-Häufigkeit (top-level, required, type `#choice`)

```
linkId:         "DH1"
type:           #choice
required:       true
repeats:        false
answerValueSet: Canonical(AtPrenudgeValueSetNutritionConsumptionFrequency)
text: "Zunächst geht es um Obst, das können frische oder gefrorene, getrocknete oder pürierte Früchte sein. Nicht gemeint sind Obstsäfte.\n\nDH1 - Wie oft essen Sie Obst?"
```

Sub-item:
```
linkId: "DH1-comment"
type:   #string
text:   "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
```

### Item DH2 — Obst-Portionen pro Tag (top-level, conditional, type `#integer`)

```
linkId:    "DH2"
type:      #integer
required:  true
repeats:   false
text: "DH2: Wie viele Portionen Obst essen Sie pro Tag? Eine Portion entspricht einer Handvoll Obst.\n\nEine Handvoll Obst kann sein:\n- 1 Apfel, 1 Banane, 1 Pfirsich, 2 Zwetschken, 2 Mandarinen, 2 Kiwis, 3 Marillen, 7 Erdbeeren, eine halbe Grapefruit\n- drei große Löffel ungezuckerter Obstsalat\n- bei halben Portionen aufrunden."
```

Enable only when DH1 = `#diet-daily-or-more`:
```fsh
* item[=].enableWhen[+]
  * question = "DH1"
  * operator = #=
  * answerCoding = $athis#diet-daily-or-more
```

Apply min/max value extensions (same pattern as `SleepDurationQuestionnaire`):
- `http://hl7.org/fhir/StructureDefinition/minValue` → `valueInteger = 1`
- `http://hl7.org/fhir/StructureDefinition/maxValue` → `valueInteger = 99`

Sub-item:
```
linkId: "DH2-comment"
type:   #string
text:   "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
```

### Item DH3 — Gemüse-Häufigkeit (top-level, required, type `#choice`)

```
linkId:         "DH3"
type:           #choice
required:       true
repeats:        false
answerValueSet: Canonical(AtPrenudgeValueSetNutritionConsumptionFrequency)
text: "Und nun zum Gemüse, das kann frisch oder gefroren, roh oder gekocht sein. Kartoffeln, Gemüsesäfte oder Gemüsesuppen zählen nicht dazu.\n\nDH3: Wie oft essen Sie Gemüse oder Salat?"
```

Sub-item:
```
linkId: "DH3-comment"
type:   #string
text:   "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
```

### Item DH4 — Gemüse/Salat-Portionen pro Tag (top-level, conditional, type `#integer`)

```
linkId:   "DH4"
type:     #integer
required: true
repeats:  false
text: "DH4: Wie viele Portionen Gemüse oder Salat essen Sie pro Tag? Eine Portion entspricht einer Handvoll Gemüse oder Salat.\n\nEine Handvoll Gemüse oder Salat kann sein:\n- 2 Brokkoli-Stämme, 8 Karfiol-Rosen, 4 gehäufte Suppenlöffel Kraut oder Spinat\n- 3 gehäufte Suppenlöffel gedünstetes Gemüse\n- ein mittlerer Paradeiser, ein 5 cm großes Stück Gurke\n- bei halben Portionen aufrunden."
```

Enable only when DH3 = `#diet-daily-or-more`:
```fsh
* item[=].enableWhen[+]
  * question = "DH3"
  * operator = #=
  * answerCoding = $athis#diet-daily-or-more
```

Apply min/max value extensions: `valueInteger = 1` / `valueInteger = 99`.

Sub-item:
```
linkId: "DH4-comment"
type:   #string
text:   "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
```

---

## Step 3 — Questionnaire 2: Sugary and Salty Foods (DH6)

File: `at-prenudge-nutrition-sugarsalty-questionnaire.fsh`

```
Instance:    NutritionSugarSaltyQuestionnaire
InstanceOf:  AtPrenudgeQuestionnaire
Usage:       #definition
url:         https://fhir.hl7.at/prenudge/appdata/r4/Questionnaire/NutritionSugarSaltyQuestionnaire
name:        "NutritionSugarSaltyQuestionnaire"
title:       "Konsumhäufigkeit fett-, zucker- und salzreicher Lebensmittel"
status:      #active
experimental: false
subjectType: #Patient
description: "Questionnaire based on ATHIS 2025 question DH6 to self-report weekly consumption frequency of sugary, fatty, and salty foods and energy-dense drinks."
```

### Item DH6 (top-level, required, type `#choice`)

```
linkId:         "DH6"
type:           #choice
required:       true
repeats:        false
answerValueSet: Canonical(AtPrenudgeValueSetNutritionSugarSaltyFrequency)
text: "DH6: Wie oft konsumieren Sie fett-, zucker- und salzreiche Lebensmittel, wie Süßigkeiten, Mehlspeisen, Knabbereien und trinken Sie energiereiche Getränke wie Limonaden?\n\nDazu zählen: zuckerhaltige Erfrischungsgetränke (\"Softdrinks\") wie Cola, Fanta, Sprite, Eistee, Energy-Drinks; zuckerhaltige Limonaden; zuckerhaltige Sirup-Getränke.\n\nNicht dazu zählen: Erfrischungsgetränke mit ausschließlich künstlichen Süßstoffen; Diät-, Light- und Zero-Getränke; gezuckerter Tee oder Kaffee."
```

Sub-item:
```
linkId: "DH6-comment"
type:   #string
text:   "Haben Sie zu Ihrer Antwort noch einen Kommentar oder etwas hinzuzufügen?"
```

---

## Step 4 — Observation Profiles

### Fruit Portions Observation

File: `at-prenudge-nutrition-fruitportions-observation.fsh`

```
Profile:     AtPrenudgeObservationNutritionFruitPortions
Parent:      AtPrenudgeObservation
Id:          at-prenudge-nutrition-fruitportions-observation
Title:       "AT PreNUDGE Observation Nutrition Fruit Portions"
Description: "Records self-reported daily portions of fruit from the ATHIS 2025 DH2 question. Derived from NutritionFruitVegetableQuestionnaire. Only applicable for respondents who eat fruit daily (DH1 = diet-daily-or-more)."
```

- Look up the correct LOINC code for "fruit servings per day" at https://loinc.org (search "fruit servings per day" or "fruit intake"). A known candidate is **LOINC 89765-5** ("Servings of fruit per day [PhenX]") — verify before using.
- `value[x] 1..1`, `value[x] only Quantity`
- `valueQuantity.unit = "{Portionen}"`, `valueQuantity.system = "http://unitsofmeasure.org"`, `valueQuantity.code = #{Portionen}`
- Add an invariant: value must be ≥ 1 and ≤ 99
- `derivedFrom 0..* MS`, `derivedFrom only Reference(QuestionnaireResponse)`

### Vegetable Portions Observation

File: `at-prenudge-nutrition-vegetableportions-observation.fsh`

Same structure as fruit. LOINC candidate: **LOINC 89764-8** ("Servings of vegetables per day [PhenX]") — verify before using. Description: "Records self-reported daily portions of vegetables or salad from the ATHIS 2025 DH4 question."

### Sugary/Salty Frequency Observation

File: `at-prenudge-nutrition-sugarsalty-observation.fsh`

- Look up an appropriate LOINC code for consumption frequency of sugary/fatty/salty foods at https://loinc.org (search "sugary food frequency" or "snack consumption frequency"). If no suitable LOINC code exists, use SNOMED CT **364395008** ("Pattern of food and drink intake (observable entity)") — verify, document the choice in the profile Description.
- `value[x] 1..1`, `value[x] only CodeableConcept`
- Bind `valueCodeableConcept` to `AtPrenudgeValueSetNutritionSugarSaltyFrequency` (required binding)
- `derivedFrom 0..* MS`, `derivedFrom only Reference(QuestionnaireResponse)`

---

## Step 5 — StructureMaps

Pattern: follow `at-prenudge-sleep-duration-mapping.map` exactly. Each map must:
- Set the canonical URL, name, title, status in `///` doc comments
- Import `http://hl7.org/fhir/StructureMap/*` and `QuestionnaireResponseToObservationBase`
- Call `SetObservationBase(src, tgt)` in the main group
- Set `meta.profile` to the target profile canonical
- Set `tgt.code` to the chosen LOINC/SNOMED code

### `at-prenudge-nutrition-fruitportions-mapping.map`

Map name: `NutritionFruitPortionsQuestionnaireResponseToObservation`

The map reads `DH2.answer.valueInteger` and maps it to `tgt.value` as a Quantity with unit `{Portionen}`, system `http://unitsofmeasure.org`. DH1 is not mapped — it is only a qualifying question.

### `at-prenudge-nutrition-vegetableportions-mapping.map`

Map name: `NutritionVegetablePortionsQuestionnaireResponseToObservation`

Same pattern. Reads `DH4.answer.valueInteger`. DH3 is not mapped.

### `at-prenudge-nutrition-sugarsalty-mapping.map`

Map name: `NutritionSugarSaltyFrequencyQuestionnaireResponseToObservation`

Reads `DH6.answer.valueCoding` and maps it to `tgt.value` as a CodeableConcept.

---

## Step 6 — Examples

### QuestionnaireResponse Examples — Fruit & Vegetable

File: `at-prenudge-nutrition-fruitvegetable-questionnaire-response-examples.fsh`

Create two `AtPrenudgeQuestionnaireResponse` instances:

**Example 1 — Daily eater (both DH2 and DH4 answered):**
- `identifier.value = "qr-nut-fv-2026-06-01-001"`
- DH1 answer: `$athis#diet-daily-or-more` (täglich)
- DH2 answer: `valueInteger = 3`
- DH3 answer: `$athis#diet-daily-or-more` (täglich)
- DH4 answer: `valueInteger = 2`
- Include comment answers for DH1–DH4
- `authored = "2026-06-01T09:00:00Z"`

**Example 2 — Non-daily eater (DH2 and DH4 skipped):**
- `identifier.value = "qr-nut-fv-2026-06-02-001"`
- DH1 answer: `$athis#diet-4-6-per-week` (4–6 Mal)
- DH2: not present (not enabled)
- DH3 answer: `$athis#diet-1-3-per-week` (1–3 Mal)
- DH4: not present (not enabled)
- `authored = "2026-06-02T09:00:00Z"`

### QuestionnaireResponse Examples — Sugary/Salty

File: `at-prenudge-nutrition-sugarsalty-questionnaire-response-examples.fsh`

Two instances:

**Example 1 — Daily consumption:**
- `identifier.value = "qr-nut-ss-2026-06-01-001"`
- DH6 answer: `$athis#diet-daily-or-more`

**Example 2 — Less than once per week:**
- `identifier.value = "qr-nut-ss-2026-06-02-001"`
- DH6 answer: `$athis#diet-less-than-once-per-week`

### Observation Examples

For each of the three observation profiles, create at least two example instances.
- All use `method = http://snomed.info/sct#87982008 "Manual"` (all are self-reported)
- All use `subject = Reference(Patient/example)`
- All have `identifier.system = "https://www.joanneum.at"`
- Include a German `note[+].text`
- Daily-eater observation examples reference the corresponding QuestionnaireResponse via `derivedFrom`

---

## Step 7 — Update `input/pagecontent/index.md`

In the "Additional PreNUDGE measurements" bullet list, replace the two plain-text Nutrition lines:

```markdown
- Nutrition: Portions of fruit and vegetables (per day) (from a questionnaire)
- Nutrition: Consumption frequency of sugary and salty foods (per week) (from a questionnaire)
```

With active links (follow the exact pattern of existing active entries, e.g., the Sleep lines):

```markdown
- **Nutrition**: Portions of fruit and vegetables (per day)
  - From a [**questionnaire**](Questionnaire-NutritionFruitVegetableQuestionnaire.html) and as
    a [**fruit portions observation**](StructureDefinition-at-prenudge-nutrition-fruitportions-observation.html)
    and a [**vegetable portions observation**](StructureDefinition-at-prenudge-nutrition-vegetableportions-observation.html)
- **Nutrition**: Consumption frequency of sugary and salty foods (per week)
  - From a [**questionnaire**](Questionnaire-NutritionSugarSaltyQuestionnaire.html) and as an
    [**observation**](StructureDefinition-at-prenudge-nutrition-sugarsalty-observation.html)
```

---

## Conventions Checklist

- **manualSliceOrdering is `true`** — reference slices by name, never by index.
- **Every top-level questionnaire item** must have a sub-item with a `linkId` ending in `comment` and `type = #string`. This is enforced by the `AtPrenudgeQuestionnaire` invariant.
- **Do not edit** `fsh-generated/` or `output/`.
- **URL pattern:** `https://fhir.hl7.at/prenudge/appdata/r4/{ResourceType}/{name}`
- **Reuse `athis-answers`** for all frequency codes — do not create a new CodeSystem. The `diet-*` codes (Gruppe 8) and `#meta-unknown` already cover all ATHIS DH1/DH3/DH6 options. If a value set includes SNOMED CT codes, add the copyright block matching the pattern in `at-prenudge-alcoholuse-valueset-frequency.fsh`.
- **Commit message** must start with the GitHub issue number: `#XX Add nutrition domain`.

---

## Verification

After creating all files, run:

```
_genonce.bat
```

Fix all SUSHI errors before reporting the work done. SUSHI warnings about unknown LOINC codes are acceptable only if the code was explicitly verified on loinc.org and noted in the profile Description.

---
A few design decisions I made that you should be aware of before using this prompt:

DH1/DH3 frequency → no standalone observation. Those questions are qualifying context for DH2/DH4. The index.md spec says "Portions of fruit and vegetables (per day)" — so the output observations are the portion counts, not the frequency. DH1 and DH3 are only in the questionnaire, not mapped to observations.

DH2/DH4 are enableWhen = daily. Since "how many per day" only makes sense for daily eaters (matching how ATHIS administers the question), DH2 enables only when DH1=#1 and DH4 only when DH3=#1. Non-daily eaters produce no portion observation.

"Weiß nicht" mapped to `#meta-unknown`. The existing `athis-answers` CodeSystem uses `#meta-unknown` for ATHIS answer [-1] ("Weiß nicht"). DH1/DH3 include this code in their ValueSet; DH6 has no "Weiß nicht" option so its ValueSet excludes `#meta-unknown`.

Three StructureMaps, two from the same questionnaire. Maps 1 and 2 both read from NutritionFruitVegetableQuestionnaire but produce different observation types — this is the same pattern available in the existing codebase.

## Summary

Here's a summary of everything created:

Terminology (2 files):
- at-prenudge-nutrition-valueset-consumption-frequency.fsh — `athis-answers` diet-* codes + meta-unknown, for DH1/DH3
- at-prenudge-nutrition-valueset-sugarsalty-frequency.fsh — `athis-answers` diet-* codes only (no Weiß nicht), for DH6
- No custom CodeSystem: reuses existing `at-prenudge-athis-codesystem.fsh` (Gruppe 8 diet-* + meta-unknown)

Observation profiles (3 files):
- Fruit portions/day → LOINC 89765-5, integer Quantity, invariant 1–99
- Vegetable portions/day → LOINC 89764-8, integer Quantity, invariant 1–99
- Sugary/salty frequency → SNOMED 364395008, CodeableConcept (update if a better LOINC code is found)

Questionnaires (2 files):
- NutritionFruitVegetableQuestionnaire — DH1, DH2 (enableWhen DH1=#1), DH3, DH4 (enableWhen DH3=#1); each item has a -comment sub-item
- NutritionSugarSaltyQuestionnaire — DH6 with comment sub-item

StructureMaps (3 files):
- Fruit portions map reads DH2.answer.valueInteger
- Vegetable portions map reads DH4.answer.valueInteger
- Sugary/salty map reads DH6.answer.valueCoding

Examples (5 files): QR responses (daily eater + non-daily eater for fruit/veg; daily + rare for sugary/salty) and matching observation instances.

index.md updated with active links to all new questionnaires and observation profiles.