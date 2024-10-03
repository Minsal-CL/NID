Profile:     ParametrosEntradaPixmMpi
Parent:      PIXmQueryParametersIn
Id:          ParametrosEntradaPixmMpi
Title:       "MINSAL Parametros Entrada PIXm"
Description: "Estos son los parametros de entrada para el [$ihe-pix](OperationDefinition-MPI.PIXm.pix.html) del PIXm"

* parameter[sourceIdentifier] 1..1 MS
  * ^short = "Identificador de busqueda, el cual será utilizado para realizar el cruse de referencia."
  * name 1..1 MS
    * ^short = "Nombre para la definición"
  * valueIdentifier 1..1 MS
    * ^short = "Identificador del paciente"
    * system 1..1 MS
      * ^short = "Sistema de identificador"
    * value 1..1 MS
      * ^short = "Valor del identificador"
* parameter[targetSystem] 0..* MS
  * ^short = "Sistema que asigna un identificador del cual se regresara el identificador que debe ser seleccionado"
  * name 1..1 MS
    * ^short = "Nombre para la definición"
  * valueUri 0..1 MS
    * ^short = "URI del valor"
    * value 1..1 MS
      * ^short = "Valor del URI"
