Instance: MPI.PIXm.pix
InstanceOf: OperationDefinition
Title: "Operación para Obtener Identificadores Correspondientes"
Description: """
Operación compatible con la [$ihe-pix](https://profiles.ihe.net/ITI/PIXm/OperationDefinition-IHE.PIXm.pix.html) para obtener los identificadores correspondientes de cada recurso paciente
  * Input: sourceIdentifier, targetSystem, and _format
  * Output: targetIdentifier, targetId
"""  
Usage: #definition

* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #draft
* name = "MPI_PIXM_pix"
* status = #draft
* kind = #operation
* date = "2022-05-25"
* code = #ihe-pix
* resource = #Patient
* system = false
* type = true
* instance = false
* inputProfile = Canonical(ParametrosEntradaPixmMpi)
* outputProfile = Canonical(ParametrosSalidaPixmMpi)
* parameter[0]
  * name = #sourceIdentifier
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "El parámetro de búsqueda del identificador del Paciente que será utilizado por el Administrador de Referencia Cruzada de Identificadores de Pacientes para encontrar identificadores cruzados asociados con el Recurso Paciente."
  * type = #string
  * searchType = #token
* parameter[+]
  * name = #targetSystem
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "La Autoridad Asignadora de Identificadores del Paciente objetivo de la cual se deben seleccionar los identificadores devueltos."
  * type = #string
  * searchType = #uri
* parameter[+]
  * name = #_format
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "El formato solicitado de la respuesta."
  * type = #string
  * searchType = #token
* parameter[+]
  * name = #targetIdentifier
  * use = #out
  * min = 0
  * max = "*"
  * documentation = "El identificador encontrado."
  * type = #Identifier
* parameter[+]
  * name = #targetId
  * use = #out
  * min = 0
  * max = "*"
  * documentation = "La URL del Recurso Paciente."
  * type = #Reference