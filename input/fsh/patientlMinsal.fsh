Profile: MINSALPaciente
Parent: PacienteCl
Id: MINSALPaciente
Title: "MINSAL Paciente "
Description: "Paciente definido para el Registro Maestro de Pacientes"

* extension contains PaisOrigenMPI named PaisOrigen 1..1 MS
* extension contains Religion named Religion 0..1 MS
//* extension contains SexoBiologico named SexoBiologico 1..1 MS
//* extension contains IdentidadDeGenero named identidadGenero 0..1 MS
//* extension contains http://hl7.org/fhir/StructureDefinition/patient-birthPlace named LugarDeNacimiento 1..1 MS
* extension contains PueblosOriginariosPerteneciente named PueblosOriginariosPerteneciente 1..1 MS

* extension contains PueblosAfrodescendiente named PueblosAfrodescendiente 0..1 MS

* extension contains PueblosOriginarios named PueblosOriginarios 0..1 MS
//* extension[PueblosOriginarios].valueCodeableConcept.text 0..1 MS


* extension[nacionalidad].url ^short = "Extensión de Nacionalidad para pacientes extranjeros"
* extension ^definition = "Para hacer uso de esta extensión se debe agregar el path: extension.url = \"nacionalidad\""


* identifier.type 1..1 MS
* identifier.type ^short = "Tipo de documento de Id (Extensible)"
* identifier.type ^definition = "Tipo de documento de Id (Extensible)"
* identifier.type ^comment = "Tipo de documento de Id (Extensible)"


* identifier.type from VSTipoIdentificador 


* identifier.type ^binding.description = "Identificadores definidos por DEIS"

* gender ^short = "Sexo Registral del paciente"
* gender 1..1 MS

* extension[nacionalidad] 1..1 MS

* address.extension contains http://hl7.org/fhir/StructureDefinition/geolocation named geolocalizacion 0..1
* address.use 1..1 MS
* address.line 1..1 MS
* address.line ^short = "Explicas Pasaje Lircay 24, casa 3"
* address.line ^definition = "Explicas Pasaje Lircay 24, casa 3"
* address.period 0..1 MS
* address.period ^short = "Periodo de tiempo durante el  cual es válida la dirección entregada"
* address.extension contains SituacionCalle named SituacionCalle 0..1 MS



* telecom 1..* MS
//* telecom.system 1..1 MS
//* telecom.value 1..1 MS
* telecom.rank  MS
* telecom.period MS
* telecom.period ^short = "Periodo de tiempo durante el cual es válido el contacto del paciente"
* maritalStatus from VSEstadoCivil
* maritalStatus MS

* deceased 1..1 MS
* deceased ^short = "Información si el paciente esta fallecido o su fecha de fallecimiento"
* deceased ^definition = "Información si el paciente esta fallecido o su fecha de fallecimiento"

* contact 0..* MS

