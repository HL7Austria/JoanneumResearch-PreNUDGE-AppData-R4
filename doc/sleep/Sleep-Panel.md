# Sleep Observation — Design Decisions

## Context

This document records the design decisions for modelling sleep data (from wearable devices) in the PreNUDGE FHIR IG. The decisions were made in the context of extending the IG to support **average sleep duration** and optionally **sleep phase durations** (deep, light, REM) as wearable-sourced Observations.

---

## 1. Terminology — Observation Codes

### Decision

**Primary code: LOINC `93832-4` — Sleep duration**

| Code | System | Display | Use |
|---|---|---|---|
| `93832-4` | LOINC | Sleep duration | Panel / total sleep duration |
| `93831-6` | LOINC | Deep sleep duration | Child observation |
| `93830-8` | LOINC | Light sleep duration | Child observation |
| `93829-0` | LOINC | REM sleep duration | Child observation |
| `248263006` | SNOMED CT | Duration of sleep (observable entity) | Translation on panel |

### Rationale

LOINC `93832-4` is consistent with the existing PreNUDGE coding strategy (e.g. step count uses LOINC `55423-8`) and is used in the HL7 Personal Health Record Format IG (`hl7.fhir.uv.phr`) for the same use case (patient-generated, device-sourced sleep data). The SNOMED CT code `248263006` is included as a translation on the panel observation for semantic precision.

The UCUM unit for the panel (total duration) is `h` (hours); child observations (sleep phases) use `min` (minutes) to reflect wearable data granularity.

---

## 2. Structural Modelling — Panel with `hasMember`

### Decision

Sleep phase durations (deep, light, REM) are modelled as **separate child Observations**, linked to a parent panel Observation via `hasMember`. The parent carries the total sleep duration (`93832-4`); each child carries one phase duration.

```
Observation (panel, 93832-4 Sleep duration)
  hasMember → Observation (93831-6 Deep sleep duration)
  hasMember → Observation (93830-8 Light sleep duration)
  hasMember → Observation (93829-0 REM sleep duration)
```

### Rationale

Two structural patterns were considered:

| Pattern | Description | Decision |
|---|---|---|
| **`hasMember`** (panel) | Phase durations as independent child Observations | ✅ Adopted |
| **`component`** | Phase durations as components inside a single Observation | ❌ Rejected |

`hasMember` was preferred because each sleep phase is an independently meaningful, queryable measurement. A query for `Observation?code=93829-0` (REM duration) returns a complete, self-contained resource without requiring the caller to resolve the parent. This is consistent with the FHIR pattern used for vital signs panels (e.g. blood pressure).

`component` was rejected because components are not independently queryable and are better suited for measurements that only make sense together (e.g. systolic and diastolic blood pressure as a pair).

### Profile structure

Two profiles are defined:

- **`at-prenudge-sleep-observation`** — the panel (total sleep duration, `hasMember` referencing phase observations). `hasMember` is Must Support; the referenced observations SHALL conform to `at-prenudge-sleep-phase-observation`.
- **`at-prenudge-sleep-phase-observation`** — child observation for a single sleep phase. `code` is bound to a ValueSet containing the three phase LOINC codes (`93831-6`, `93830-8`, `93829-0`).

### Effective time

`effectivePeriod` (with `start` = sleep onset, `end` = wake time) is used in preference to `effectiveDateTime`, as sleep is an interval, not a point in time.

---

## 3. Missing Data — `dataAbsentReason`

### Decision

When a wearable device does not support measurement of a particular sleep phase, the child Observation SHALL be included in `hasMember` with **no `valueQuantity`** and a `dataAbsentReason` set to an appropriate code from `http://terminology.hl7.org/CodeSystem/data-absent-reason`.

A `valueQuantity` of `0 min` is reserved exclusively for a confirmed measurement result of zero — it is **not** a substitute for absent data.

### Recommended `dataAbsentReason` codes

| Code | Display | When to use |
|---|---|---|
| `not-performed` | Not Performed | Device does not support this phase (e.g. no REM detection) |
| `not-applicable` | Not Applicable | Concept not applicable (e.g. no sleep detected at all) |
| `unknown` | Unknown | Measurement was expected but result is unavailable for unknown reason |
| `error` | Error | Device error during measurement |
| `temp-unknown` | Temporarily Unknown | Data not yet synchronised from device |

### Rationale

Including the child Observation (rather than simply omitting it from `hasMember`) preserves information about **device capability**: a receiver can distinguish between "this device cannot measure REM" (`not-performed`) and "REM was measured and was zero minutes" (`value: 0`). This is relevant in the PreNUDGE context where multiple qualified health apps with varying wearable hardware may submit data, and analytic systems need to assess data completeness per device type.

Both approaches (omitting the child vs. including it with `dataAbsentReason`) are valid FHIR. However, **including the child with `dataAbsentReason: not-performed` is the preferred pattern** when the device capability is known and relevant to downstream consumers.

---

## 4. Device Reference

### Decision

**Every Observation** — both the panel and each child — SHALL carry the same `device` reference pointing to the wearable device resource.

### Rationale

Three options were considered:

| Option | Description | Decision |
|---|---|---|
| **A** | `device` only on the panel; children rely on `partOf` | ❌ Rejected |
| **B** | `device` on every Observation (panel and children) | ✅ Adopted |
| **C** | `derivedFrom` instead of `partOf`; `device` only on panel | ❌ Rejected |

Option B was adopted because each child Observation must be independently interpretable. A direct query for REM sleep Observations (`Observation?code=93829-0&patient=X`) returns child resources without the panel context. Without a `device` reference on the child, the receiver cannot assess data provenance, device capability, or interpret a `dataAbsentReason` without an additional request to resolve the parent.

This is intentionally redundant (all children reference the same device as the parent), but the redundancy is justified by the interoperability gain. The pattern is consistent with the approach taken in the HL7 Vital Signs IG for sub-observations.

The `device` element is **Must Support** on both profiles.

---

## Summary

| Aspect | Decision |
|---|---|
| Total sleep duration code | LOINC `93832-4` + SNOMED CT `248263006` (translation) |
| Sleep phase codes | LOINC `93831-6` / `93830-8` / `93829-0` |
| Unit (total) | `h` (UCUM) |
| Unit (phases) | `min` (UCUM) |
| Structural pattern | `hasMember` panel (not `component`) |
| Effective time | `effectivePeriod` (not `effectiveDateTime`) |
| Missing phase data | Child Observation with `dataAbsentReason: not-performed` |
| Zero vs. absent | `value: 0` = confirmed zero; `dataAbsentReason` = not measured |
| Device reference | On every Observation (panel and all children) |