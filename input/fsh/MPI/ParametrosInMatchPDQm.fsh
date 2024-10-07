Profile:     ParametrosEntradaPDQmMpi
Parent:      Parameters
Id:          ParametrosEntradaPDQmMpi
Title:       "MINSAL Parámetros Entrada $match PDQM"
Description: "Estos son los parámetros de entrada para la operación [$match](OperationDefinition-MPI.PDQm.match.html) del PDQm"

* implicitRules 0..0
* parameter.modifierExtension 0..0
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.rules = #closed
* parameter ^slicing.description = "Definición de cada Parámetro de entrada para la operación $match del PDQm"
* parameter ^slicing.ordered = true
* parameter ^short = "Parámetro de Operación"

* parameter contains 
  resource 1..1 and
  onlyCertainMatches 0..1 and
  count 0..1

* parameter[resource]
  * name 1..1
    * ^short = "Nombre para la definición"
  * name = "resource"
  * value[x] 0..0
  * resource 1..1 
  * resource only MINSALPacienteBusqueda
    * ^short = "Informcación sobre el individuo que cumple que recibe servicios de salud"
  * part 0..0

* parameter[onlyCertainMatches]
  * name 1..1
    * ^short = "Nombre para la definición"
  * name = "onlyCertainMatches"
  * value[x] 1..1 
  * value[x] only boolean
    * ^short = "Si el parámetro es un tipo de dato"

* parameter[count]
  * name 1..1
    * ^short = "Nombre para la definición"
  * name = "count"
  * value[x] 1..1
    * ^short = "Si el parámetro es un tipo de dato"
  * value[x] only integer
