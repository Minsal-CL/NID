Instance: ParametroSalidaIhe-PIXm
InstanceOf: ParametrosSalidaPixmMpi
Usage: #example
Title: "Parametros de Salida para la operación $ihe-pix"
Description: "Ejemplo de un recurso Parameter que sirve de resultado de la busqueda de un paciente dentro del MPI con la operación [$ihe-pix](OperationDefinition-MPI.PIXm.pix.html)."

* parameter[targetIdentifier][0]
  * name = "targetIdentifier"
  * valueIdentifier
    * use = #official
    * system = "urn:oid:2.16.840.1.113883.2.22.0.2.102100.50.10"
    * value = "16182522-0"
* parameter[targetId][0]
  * name = "targetId"
  * valueReference = Reference(MinsalPacienteEjemplo)
* parameter[targetId][1]
  * name = "targetId"
  * valueReference = Reference(DuplicadoMPIPaciente)