Instance:    EjemploBusquedaOrg
InstanceOf:  BundleSearchINSHPD
Usage:       #example
Title:       "Ejemplo de una Búsqueda de Prestador Institucional"
Description: "Ejemplo del resultado de una búsqueda de una organización según los parametros de código deis y nombre"

* type = #searchset
* total = 1
* link 
  * relation = #self
  * url  = "https://interoperabilidad.minsal.cl/fhir/ig/nid/Organization?identifier=120101&name=Hospital"
* entry[organizacion]
  * fullUrl = Canonical(OrganizationLEEjemplo)
  * resource = OrganizationLEEjemplo
  * search
    * mode = #match