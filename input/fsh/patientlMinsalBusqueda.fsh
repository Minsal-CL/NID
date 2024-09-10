Profile: MINSALPacienteBusqueda
Parent: PacienteCl
Id: MINSALPacienteBusqueda
Title: "MINSAL Paciente Busqueda"
Description: "Paciente definido para la busqueda dentro del \"Indice Maestro de Pacientes\". Este es utilizado en la operación $match como parametro de entrada."

* extension contains PaisOrigenMPI named PaisOrigen 0..1 MS
* extension contains Religion named Religion 0..1 MS
//* extension contains PueblosOriginariosPerteneciente named PueblosOriginariosPerteneciente 0..1 MS
* extension contains PueblosAfrodescendiente named PueblosAfrodescendiente 0..1 MS
* extension contains PueblosOriginarios named PueblosOriginarios 0..1 MS
* extension[nacionalidad] 0..1 MS
* extension[IdentidadDeGenero] 0..1 MS

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

* address
  * extension[Geolocalizacion] ^short = "Dirección absoluta, es decir, latitud y longitud."
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
* telecom.value 1..1 MS
* telecom.value ^short = "Valor de contacto"
* telecom.rank MS
* telecom.rank ^short = "Orden de uso del método de contacto, siendo 1 = prioritario"

* telecom.period MS
* telecom.period ^short = "Periodo de tiempo durante el cual es válido el contacto del paciente"

* maritalStatus from VSEstadoCivil
* maritalStatus MS
* maritalStatus ^short = "Estado civil del paciente"

* deceased[x] 1..1 MS
* deceased[x] ^short = "Puede indicar si el paciente esta fallecido o no o en su defecto, agregar la fecha de fallecimiento."
* deceased[x] ^definition = "Puede indicar si el paciente esta fallecido o no o en su defecto, agregar la fecha de fallecimiento."

* contact 0..* MS