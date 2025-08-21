Profile: MINSALPaciente
Parent: PacienteCl
Id: MINSALPaciente
Title: "MINSAL Paciente"
Description: "Paciente definido para el Registro Maestro de Pacientes"

* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 1

* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #draft

* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-compliesWithProfile"
* ^extension[=].valueCanonical = Canonical(PIXmPatient)

* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-compliesWithProfile"
* ^extension[=].valueCanonical = Canonical(PDQmPatient)


* obeys mpi-pat-enlaceEstado 

* extension contains PaisOrigenMPI named PaisOrigen 0..1 MS
* extension contains Religion named Religion 0..1 MS
//* extension contains PueblosOriginariosPerteneciente named PueblosOriginariosPerteneciente 1..1 MS
* extension contains PueblosAfrodescendiente named PueblosAfrodescendiente 0..1 MS
* extension contains PueblosOriginariosMPI named PuebloOriginario 0..1 MS
* extension contains patient-motherMaidenName named MothersMaidenName 0..0 MS
* extension[nacionalidad] 0..1 MS
* extension[IdentidadDeGenero] 0..1 MS

* implicitRules 0..0
* modifierExtension 0..0

* identifier 1..* MS
* identifier ^short = "Identificador de paciente"
* identifier.type 1..1 MS
* identifier.type ^short = "Tipo de documento"
* identifier.type ^definition = "Tipo de documento"
* identifier.type ^comment = "Tipo de documento"
* identifier.type from VSTiposIdentificadorPaciente
* identifier.type ^binding.description = "Identificadores definidos por DEIS"
  * coding 1..1   
    * system 0..1
    * code 1..1
* identifier.type.extension[paisEmisionDocumento] 0..1 MS
* identifier.value 1..1 MS
* identifier.value ^short = "Valor del identificador" 

* active MS
  * ^short = "Si el registro de este paciente está en uso activo."

* name 1..* MS	
* name obeys mpi-pat-nombre
* name[NombreOficial] obeys mpi-pat-nombre
* name[NombreSocial] obeys mpi-pat-nombre

* gender ^short = "Sexo Registral del paciente"
* gender 1..1 MS

//* address.extension contains http://hl7.org/fhir/StructureDefinition/geolocation named geolocalizacion 0..1
* address only NIDAddress

* birthDate 1..1 MS

* telecom 0..* MS
* telecom.system 1..1 MS
* telecom.system ^short = "phone | email"
* telecom.system ^definition = "Sistema de contacto"
* telecom.system from VSSistemasComunicacion
* telecom.value 1..1 MS
* telecom.value ^short = "Valor de contacto"
* telecom.rank MS
* telecom.rank ^short = "Orden de uso del método de contacto, siendo 1 = prioritario"

* telecom.period MS
* telecom.period ^short = "Periodo de tiempo durante el cual es válido el contacto del paciente"

* maritalStatus MS
* maritalStatus ^short = "Estado civil del paciente"
* maritalStatus.coding ^slicing.discriminator.type = #value
* maritalStatus.coding ^slicing.discriminator.path = "system"
* maritalStatus.coding ^slicing.rules = #open
* maritalStatus.coding ^slicing.description = "extension del VS MaritalStatus e incluye un codificador adicional para el estado civil del paciente de chile"
* maritalStatus.coding ^slicing.ordered = false

* maritalStatus.coding contains MaritalStatusChile 0..1 MS and MaritalStatusFHIR 0..1 MS

* maritalStatus.coding[MaritalStatusChile] from VSEstadoCivil
* maritalStatus.coding[MaritalStatusChile]
  * system = Canonical(CSEstadoCivil)
  * code 1..1 MS
    * ^short = "Estado civil del paciente"
    * ^definition = "Estado civil del paciente"
  * display 0..1 MS
    * ^short = "Texto descriptivo del estado civil"

* maritalStatus.coding[MaritalStatusFHIR] from VSMaritalStatus
* maritalStatus.coding[MaritalStatusFHIR]
  * system = "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus"
  * code 1..1 MS
    * ^short = "Estado civil del paciente"
    * ^definition = "Estado civil del paciente"
  * display 0..1 MS
    * ^short = "Texto descriptivo del estado civil"


* deceased[x] 1..1 MS
* deceased[x] ^short = "Puede indicar si el paciente esta fallecido o no o en su defecto, agregar la fecha de fallecimiento."
* deceased[x] ^definition = "Puede indicar si el paciente esta fallecido o no o en su defecto, agregar la fecha de fallecimiento."

* contact 0..* MS

* link 0..* MS
  * ^short = "Enlace que tiene el recurso Minsal Paciente con otro que sea la misma persona"
  * other 1..1 MS
    * ^short = "Relación mediante identifier o referencia al recurso"
  * other only Reference(PacienteCl or MINSALPaciente or MINSALAcompanante)
  * type 1..1 MS
    * ^short = "replaced-by | replaces | refer | seealso"
    * ^definition = "Tipo de enlace"

Invariant:   mpi-pat-nombre
Description: "En caso de utilizar el dato nombre el Patient.name.given o Patient.name.family o el Patient.name.text debe existir, caso contrario **DEBE** utilizar la extensión data-absent-reason"
Expression:  "(family.exists() or given.exists() or text.exists()) xor extension.where(url='http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
Severity:    #error

Invariant:   mpi-pat-enlaceEstado
Description: "Si el elemento Patient.link está presente, entonces **DEBE** estar presente el Patient.active"
Expression:  "link.exists() implies active.exists()"
Severity:    #error

/*
Invariant:   mpi-pat-PueblosOriginarios
Description: "Si la extensión \"PueblosOriginariosPerteneciente\" es verdadera **DEBE** completar la extensión \"PueblosOriginarios\""
Expression:  "extension.where(url = 'https://interoperabilidad.minsal.cl/fhir/ig/mpi/StructureDefinition/PueblosOriginariosPerteneciente' and value.ofType(boolean).where(true)) implies extension.where(url = 'https://interoperabilidad.minsal.cl/fhir/ig/mpi/StructureDefinition/PuebloOriginario').exists()"
Severity:    #error
*/