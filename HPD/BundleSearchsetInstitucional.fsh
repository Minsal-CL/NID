Profile:     BundleSearchINSHPD
Parent:      Bundle
Id:          BundleSearchINSHPD
Title:       "MINSAL Bundle Resultado Consulta: Prestadores Institucinales"
Description: "Bundle resultado de una busqueda de un recurso \"Organization\" mediante parametros"

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
  organizacion 0..* MS

* entry[organizacion]
  * ^short = "Prestador Institucional"
  * resource MS
    * ^short = "Información sobre una organización que entrega servicios de cuidados de salud"
  * resource only MINSALPrestadorOrganizacional
  
