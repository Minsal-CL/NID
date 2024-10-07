Instance: MPI.IHE.PDQm.Search.Cliente.Match
InstanceOf: CapabilityStatement
Title: "Indice Maestro Paciente: \"Cliente Buscador de Datos Demográficos (PDQm) con implementación de Match\""
Usage: #definition
Description: """
El CapabilityStatement de los requisitos del Actor Consumidor de Demografía del Indice Maestro Paciente(cliente) expresa los requisitos que pueden ser utilizados mientras se cumple con la normativa. Este CapabilityStatement implementa la Opción de Búsqueda de Pacientes mediante la operación Match.

* Uso de FHIR R4
* Uso **PUEDE** traer el recurso en JSON o XML
* Los parámetros de entrada y salida deben ser conforme a los perfiles MPI Paciente
* Invoca la operación $match en un endpoint FHIR
"""

* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #draft

* name = "MPI_IHE_PDQm_Search_Cliente_Match"
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
El Proveedor de Demografía del Indice Maestro Paciente (PDQm) ofrece la capacidad de descubrir Identidades de Pacientes mediante la invocación de la operación $match.
"""
/*
* rest.security.description = "1. See the [General Security Considerations](security.html) section for requirements and recommendations.\n1. A server **SHALL** reject any unauthorized requests by returning an `HTTP 401` \"Unauthorized\", `HTTP 403` \"Forbidden\", or `HTTP 404` \"Not Found\""
*/
* rest.resource[0] //Patient
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * type = #Patient
  * supportedProfile[0] = Canonical(MINSALPaciente)
  * supportedProfile[=].extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * supportedProfile[+] = Canonical(MINSALPacienteBusqueda)
  * supportedProfile[=].extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * operation[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "match"
    * definition = Canonical(MPI.PDQm.match)
  