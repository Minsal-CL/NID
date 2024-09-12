Instance: ParametroEntradaIhe-PDQm
InstanceOf: ParametrosEntradaPDQmMpi
Usage: #example
Title: "Parametros de entrada para la operación $match"
Description: "Ejemplo de un recurso Parameter que sirve para realizar la busqueda de un paciente dentro del MPI con la operación [$match](OperationDefinition-MPI.PDQm.match.html)."

* parameter[resource]
  * name = "resource"
  * resource = EjemploPacienteBusqueda
    * text
      * status = #generated
      * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><p class=\"res-header-id\"><b>Generated Narrative: Patient EjemploPaciente</b></p><a name=\"EjemploPaciente\"> </a><a name=\"hcEjemploPaciente\"> </a><a name=\"EjemploPaciente-es-CL\"> </a><p style=\"border: 1px #661aff solid; background-color: #e6e6ff; padding: 10px;\">Andres Martinez (official) Male, DoB: 1981-11-10 ( RUN: 12216373-3\u00a0(use:\u00a0official,\u00a0))</p><hr/><table class=\"grid\"><tr><td style=\"background-color: #f3f5da\" title=\"Record is active\">Active:</td><td colspan=\"3\">true</td></tr><tr><td style=\"background-color: #f3f5da\" title=\"Ways to contact the Patient\">Contact Detail</td><td colspan=\"3\"><a href=\"tel:+5694332547\">+5694332547</a></td></tr></table></div>"
* parameter[onlyCertainMatches]
  * name = "onlyCertainMatches"
  * valueBoolean = false
* parameter[count]
  * name = "count"
  * valueInteger = 1