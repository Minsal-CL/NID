// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.

Profile: PacienteMinsalMPI
Parent: PacienteCl
Id: PacienteMinsalMPI
Title: "Paciente definido para el Registro Maestro de Pacientes"
Description: "Paciente definido para el Registro Maestro de Pacientes"


* extension contains SexoBiologico named SexoBiologico 1..1 MS
* extension contains IdentidadDeGenero named identidadGenero 0..1 MS
* extension contains http://hl7.org/fhir/StructureDefinition/patient-birthPlace named LugarDeNacimiento 1..1 MS
* extension contains PueblosOriginariosPerteneciente named PueblosOriginariosPerteneciente 1..1 MS

* extension contains PueblosAfrochilenoAfrodescendientePerteneciente named PueblosAfrochilenoAfrodescendientePerteneciente 0..1 MS

* extension contains PueblosOriginarios named PueblosOriginarios 0..1 MS
* extension[PueblosOriginarios].valueCodeableConcept.text 0..1 MS

* extension contains religion named religion 0..1 MS



* extension[nacionalidad].url ^short = "Extensión de Nacionalidad para pacientes extranjeros"
* extension ^definition = "Para hacer uso de esta extensión se debe agregar el path: extension.url = \"nacionalidad\""


* identifier.type 1..1 MS
* identifier.type ^short = "Tipo de documento de Id (Extensible)"
* identifier.type ^definition = "Tipo de documento de Id (Extensible)"
* identifier.type ^comment = "Tipo de documento de Id (Extensible)"
* identifier.type from VSTipoIdentificador 
* identifier.type ^binding.description = "Identificadores definidos por DEIS"

* gender ^short = "Sexo Regitral"
* gender 1..1 MS

* extension[nacionalidad] 1..1 MS

* address.extension contains http://hl7.org/fhir/StructureDefinition/geolocation named geolocalizacion 1..1
* address.use 1..1 MS
* address.line 1..1 MS
* address.period 0..1 MS
* address.extension contains SituacionCalle named SituacionCalle 0..1 MS

* telecom 1..* MS
* telecom.system 1..1 MS
* telecom.value 1..1 MS
* telecom.rank  0..1 MS
* telecom.period 0..1 MS

* maritalStatus from VSEstadoCivil

* deceasedBoolean 1..1 MS
* deceasedBoolean 1..1 MS