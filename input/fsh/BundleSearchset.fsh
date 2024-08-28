Profile:     BundleSearchMPI
Parent:      Bundle
Id:          BundleSearchMPI
Title:       "MINSAL Bundle Busqueda"
Description: "Bundle resultado de una busqueda de un recurso paciente"

* type 1..1 MS
  * ^short = "Tipo de Bundle, para el caso de uso es un \"searchset\""
* type = #searchset

* total 1..1 MS
  * ^short = "Numero total de resultados"

* link 0..* MS
  * ^short = "Enlace de los resultados"
  * relation 1..1 MS
    * ^short = "Tipo de relación con la consulta"
  * url 1..1 MS
    * ^short = "Consulta de realizada"
    
* entry MS
  * ^short = "Entrada de los resultados de la busqueda"
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "resource"
  * ^slicing.rules = #closed
  * ^slicing.description = "Diferenciación de los resultados de la busqueda"
  * ^slicing.ordered = false
  * request 0..0
  * response 0..0
* entry contains
  paciente 0..* and 
  operationOutcome 0..*
* entry[paciente]
  * fullUrl MS
    * ^short = "Uri del recurso"
  * resource MS
    * ^short = "Información sobre un individuo que reciva servicio de cuidados de salud"
  * resource only MINSALPaciente
  * search 1..1 MS
    * extension contains matchgrade named matchgrade 1..1 MS
    * extension[matchgrade]
      * ^short = "Grado de coincidencia de la consulta"
      //* ^binding.description = "Una evaluación del Índice Maestro de Pacientes (MPI) sobre si un registro de paciente candidato es una coincidencia o no."
    * mode 1..1 MS
      * ^short = "match | include | outcome - \"por qué\" esta en el set de resultado"
    * mode = #match
    * score 1..1 MS
      * ^short = "Puntaje de la coincidencia (entre 0 y 1)"
* entry[operationOutcome]
  * fullUrl MS
    * ^short = "Uri del recurso"
  * resource MS
    * ^short = "Información sobre el resultado de una operación en caso de no encontrar coincidencia"
  * resource only OperationOutcome
