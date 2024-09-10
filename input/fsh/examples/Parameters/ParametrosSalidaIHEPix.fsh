Instance: ParametroSalidaIhe-PIXm
InstanceOf: PIXmQueryParametersOut
Usage: #example
Title: "Parametros de Salida para la operación $ihe-pix"
Description: "Ejemplo de un recurso Parameter que sirve de resultado de la busqueda de un paciente según un identificador en distintos sistemas dentro del MPI"

* parameter[targetIdentifier][0]
  * name = "targetIdentifier"
  * valueIdentifier
    * use = #official
    * system = "urn:oid:1.3.6.1.4.1.21367.13.20.3000"
    * value = "IHEBLUE-994"
* parameter[targetIdentifier][1]
  * name = "targetIdentifier"
  * valueIdentifier
    * use = #official
    * system = "urn:oid:1.3.6.1.4.1.21367.13.20.2000"
    * value = "IHEGREEN-994"
* parameter[targetId][0]
  * name = "targetId"
  * valueReference
    * reference = "Patient/Patient-MohrAlice-Blue"
* parameter[targetId][1]
  * name = "targetId"
  * valueReference
    * reference = "Patient/Patient-MohrAlice-Green"