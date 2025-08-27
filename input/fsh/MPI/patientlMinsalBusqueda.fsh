Profile: MINSALPacienteBusqueda
Parent: PacienteCl2
Id: MINSALPacienteBusqueda
Title: "MINSAL Paciente Busqueda"
Description: "Paciente definido para la busqueda dentro del \"Indice Maestro de Pacientes\". Este es utilizado en la operación $match como parámetro de entrada."


* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 1

* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #draft

* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-compliesWithProfile"
* ^extension[=].valueCanonical = Canonical(PDQmMatchInput)

* extension contains PaisOrigenMPI named PaisOrigen 0..1 MS
* extension contains Religion named Religion 0..1 MS
//* extension contains PuebloOriginarioPerteneciente named PuebloOriginarioPerteneciente 0..1 MS
* extension contains PueblosAfrodescendiente named PueblosAfrodescendiente 0..1 MS
* extension contains PueblosOriginariosMPI named PuebloOriginario 0..1 MS
* extension[nacionalidad] 0..1 MS
* extension[IdentidadDeGenero] 0..1 MS

* extension contains patient-motherMaidenName named MothersMaidenName 0..0 MS
* implicitRules 0..0
* modifierExtension 0..0


* identifier 0..* MS
* identifier ^short = "Identificador de paciente"
* identifier.type MS
* identifier.type ^short = "Tipo de documento"
* identifier.type ^definition = "Tipo de documento"
* identifier.type ^comment = "Tipo de documento"
* identifier.type from VSTipoIdentificador
* identifier.type ^binding.description = "Identificadores definidos por DEIS"
* identifier.type.extension[paisEmisionDocumento] 0..1 MS
* identifier.value 0..1 MS
* identifier.value ^short = "Valor del identificador" 

* active MS
  * ^short = "Si el registro de este paciente está en uso activo."


* gender ^short = "Sexo Registral del paciente"
* gender 0..1 MS

* address only ClAddress2
  * extension[geoLocation] ^short = "Dirección absoluta, es decir, latitud y longitud."
  * extension contains SituacionCalle named SituacionCalle 0..1 MS

  * use 0..1 MS
  * line 0..1 MS
  * line ^short = "Calle o avenida, numero y casa o dpto"
  * line ^definition = "Calle o avenida, numero y casa o dpto"
  * city.extension 1..1 MS
  * city.extension[comunas] 1..1 MS
  * district.extension 1..1 MS
  * district.extension[provincias] 1..1 MS
  * state.extension 1..1 MS
  * state.extension[regiones] 1..1 MS
  * country.extension 1..1 MS
  * country.extension[paises] 1..1 MS
  * country.extension 1..1 MS
  * period 0..1 MS
  * period ^short = "Periodo de tiempo durante el  cual es válida la dirección entregada"

* birthDate 0..1 MS

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

* deceased[x] MS
* deceased[x] ^short = "Puede indicar si el paciente esta fallecido o no o en su defecto, agregar la fecha de fallecimiento."
* deceased[x] ^definition = "Puede indicar si el paciente esta fallecido o no o en su defecto, agregar la fecha de fallecimiento."

* contact 0..* MS