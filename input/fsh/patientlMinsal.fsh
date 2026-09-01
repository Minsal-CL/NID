Alias: $deis.id = https://interoperabilidad.minsal.cl/fhir/ig/eis/StructureDefinition/deis-identifier


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

// * ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-compliesWithProfile"
// * ^extension[=].valueCanonical = Canonical(PDQmPatient)


* extension[sexoRegistral] 1..1 
* extension[nacionalidad] 1..*
* extension[pueblosIndigenas] 0..*
* extension[religionesCultos] 0..*
* extension[pueblosTribales] 0..*


* obeys mpi-pat-enlaceEstado 


//* extension contains PaisOrigenMPI named PaisOrigennnnnnnnnnnn 0..1 MS
//* extension contains Religion named Religionnnnnnnnn 0..1 MS
//* extension contains PueblosOriginariosPerteneciente named PueblosOriginariosPerteneciente 1..1 MS
//* extension contains PueblosAfrodescendiente named PueblosAfrodescendienteeeeeeeeeeeeeeeeee 0..1 MS
//* extension contains PueblosOriginariosMPI named PuebloOriginario 0..1 MS
// * extension contains patient-motherMaidenName named MothersMaidenName 0..0 MS
//* extension[nacionalidad]
//* extension[IdentidadDeGenero] 0..1 MS

* implicitRules 0..0
* modifierExtension 0..0

* identifier 1..* MS
* identifier ^short = "Identificador de paciente"
* identifier.type 1..1 MS
* identifier.type ^short = "Tipo de documento"
* identifier.type ^definition = "Tipo de documento"
* identifier.type ^comment = "Tipo de documento"


* active MS
  * ^short = "Si el registro de este paciente está en uso activo."

* name 1..* MS	
* name obeys mpi-pat-nombre
* name[NombreOficial] obeys mpi-pat-nombre
* name[NombreOficial] 1..1
* name[NombreOficial].given 1..*
* name[NombreOficial].family 1..1

* identifier contains RUNMaterno 0..1 MS and Pasaporte 0..1 MS and DocumentoPaisOrigen 0..1 MS and NIP 0..1 MS and HistoriaClinica 0..1 MS and IPE 0..1 MS

* identifier[RUN] 0..1
* identifier[RUN] ^short = "RUN del paciente"
//* identifier[RUN] obeys mpi-id-run-formato
* identifier[RUN].type.coding = TipoIdentificadorCS#1
* identifier[RUN].type ^binding.strength = #required
* identifier[RUN].type ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/eis/ValueSet/eis-tipo-identificador-vs"
* identifier[RUN].extension[digitoVerificador] 1..1 MS
* identifier[RUN].value ^short = "Número de RUN"
* identifier[RUN].value ^definition = "Valor numérico, máximo 9 dígitos"
* identifier[RUN].system ^short = "Sistema de identificación del paciente"
* identifier[RUN].system ^definition = "Sistema de identificación del paciente"
* identifier[RUN].system ^binding.strength = #required
* identifier[RUN].system ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/nid/paciente/identificador/run"

* identifier[RUNMaterno] only $deis.id.digito
* identifier[RUNMaterno] ^short = "RUN Materno / Progenitor(a) del paciente"
//* identifier[RUNMaterno] obeys mpi-id-run-materno-formato
* identifier[RUNMaterno].type.coding = TipoIdentificadorCS#2
* identifier[RUNMaterno].type ^binding.strength = #required
* identifier[RUNMaterno].type ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/eis/ValueSet/eis-tipo-identificador-vs"
* identifier[RUNMaterno].extension[digitoVerificador] 1..1 MS
* identifier[RUNMaterno].value ^short = "Número de RUN Materno / Progenitor(a)"
* identifier[RUNMaterno].value ^definition = "Valor numérico, máximo 9 dígitos"
* identifier[RUNMaterno].system ^short = "Sistema de identificación del paciente"
* identifier[RUNMaterno].system ^definition = "Sistema de identificación del paciente"
* identifier[RUNMaterno].system ^binding.strength = #required
* identifier[RUNMaterno].system ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/nid/paciente/identificador/runMaterno"

* identifier[Pasaporte] ^short = "Número de pasaporte del paciente"
//* identifier[Pasaporte] obeys mpi-id-pasaporte-formato
* identifier[Pasaporte].type.coding = TipoIdentificadorCS#3
* identifier[Pasaporte].type ^binding.strength = #required
* identifier[Pasaporte].type ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/eis/ValueSet/eis-tipo-identificador-vs"
* identifier[Pasaporte].type.extension[PaisEmisor] 1..1 MS
* identifier[Pasaporte].value ^short = "Número de pasaporte"
* identifier[Pasaporte].value ^definition = "Valor alfanumérico"
* identifier[Pasaporte].period.end 1..1 MS
* identifier[Pasaporte].period.end ^short = "Fecha de caducidad del pasaporte"
* identifier[Pasaporte].period.end ^definition = "Formato de referencia \"DD-MM-AAAA\""
* identifier[Pasaporte].system ^short = "Sistema de identificación del paciente"
* identifier[Pasaporte].system ^definition = "Sistema de identificación del paciente"
* identifier[Pasaporte].system ^binding.strength = #required
* identifier[Pasaporte].system ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/nid/paciente/identificador/pasaporte"

* identifier[DocumentoPaisOrigen] ^short = "Documento identificador de país de origen"
//* identifier[DocumentoPaisOrigen] obeys mpi-id-documento-pais-origen-formato
* identifier[DocumentoPaisOrigen].type.coding = TipoIdentificadorCS#4
* identifier[DocumentoPaisOrigen].type ^binding.strength = #required
* identifier[DocumentoPaisOrigen].type ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/eis/ValueSet/eis-tipo-identificador-vs"
* identifier[DocumentoPaisOrigen].value ^short = "Número de documento de país de origen"
* identifier[DocumentoPaisOrigen].value ^definition = "Valor alfanumérico"
* identifier[DocumentoPaisOrigen].system ^short = "Sistema de identificación del paciente"
* identifier[DocumentoPaisOrigen].system ^definition = "Sistema de identificación del paciente"
* identifier[DocumentoPaisOrigen].system ^binding.strength = #required
* identifier[DocumentoPaisOrigen].system ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/nid/paciente/identificador/documentoPaisOrigen"

* identifier[NIP] ^short = "Número de Identificador Provisorio FONASA (NIP)"
* identifier[NIP] only $deis.id.digito
//* identifier[NIP] obeys mpi-id-nip-formato
* identifier[NIP].type.coding = TipoIdentificadorCS#5
* identifier[NIP].type ^binding.strength = #required
* identifier[NIP].type ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/eis/ValueSet/eis-tipo-identificador-vs"
* identifier[NIP].extension[digitoVerificador] 1..1 MS
* identifier[NIP].value ^short = "Número NIP"
* identifier[NIP].value ^definition = "Valor alfanumérico"
* identifier[NIP].system ^short = "Sistema de identificación del paciente"
* identifier[NIP].system ^definition = "Sistema de identificación del paciente"
* identifier[NIP].system ^binding.strength = #required
* identifier[NIP].system ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/nid/paciente/identificador/nip"

* identifier[HistoriaClinica] ^short = "Número de Historia Clínica"
//* identifier[HistoriaClinica] obeys mpi-id-historia-clinica-formato
* identifier[HistoriaClinica].type.coding = TipoIdentificadorCS#6
* identifier[HistoriaClinica].type ^binding.strength = #required
* identifier[HistoriaClinica].type ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/eis/ValueSet/eis-tipo-identificador-vs"
* identifier[HistoriaClinica].value ^short = "Número de historia clínica"
* identifier[HistoriaClinica].value ^definition = "Valor alfanumérico"
* identifier[HistoriaClinica].system ^short = "Sistema de identificación del paciente"
* identifier[HistoriaClinica].system ^definition = "Sistema de identificación del paciente"
* identifier[HistoriaClinica].system ^binding.strength = #required
* identifier[HistoriaClinica].system ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/nid/paciente/identificador/historiaClinica"

* identifier[IPE] ^short = "Identificación Provisoria del Estudiante (IPE)"
* identifier[IPE] only $deis.id.digito
//* identifier[IPE] obeys mpi-id-ipe-formato
* identifier[IPE].type.coding = TipoIdentificadorCS#7
* identifier[IPE].type ^binding.strength = #required
* identifier[IPE].type ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/eis/ValueSet/eis-tipo-identificador-vs"
* identifier[IPE].extension[digitoVerificador] 1..1 MS
* identifier[IPE].value ^short = "Número IPE"
* identifier[IPE].value ^definition = "Valor alfanumérico"
* identifier[IPE].system ^short = "Sistema de identificación del paciente"
* identifier[IPE].system ^definition = "Sistema de identificación del paciente"
* identifier[IPE].system ^binding.strength = #required
* identifier[IPE].system ^binding.valueSet = "https://interoperabilidad.minsal.cl/fhir/ig/nid/paciente/identificador/ipe"







* name[NombreSocial] obeys mpi-pat-nombre

* gender ^short = "Sexo Registral del paciente"
* gender 1..1 MS

//* address.extension contains http://hl7.org/fhir/StructureDefinition/geolocation named geolocalizacion 0..1
* address only NIDAddress

* birthDate 1..1 MS

* telecom ^slicing.discriminator.type = #value
* telecom ^slicing.discriminator.path = "system"
* telecom ^slicing.rules = #open
* telecom ^slicing.ordered = false
* telecom ^slicing.description = "Se diferencian los medios de contacto: teléfono fijo, teléfono móvil y correo electrónico"

* telecom 0..* MS
* telecom.system 1..1 MS
* telecom.system ^short = "phone | email"
* telecom.system ^definition = "Sistema de contacto"
//* telecom.system from VSSistemasComunicacion
* telecom.value 1..1 MS
* telecom.value ^short = "Valor de contacto"
* telecom.rank MS
* telecom.rank ^short = "Orden de uso del método de contacto, siendo 1 = prioritario"
* telecom.period MS
* telecom.period ^short = "Periodo de tiempo durante el cual es válido el contacto del paciente"

* telecom contains telefonoFijo 0..* MS and telefonoMovil 1..* MS and correoElectronico 1..* MS

* telecom[telefonoFijo] ^short = "Teléfono fijo del paciente"
//* telecom[telefonoFijo] obeys mpi-tel-fijo-formato
* telecom[telefonoFijo].system = #phone
* telecom[telefonoFijo].use = #home
* telecom[telefonoFijo].use 1..1 MS
* telecom[telefonoFijo].value ^short = "Número de teléfono fijo"
* telecom[telefonoFijo].value ^definition = "Formato numérico \"YXXXXXXX\" (8 dígitos), donde Y corresponde al código de área"

* telecom[telefonoMovil] ^short = "Teléfono móvil del paciente"
//* telecom[telefonoMovil] obeys mpi-tel-movil-formato
* telecom[telefonoMovil].system = #phone
* telecom[telefonoMovil].use = #mobile
* telecom[telefonoMovil].use 1..1 MS
* telecom[telefonoMovil].value ^short = "Número de teléfono móvil"
* telecom[telefonoMovil].value ^definition = "Formato numérico \"ZZXXXXXXX\" (9 dígitos), donde Z corresponde al dígito del código de país"

* telecom[correoElectronico] ^short = "Correo electrónico del paciente"
//* telecom[correoElectronico] obeys mpi-correo-formato
* telecom[correoElectronico].system = #email
* telecom[correoElectronico].value ^short = "Dirección de correo electrónico"
* telecom[correoElectronico].value ^definition = "Formato \"texto@dominio\""
/*
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
*/

/*
* maritalStatus.coding[MaritalStatusFHIR] from VSMaritalStatus
* maritalStatus.coding[MaritalStatusFHIR]
  * system = "http://terminology.hl7.org/CodeSystem/v3-MaritalStatus"
  * code 1..1 MS
    * ^short = "Estado civil del paciente"
    * ^definition = "Estado civil del paciente"
  * display 0..1 MS
    * ^short = "Texto descriptivo del estado civil"
*/

* deceased[x] 1..1 MS
* deceased[x] ^short = "Puede indicar si el paciente esta fallecido o no o en su defecto, agregar la fecha de fallecimiento."
* deceased[x] ^definition = "Puede indicar si el paciente esta fallecido o no o en su defecto, agregar la fecha de fallecimiento."

* contact 0..* MS

/*
* link 0..* MS
  * ^short = "Enlace que tiene el recurso Minsal Paciente con otro que sea la misma persona"
  * other 1..1 MS
    * ^short = "Relación mediante identifier o referencia al recurso"
  * other only Reference(PacienteCl or MINSALPaciente or MINSALAcompanante)
  * type 1..1 MS
    * ^short = "replaced-by | replaces | refer | seealso"
    * ^definition = "Tipo de enlace"
*/

Invariant:   mpi-pat-nombre
Description: "En caso de utilizar el dato nombre el Patient.name.given o Patient.name.family o el Patient.name.text debe existir, caso contrario **DEBE** utilizar la extensión data-absent-reason"
Expression:  "(family.exists() or given.exists() or text.exists()) xor extension.where(url='http://hl7.org/fhir/StructureDefinition/data-absent-reason').exists()"
Severity:    #error

Invariant:   mpi-pat-enlaceEstado
Description: "Si el elemento Patient.link está presente, entonces **DEBE** estar presente el Patient.active"
Expression:  "link.exists() implies active.exists()"
Severity:    #error

Invariant:   mpi-id-run-formato
Description: "El RUN debe ser numérico (máx. 9 dígitos) y su dígito verificador un único carácter numérico (incluido el 0) o la letra K/k"
Expression:  "value.matches('^[0-9]{1,9}$') and extension.where(url = 'http://hl7.org/fhir/StructureDefinition/identifier-checkDigit').value.matches('^[0-9kK]$')"
Severity:    #error

Invariant:   mpi-id-run-materno-formato
Description: "El RUN Materno/Progenitor(a) debe ser numérico (máx. 9 dígitos) y su dígito verificador un único carácter numérico (incluido el 0) o la letra K/k"
Expression:  "value.matches('^[0-9]{1,9}$') and extension.where(url = 'http://hl7.org/fhir/StructureDefinition/identifier-checkDigit').value.matches('^[0-9kK]$')"
Severity:    #error

Invariant:   mpi-id-pasaporte-formato
Description: "El número de pasaporte debe ser alfanumérico"
Expression:  "value.matches('^[A-Za-z0-9]+$')"
Severity:    #error

Invariant:   mpi-id-documento-pais-origen-formato
Description: "El documento identificador de país de origen debe ser alfanumérico"
Expression:  "value.matches('^[A-Za-z0-9]+$')"
Severity:    #error

Invariant:   mpi-id-nip-formato
Description: "El Número de Identificador Provisorio (NIP) debe ser alfanumérico"
Expression:  "value.matches('^[A-Za-z0-9]+$')"
Severity:    #error

Invariant:   mpi-id-historia-clinica-formato
Description: "El número de historia clínica debe ser alfanumérico"
Expression:  "value.matches('^[A-Za-z0-9]+$')"
Severity:    #error

Invariant:   mpi-id-ipe-formato
Description: "La identificación provisoria del estudiante (IPE) debe ser alfanumérica"
Expression:  "value.matches('^[A-Za-z0-9]+$')"
Severity:    #error

Invariant:   mpi-tel-fijo-formato
Description: "El número de teléfono fijo debe tener formato numérico de 8 dígitos \"YXXXXXXX\", donde Y es el código de área"
Expression:  "value.matches('^[0-9]{8}$')"
Severity:    #error

Invariant:   mpi-tel-movil-formato
Description: "El número de teléfono móvil debe tener formato numérico de 9 dígitos \"ZZXXXXXXX\", donde Z es el dígito del código de país"
Expression:  "value.matches('^[0-9]{9}$')"
Severity:    #error

Invariant:   mpi-correo-formato
Description: "El correo electrónico debe tener formato \"texto@dominio\""
Expression:  "value.matches('^[^@[:space:]]+@[^@[:space:]]+\\\\.[^@[:space:]]+$')"
Severity:    #error

/*
Invariant:   mpi-pat-PueblosOriginarios
Description: "Si la extensión \"PueblosOriginariosPerteneciente\" es verdadera **DEBE** completar la extensión \"PueblosOriginarios\""
Expression:  "extension.where(url = 'https://interoperabilidad.minsal.cl/fhir/ig/mpi/StructureDefinition/PueblosOriginariosPerteneciente' and value.ofType(boolean).where(true)) implies extension.where(url = 'https://interoperabilidad.minsal.cl/fhir/ig/mpi/StructureDefinition/PuebloOriginario').exists()"
Severity:    #error
*/