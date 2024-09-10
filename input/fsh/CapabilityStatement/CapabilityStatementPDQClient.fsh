Instance: MPI.IHE.PDQm.Search.Cliente
InstanceOf: CapabilityStatement
Title: "Indice Maestro Paciente: \"Cliente Buscador de Datos Demográficos (PDQm)\""
Usage: #definition
Description: """
El CapabilityStatement de los requisitos del Actor Consumidor de Demografía del Indice Maestro Paciente(cliente) expresa los requisitos que pueden ser utilizados mientras se cumple con la normativa. Este CapabilityStatement implementa la Opción de Búsqueda de Pacientes.

* Uso de FHIR R4
* Uso **PUEDE** traer el recurso en JSON o XML
* Soportar Perfil MINSAL Paciente
* Soportar los perfiles MPI MINSAL que permiten completar con la información normativa requerida. 
* Los parametros de busquedas **PUEDEN** ser:
  * _id
  * active
  * family
  * given
  * identifier
  * segundo-apellido
* **PUEDE** soportar los _revinclude que permitan traer la información adicional requerida.
"""
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #draft

* name = "MPI_IHE_PDQm_Search_Cliente"
* status = #draft
* experimental = false
* date = "2024-08-07T09:44:00-03:00"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml

* implementationGuide[0] = "https://hl7chile.cl/fhir/ig/clcore/ImplementationGuide/hl7.fhir.cl.clcore"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD
* implementationGuide[+] = "https://profiles.ihe.net/ITI/PDQm/ImplementationGuide/ihe.iti.pdqm"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD

* rest
  * mode = #client

* rest.documentation = """
El Proveedor de Demografía del Indice Maestro Paciente (PDQm) ofrece la capacidad de descubrir Identidades de Pacientes mediante demografía e identidades.
"""
/*
* rest.security.description = "1. See the [General Security Considerations](security.html) section for requirements and recommendations.\n1. A server **SHALL** reject any unauthorized requests by returning an `HTTP 401` \"Unauthorized\", `HTTP 403` \"Forbidden\", or `HTTP 404` \"Not Found\""
*/
* rest.resource[0] //Patient
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * type = #Patient
  * supportedProfile = Canonical(MINSALPaciente)
  * supportedProfile.extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * interaction[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY 
    * code = #search-type
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * code = #read
  * searchRevInclude[0] = "Coverage:beneficiary"
  * searchRevInclude[=]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
  * searchRevInclude[+] = "Group:member"
  * searchRevInclude[=]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
  * searchRevInclude[+] = "Observation:subject"
  * searchRevInclude[=]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
  * searchRevInclude[+] = "RelatedPerson:patient"
  * searchRevInclude[=]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
  * searchParam[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "_id"
    * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
    * type = #token
    * documentation =  "Id logico del Paciente"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "active"
    * definition =  "http://hl7.org/fhir/SearchParameter/Patient-active"
    * type = #token
    * documentation = "Si el registro del paciente está activo."
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "given"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-given"
    * type = #string
    * documentation = "Nombre(s) del paciente"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "identifier"
    * definition =  "http://hl7.org/fhir/SearchParameter/Patient-identifier"
    * type = #token
    * documentation = "Un identificador del paciente"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "family"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-family"
    * type = #string
    * documentation = "Primer apellido del paciente"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "segundo-apellido"
    * definition = Canonical(mpi-paciente-segundoApellido)
    * type = #string
    * documentation = "Segundo apellido del paciente"
 