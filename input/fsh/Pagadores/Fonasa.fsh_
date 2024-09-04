Instance: FONASA
InstanceOf: OrganizacionCL
Usage: #definition
Title: "FONASA"
Description: "Información del Fondo Nacional de Salud"

* identifier
  * value = "61603000-0"
* name = "Fondo Nacional De Salud"
* alias = "FONASA"
* telecom
  * system = #phone
  * value = "600 360 3000"
* address = CLAddressFonasa
* contact
  * purpose
    * text = "Representante Legal"
  * name
    * family = "Ayala"
    * family.extension = SegundoApellidoFonasa
    * given[0] = "Oscar"
    * given[1] = "Andres"

Instance: CLAddressFonasa
InstanceOf: ClAddress
Usage: #inline

* line[0] = "MONJITAS 665"
* city = "Santiago"
* city.extension = ComunasClFonasa
* district = "Santiago"
* district.extension = ProvinciasClFonasa
* state = "Metropolitana de Santiago"
* state.extension = RegionesClFonasa
* country = "Chile"
* country.extension = CodigoPaisesFonasa

Instance: ComunasClFonasa
InstanceOf: ComunasCl
Usage: #inline

* valueCodeableConcept = CSCodComunasCL#13101 "Santiago Centro"

Instance: ProvinciasClFonasa
InstanceOf: ProvinciasCl
Usage: #inline

* valueCodeableConcept = CSCodProvinciasCL#131 "Santiago"

Instance: RegionesClFonasa
InstanceOf: RegionesCl
Usage: #inline

* valueCodeableConcept = CSCodRegionCL#13 "Metropolitana de Santiago"

Instance: CodigoPaisesFonasa
InstanceOf: CodigoPaises
Usage: #inline

* valueCodeableConcept = CSCodPaises#152 "Chile"

Instance: SegundoApellidoFonasa
InstanceOf: SegundoApellido
Usage: #inline

* valueString = "Vasquez"