Instance: device-glucometer-example
InstanceOf: Device
Usage: #example
Title: "PreNUDGE Glucometer Device Example"
Description: "Example of a glucometer that automatically transfers capillary blood glucose measurements."

* meta.profile = "https://fhir.hl7.at/elga/aps/r4/StructureDefinition/at-aps-device"
* identifier[+]
  * system = "https://www.joanneum.at/devices"
  * value = "dev-glucometer-001"
* status = #active
* manufacturer = "PreNUDGE Demo Devices GmbH"
* deviceName[+]
  * name = "PreNUDGE Glucometer v1"
  * type = #manufacturer-name
* modelNumber = "PND-BG-001"
* patient = Reference(Patient/example)
