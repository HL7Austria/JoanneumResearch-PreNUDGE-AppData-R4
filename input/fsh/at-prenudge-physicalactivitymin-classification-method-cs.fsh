CodeSystem: AtPrenudgePhysicalActivityClassificationMethodCS
Id:         at-prenudge-physical-activity-classification-method-cs
Title:      "AT PreNUDGE Physical Activity Classification Method CodeSystem"
Description: "Codes for the algorithm or technique used to classify the intensity of a physical activity measurement into moderate / vigorous categories."

* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* ^publisher = "The PreNUDGE Consortium"
* ^experimental = false

* #hrz "Heart Rate Zones"
    """Intensity derived from percentage of maximum heart rate.
    Moderate: 50–70 % HRmax; Vigorous: > 70 % HRmax.
    Applicable to Automated sources (method = SCT 8359006) only."""

* #met-lu "MET Value Look-up"
    """MET assigned from a reference table (e.g. Ainsworth Compendium of Physical Activities).
    Moderate: 3.0–5.9 MET; Vigorous: ≥ 6.0 MET.
    Applicable to Automated sources only."""

* #met-cal "MET Value Calculated"
    """MET estimated from raw sensor data (e.g. accelerometer signal, VO2 proxy algorithm).
    Moderate: 3.0–5.9 MET; Vigorous: ≥ 6.0 MET.
    Applicable to Automated sources only."""

* #self-rp "Self-Reported via Questionnaire"
    """Patient-reported activity type used as the basis for intensity classification.
    The MET look-up table is applied to the reported activity type.
    Applicable to both Automated and Manual sources.
    For Manual sources (SCT 87982008) this is the ONLY permitted code (see pa-manual-comp-01)."""