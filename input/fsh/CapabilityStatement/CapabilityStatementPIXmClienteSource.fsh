Instance: MPI.IHE.PIXm.Origen
InstanceOf: CapabilityStatement
Title: "Indice Maestro Paciente: \"Cliente de Origen PIXm\""
Usage: #definition
Description: """
El CapabilityStatement del Actor Cliente de Origen del MPI expresa los requisitos que pueden ser utilizados mientras se cumple con la normativa.

* Uso de FHIR R4
* Uso de estructura JSON o XML
* Uso condicional para actualizar Paciente
* Soportar Perfil MINSAL Paciente
* Soportar los perfiles MPI MINSAL que permiten completar con la información normativa requerida. 

"""
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #draft
//* version = "0.2.2"
* name = "MPI_IHE_PIXm_Origen"
* status = #draft
* experimental = false
* date = "2014-08-14T12:00:00-03:00"
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
* implementationGuide[+] = "https://profiles.ihe.net/ITI/PIXm/ImplementationGuide/ihe.iti.pixm"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD

* rest
  * mode = #client

* rest.documentation = """
El cliente de origen es el productor y publicador de los datos de la entidad paciente.
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
    * code = #update
  * interaction[=].extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #MAY
  * interaction[+]
    * code = #delete
  * interaction[=].extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #MAY
* rest.resource[+] //Coverage
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * type = #Coverage
  * supportedProfile = Canonical(MINSALCobertura)
  * supportedProfile.extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * interaction[0]
    * code = #update
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
  * interaction[+]
    * code = #delete
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
* rest.resource[+] //Group
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * type = #Group
  * supportedProfile = Canonical(MINSALAgrupacionPorMarcas)
  * supportedProfile.extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * interaction[0]
    * code = #update
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
  * interaction[+]
    * code = #delete
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
* rest.resource[+] //Observation
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * type = #Observation
  * supportedProfile[0] = Canonical(MINSALNivelEducacional)
  * supportedProfile[=].extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * supportedProfile[+] = Canonical(MINSALOcupacion)
  * supportedProfile[=].extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * supportedProfile[+] = Canonical(MINSALSituacionDiscapacidad)
  * supportedProfile[=].extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * interaction[0]
    * code = #update
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
  * interaction[+]
    * code = #delete
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #MAY
* rest.resource[+] //relatedPerson
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * type = #RelatedPerson
  * supportedProfile = Canonical(MINSALAcompanante)
  * supportedProfile.extension
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