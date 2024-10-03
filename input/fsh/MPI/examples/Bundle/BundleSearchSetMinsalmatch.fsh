Instance: EjemploBusquedaMatch
InstanceOf: BundleSearchMPIMatch
Usage: #example
Title: "Ejemplo de una Busqueda Match"
Description: "Ejemplo del resultado de una busqueda de paciente según el parametro de busqueda de una operación [$match](OperationDefinition-MPI.PDQm.match.html)."

* type = #searchset
* total = 1
* link 
  * relation = #self
  * url  = "https://interoperabilidad.minsal.cl/fhir/ig/nid/Patient/$match"
* entry[paciente]
  * fullUrl = "https://interoperabilidad.minsal.cl/fhir/ig/nid/Patient/AC1696435881599"
  * resource = AC1696435881599
  * search
    * extension[matchgrade] = matchgradesearch1
    * mode = #match
    * score = 0.7

Instance: matchgradesearch1
InstanceOf: matchgrade
Usage: #inline

* valueCode = #probable
