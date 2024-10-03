Instance:   NID.IHE.HPD.Manager
InstanceOf: CapabilityStatement
Title:      "Administrador del Directorio de Proveedores de Atención Médica"
Usage:      #definition
Description: """
El CapabilityStatement del administador del directorio de proveedores de atención médica debe cumplir con las siguientes especificiones normadas.

* Uso de FHIR R4
* Uso **PUEDE** devolver el recurso en JSON o XML
* **DEBE** Soportar Perfil \"Prestador Administrativo\", \"Prestador Individual\" y \"Prestador Organizacional\"
* Los parametros de búsquedas de los Perfiles Practitioner **DEBEN** ser:
  * _id
  * identifier
  * family
  * given
  * identifier
* Los parametros de búsquedas del Perfil Organization **DEBEN** ser:
  * _id
  * identifier
  * name
"""
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #draft

* name = "NID_IHE_HPD_Manager"
* status = #draft
* experimental = false
* date = "2024-09-25T15:50:00-03:00"
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

* implementationGuide[0] = "https://hl7chile.cl/fhir/ig/clcore/ImplementationGuide/hl7.fhir.cl.clcore"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD


* rest
  * mode = #server

* rest.documentation = """
El servidor de Administrador del Directorio de Proveedores de Atención Médica. Permite almacenar de manera segura e inequivoca tanto de los proveedores adminitrativos, institucionale e individuales. 
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
      * valueCode = #SHALL
    * code = #search-type
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * code = #update
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * code = #delete
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * code = #read
  * searchParam[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "_id"
    * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
    * type = #token
    * documentation =  "Id logico del Profesional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "active"
    * definition =  "http://hl7.org/fhir/SearchParameter/Practitioner-active"
    * type = #token
    * documentation = "Si el registro del profesional está activo."
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "given"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-given"
    * type = #string
    * documentation = "Nombre(s) del profesional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "given:exact"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-given"
    * type = #string
    * documentation = "Nombre(s) del profesional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "identifier"
    * definition =  "http://hl7.org/fhir/SearchParameter/Practitioner-identifier"
    * type = #token
    * documentation = "Un identificador del profesional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "family"
    * definition = "http://hl7.org/fhir/SearchParameter/individual-family"
    * type = #string
    * documentation = "Primer apellido del profesional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "family:exact"
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
      * valueCode = #SHALL
    * code = #search-type
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * code = #read
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * code = #update
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * code = #delete
  * searchParam[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "_id"
    * definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
    * type = #token
    * documentation =  "Id logico del Profesional Institucional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "identifier"
    * definition =  "http://hl7.org/fhir/SearchParameter/Organization-identifier"
    * type = #token
    * documentation = "Identificador del Profesional Institucional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "active"
    * definition = "http://hl7.org/fhir/SearchParameter/Organization-active"
    * type = #token
    * documentation = "Si el registro del profesional está activo."
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "name"
    * definition = "http://hl7.org/fhir/SearchParameter/Organization-name"
    * type = #string
    * documentation = "Nombre o alias del Profesional Institucional"
  * searchParam[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "name:exact"
    * definition = "http://hl7.org/fhir/SearchParameter/Organization-name"
    * type = #string
    * documentation = "Nombre o alias del Profesional Institucional exacto"