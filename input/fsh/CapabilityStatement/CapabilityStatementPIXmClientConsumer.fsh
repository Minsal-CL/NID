Instance: MPI.IHE.PIXm.Buscador
InstanceOf: CapabilityStatement
Title: "Indice Maestro Paciente: \"Cliente Buscador PIXm\""
Usage: #definition
Description: """
El CapabilityStatement del Actor Cliente Buscador MPI expresa los requisitos que pueden ser utilizados mientras se cumple con la normativa.

* Uso de FHIR R4
* Uso de estructura JSON o XML
* Uso de la operación [$ihe-pix](OperationDefinition-MPI.PIXm.pix.html)
"""
* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #draft
//* version = "0.2.2"
* name = "MPI_IHE_PIXm_Buscador"
* status = #draft
* experimental = false
* date = "2014-08-14T12:00:00-03:00"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml
* format[+] = #application/fhir+json
* format[+] = #application/fhir+xml

* implementationGuide[0] = "https://hl7chile.cl/fhir/ig/clcore/ImplementationGuide/hl7.fhir.cl.clcore"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD
* implementationGuide[+] = "https://profiles.ihe.net/ITI/PIXm/ImplementationGuide/ihe.iti.pixm"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD

* rest
  * mode = #client

* rest.documentation = """
El cliente PIXm realiza consultas para la Referencia Cruzada de Identidad del Paciente que coincida con los parámetros de la consulta.
"""
/*
* rest.security.description = "1. See the [General Security Considerations](security.html) section for requirements and recommendations.\n1. A server **SHALL** reject any unauthorized requests by returning an `HTTP 401` \"Unauthorized\", `HTTP 403` \"Forbidden\", or `HTTP 404` \"Not Found\""
*/
* rest.resource[0] //Patient
  * extension[0]
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = #SHALL
  * type = #Patient
  * operation[0]
    * extension
      * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
      * valueCode = #SHALL
    * name = "ihe-pix"
    * definition = Canonical(MPI.PIXm.pix)