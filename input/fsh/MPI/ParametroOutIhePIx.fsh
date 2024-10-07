Profile:     ParametrosSalidaPixmMpi
Parent:      PIXmQueryParametersOut
Id:          ParametrosSalidaPixmMpi
Title:       "MINSAL Parámetros Salida PIXm"
Description: "Estos son los parámetros de Salida para el [$ihe-pix](OperationDefinition-MPI.PIXm.pix.html) del PIXm"


* parameter[targetId] 0..* MS
  * ^short = "Url del recurso paciente"
  * name 1..1 MS
    * ^short = "Nombre para la definición"
  * valueReference 1..1 MS
    * ^short = "Referencia del recurso paciente encontrado"
* parameter[targetIdentifier] 0..* MS
  * ^short = "Identificador encontrados."
  * name 1..1 MS
    * ^short = "Nombre para la definición"
  * valueIdentifier 1..1 MS
    * ^short = "Identificador del paciente encontrado"
    * system 1..1 MS
      * ^short = "Sistema de identificador"
    * value 1..1 MS
      * ^short = "Valor del identificador"

