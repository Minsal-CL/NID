Instance: MPI-IHE-PIXm-PDQm-Manager
InstanceOf: CapabilityStatement
Title: "Administrador del Indice Maestro Paciente"
Usage: #definition
Description: """
El CapabilityStatement del administador del Indice Maestro Paciente debe cumplir con las siguientes especificiones normadas.

* Uso de FHIR R4
* Uso **PUEDE** devolver el recurso en JSON o XML
* **DEBE** Soportar Perfil MINSAL Paciente
* Los parametros de busquedas **DEBERIAN** ser:
  * _id
  * active
  * family
  * given
  * identifier
  * segundoApellido
* **DEBE** soportar el uso de la operación [$ihe-pix](OperationDefinition-MPI.PIXm.pix.html)
"""
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* version = "2.0.0"
* name = "MPI_IHE_PIXm_Consumidor"
* status = #draft
* experimental = false
* date = "2024-08-07T09:44:00-03:00"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml

/*
* implementationGuide = "http://hl7.org/fhir/smart-app-launch/ImplementationGuide/hl7.fhir.uv.smart-app-launch"
* implementationGuide.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide.extension.valueCode = #SHOULD
*/
* rest
  * mode = #server

* rest.documentation = """
El servidor como administrador PIXm ofrece la capacidad de consultar la \"Referencia Cruzada de Identidad del Paciente\" que coincida con los parámetros de la consulta del Indice Maestro Paciente. Además de ser proveedor demografico del paciente (PDQm) ofrece la capacidad de descubrir identidades de pacientes mediante demografía e identificadores.
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
      * valueCode = #SHALL
    * code = #search-type
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * code = #update
  * searchRevInclude[0]
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * code = #read
  * searchRevInclude[0] = "Coverage:beneficiary"
  * searchRevInclude[=]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
  * searchRevInclude[+] = "Group:member"
  * searchRevInclude[=]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
  * searchRevInclude[+] = "Observation:subject"
  * searchRevInclude[=]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
  * searchRevInclude[+] = "RelatedPerson:patient"
  * searchRevInclude[=]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
  * searchParam[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "_id"
    * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
    * type = #token
    * documentation =  "Id logico del Paciente"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "active"
    * definition =  "http://hl7.org/fhir/SearchParameter/Patient-active"
    * type = #token
    * documentation = "Si el registro del paciente está activo."
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "given"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-given"
    * type = #string
    * documentation = "Nombre(s) del paciente"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "given:exact"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-given"
    * type = #string
    * documentation = "Nombre(s) del paciente"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "identifier"
    * definition =  "http://hl7.org/fhir/SearchParameter/Patient-identifier"
    * type = #token
    * documentation = "Un identificador del paciente"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "family"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-family"
    * type = #string
    * documentation = "Primer apellido del paciente"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "family:exact"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-family"
    * type = #string
    * documentation = "Primer apellido del paciente"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "segundoApellido"
    * definition = Canonical(mpi-paciente-segundoApellido)
    * type = #string
    * documentation = "Segundo apellido del paciente"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "segundoApellido:exact"
    * definition = Canonical(mpi-paciente-segundoApellido)
    * type = #string
    * documentation = "Segundo apellido del paciente"
  * operation[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "ihe-pix"
    * definition = Canonical(MPI.PIXm.pix)