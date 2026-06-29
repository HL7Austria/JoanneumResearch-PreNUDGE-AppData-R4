Instance:   device-wearable-example
InstanceOf: Device
Usage:      #example
Title:      "PreNUDGE Wearable Device Example"
Description: "Example of a wearable fitness tracker referenced from the physical activity wearable observation example."

* meta.profile = "https://build.fhir.org/ig/HL7Austria/ELGA-AustrianPatientSummary-R4/StructureDefinition-at-aps-device.html"
* identifier[+]
  * system = "https://www.joanneum.at/devices"
  * value  = "dev-wearable-001"
* status         = #active
* manufacturer   = "PreNUDGE Demo Devices GmbH"
* deviceName[+]
  * name = "PreNUDGE Fitness Tracker v1"
  * type = #manufacturer-name
* modelNumber    = "PND-FT-001"
* patient        = Reference(Patient/example)