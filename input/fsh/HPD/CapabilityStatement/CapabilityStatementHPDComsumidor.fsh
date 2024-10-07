Instance:   NID.IHE.HPD.Consumer
InstanceOf: CapabilityStatement
Title:      "Consumidor del Directorio de Proveedores de Atención Médica"
Usage:      #definition
Description: """
El CapabilityStatement de los requisitos del consumidor del directorio de proveedores de atención médica expresa los requisitos que pueden ser utilizados mientras se cumple con la normativa. Este CapabilityStatement implementa la Opción de Búsqueda de Profesionales.
* Uso de FHIR R4
* Uso **PUEDE** traer el recurso en JSON o XML
* Soportar Perfiles de Prestador Administrativo, Prestador Profesional y Prestador Institucional
* Los parámetros de búsquedas de los Perfiles Practitioner **PUEDEN** ser:
  * _id
  * identifier
  * family
  * given
  * identifier
* Los parámetros de búsquedas del Perfil Organization **PUEDEN** ser:
  * _id
  * identifier
  * name
  * type
"""
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #draft

* name = "MPI_IHE_PDQm_Search_Cliente"
* status = #draft
* experimental = false
* date = "2024-09-25T15:50:00-03:00"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml

* implementationGuide[0] = "https://hl7chile.cl/fhir/ig/clcore/ImplementationGuide/hl7.fhir.cl.clcore"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD

* rest
  * mode = #client

* rest.documentation = """
El Consumidor del Directorio de proveedores de atención médica ofrece la capacidad de descubrir profesionales e instituciones, mediante datos demográficos.
"""
/*
* rest.security.description = "1. See the [General Security Considerations](security.html) section for requirements and recommendations.\n1. A server **SHALL** reject any unauthorized requests by returning an `HTTP 401` \"Unauthorized\", `HTTP 403` \"Forbidden\", or `HTTP 404` \"Not Found\""
*/
* rest.resource[0] //Practitioner
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * type = #Practitioner
  * supportedProfile[0] = Canonical(MINSALPractitionerAdministrativo)
  * supportedProfile[=].extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * supportedProfile[+] = Canonical(MINSALPrestadorProfesional)
  * supportedProfile[=].extension
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
  * searchParam[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "_id"
    * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
    * type = #token
    * documentation =  "Id logico del Profesional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "active"
    * definition =  "http://hl7.org/fhir/SearchParameter/Practitioner-active"
    * type = #token
    * documentation = "Si el registro del profesional está activo."
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "given"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-given"
    * type = #string
    * documentation = "Nombre(s) del profesional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "identifier"
    * definition =  "http://hl7.org/fhir/SearchParameter/Practitioner-identifier"
    * type = #token
    * documentation = "Un identificador del profesional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "family"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-family"
    * type = #string
    * documentation = "Primer apellido del profesional"
* rest.resource[+] //Organization
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * type = #Organization
  * supportedProfile = Canonical(MINSALPrestadorOrganizacional)
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
  * searchParam[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "_id"
    * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
    * type = #token
    * documentation =  "Id logico del prestador institucional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "identifier"
    * definition =  "http://hl7.org/fhir/SearchParameter/Organization-identifier"
    * type = #token
    * documentation = "Identificador del prestador institucional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "active"
    * definition = "http://hl7.org/fhir/SearchParameter/Organization-active"
    * type = #token
    * documentation = "Si el registro del prestador está activo."
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "name"
    * definition = "http://hl7.org/fhir/SearchParameter/Organization-name"
    * type = #string
    * documentation = "Nombre o alias del prestador institucional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * name = "type"
    * definition = "http://hl7.org/fhir/SearchParameter/Organization-type"
    * type = #token
    * documentation = "Tipo de prestador institucional"

  