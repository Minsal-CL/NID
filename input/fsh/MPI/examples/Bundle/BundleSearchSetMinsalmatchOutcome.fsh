Instance: EjemploBusquedaMatchOutcomeOperation
InstanceOf: BundleSearchMPIMatch
Usage: #example
Title: "Ejemplo de una Busqueda Match con OperationOutcome"
Description: "Ejemplo del resultado de una busqueda de paciente según el parametro de busqueda de una operación [$match](OperationDefinition-MPI.PDQm.match.html), el cual entrego un OperationOutcome por timeout."

* type = #searchset
* link 
  * relation = #self
  * url  = "https://interoperabilidad.minsal.cl/fhir/ig/nid/Patient/$match"
* entry[operationOutcome]
  * fullUrl = "https://interoperabilidad.minsal.cl/fhir/ig/nid/OperationOutcome/OperationOutcomeFalloMatch"
  * resource = OperationOutcomeFalloMatch
  * search
    * mode = #outcome

Instance:   OperationOutcomeFalloMatch
InstanceOf: OperationOutcome
Usage:      #inline

* issue
  * severity = #error
  * code = #timeout
  * details
    * text = "La búsqueda ha expirado debido a un timeout en el servidor."


