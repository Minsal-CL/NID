Profile:     BundleSearchMPI
Parent:      Bundle
Id:          BundleSearchMPI
Title:       "MINSAL Bundle Resultado Consulta: Pacientes"
Description: "Bundle resultado de una busqueda de un recurso paciente mediante parámetros"


* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* ^extension[=].valueInteger = 1

* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* ^extension[=].valueCode = #draft

* ^extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-compliesWithProfile"
* ^extension[=].valueCanonical = Canonical(QueryPatientResourceResponseMessage)

* type 1..1 MS
  * ^short = "Tipo de Bundle, para el caso de uso es un \"searchset\""
* type = #searchset

* total 1..1 MS
  * ^short = "Numero total de resultados"
    
* entry MS
  * ^short = "Entrada de los resultados de la busqueda"
  * ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "resource"
  * ^slicing.rules = #open
  * ^slicing.description = "Diferenciación de los resultados de la busqueda"
  * ^slicing.ordered = false
  * fullUrl 1..1 MS
    * ^short = "uri de identificación del resultado"
* entry contains
  paciente 0..* MS

* entry[paciente] 
  * ^short = "Paciente"
  * resource MS
    * ^short = "Información sobre un individuo que reciva servicio de cuidados de salud"
  * resource only MINSALPaciente
  
