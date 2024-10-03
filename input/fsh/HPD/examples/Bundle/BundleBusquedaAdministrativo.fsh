Instance:    EjemploBusquedaAdm
InstanceOf:  BundleSearchProfHPD
Usage:       #example
Title:       "Ejemplo de una Búsqueda de Prestador Administrativo"
Description: "Ejemplo del resultado de una búsqueda de administrativo según los parametros de run, nacimiento y nombre"

* type = #searchset
* total = 1
* link 
  * relation = #self
  * url  = "https://interoperabilidad.minsal.cl/fhir/ig/nid/Practitioner?_profile=StructureDefinition/MINSALPractitionerAdministrativo&identifier=90000000-6&birthdate=1980-01-01&given=Caludio&family=Parra"
* entry[profesional]
  * fullUrl = Canonical(EjemploPractiAdmin)
  * resource = EjemploPractiAdmin
  * search
    * mode = #match
