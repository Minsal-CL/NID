Instance:    EjemploBusquedaProf
InstanceOf:  BundleSearchProfHPD
Usage:       #example
Title:       "Ejemplo de una Búsqueda de Prestador Profesional"
Description: "Ejemplo del resultado de una búsqueda de profesional según los parametros de run, nacimiento y nombre"

* type = #searchset
* total = 1
* link 
  * relation = #self
  * url  = "https://interoperabilidad.minsal.cl/fhir/ig/nid/Practitioner?_profile=StructureDefinition/MINSALPrestadorProfesional&identifier=19949350-7&birthdate=1991-04-01&given=María&family=Gonzalez"
* entry[profesional]
  * fullUrl = Canonical(EjemploPractiProf)
  * resource = EjemploPractiProf
  * search
    * mode = #match