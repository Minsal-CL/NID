Instance:   NID.IHE.HPD.Source
InstanceOf: CapabilityStatement
Title:      "Origen del Directorio de Proveedores de Atención Médica"
Usage:      #definition
Description: """
El CapabilityStatement del origen del directorio de proveedores de atención médica debe cumplir con las siguientes especificiones normadas.

* Uso de FHIR R4
* Uso de estructura JSON o XML
* Uso condicional del Perfil \"Prestador Administrativo\", \"Prestador Individual\" y \"Prestador Organizacional\"

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
  * mode = #client

* rest.documentation = """
El servidor de \"Origen del Directorio de Proveedores de Atención Médica\" permite generar nuevos y/o eliminar prestadores 
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
    * code = #update
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * code = #delete
* rest.resource[+] //Organization
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * type = #Organization
  * supportedProfile = Canonical(MINSALPrestadorOrganizacional)
  * supportedProfile.extension
  * interaction[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * code = #update
  * interaction[+]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
    * code = #delete