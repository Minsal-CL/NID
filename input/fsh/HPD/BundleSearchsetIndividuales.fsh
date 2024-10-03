Profile:     BundleSearchProfHPD
Parent:      Bundle
Id:          BundleSearchProfHPD
Title:       "MINSAL Bundle Resultado Consulta: Prestadores Profesional y Administrativos"
Description: """
Bundle resultado de una busqueda de un recurso \"Practitioner\" mediante parametros.
Se debe incluir el parametro de \"_profile\" e incluir la url canonica del perfil [Prestador Administrativo](StructureDefinition-MINSALPractitionerAdministrativo.html) o [Prestador Profesional](StructureDefinition-MINSALPrestadorProfesional.html), esto permite especificar la busqueda según cada tipo de profesional.
"""
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm].valueInteger = 0
* ^extension[http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status].valueCode = #draft

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
  profesional 0..*

* entry[profesional]
  * ^short = "profesional"
  * resource MS
    * ^short = "Información sobre un profesional"
  * resource only MINSALPrestadorProfesional or MINSALPractitionerAdministrativo
  
