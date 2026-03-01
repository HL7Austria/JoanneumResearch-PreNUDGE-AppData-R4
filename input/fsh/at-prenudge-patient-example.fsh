Instance: AtApsPatient-example
InstanceOf: AtApsPatient
Description: "An example of a patient with a license to krill."
* id = "example"
* name
  * given[0] = "James"
  * family = "Pond"
* identifier[+]
  * system = "urn:oid:1.2.40.0.10.1.4.3.1"
  * value = "1234567890"
* identifier[+]
  * type.coding = http://terminology.hl7.org/CodeSystem/v2-0203#PI
  * system = "https://www.joanneum.at"
  * value = "123123123"
* gender = #male
* birthDate = "1990-01-01"
