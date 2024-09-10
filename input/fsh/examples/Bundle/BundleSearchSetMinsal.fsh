Instance: EjemploBusqueda
InstanceOf: BundleSearchMPI
Usage: #example
Title: "Ejemplo de una Busqueda"
Description: "Ejemplo del resultado de una busqueda de paciente según los parametros de run, nacimiento y nombre"

* type = #searchset
* total = 1
* link 
  * relation = #self
  * url  = "https://interoperabilidad.minsal.cl/fhir/ig/nid/Patient?identifier=15335473-1&birthdate=1981-11-10&name=andres%20martinez"
* entry
  * fullUrl = "https://interoperabilidad.minsal.cl/fhir/ig/nid/Patient/AC1696435881599"
  * resource = AC1696435881599
  * search
    * mode = #match

Instance: AC1696435881599
InstanceOf: MINSALPaciente
Usage: #inline

* extension[IdentidadDeGenero] = identidadGeneroPacBus1
* extension[SexoBiologico] = SexoBiologicoPacBus1
* extension[nacionalidad] = PaisDireccionPacBus1
* extension[PaisOrigen] = PaisOrigenMPIPacBus1
* extension[Religion] = ReligionPacBus1
* extension[PueblosAfrodescendiente] = PueblosAfrodescendientePacBus1
* extension[PueblosOriginarios] = PueblosOriginariosPacBus1

* identifier[0]
  * use = #official
  * type
    * extension[paisEmisionDocumento] = PaisEmisionPacBus1
    * coding = CSTipoIdentificador#01 "RUN"
  * value = "12216373-3"

* active = true

* name[NombreOficial]
  * use = #official
  * family = "Martinez"
  * family.extension[segundoApellido] = segundoApellidoPacBus1
  * given = "Andres"

* telecom[0]
  * system = #phone
  * value = "+5694332547"
  * use = #mobile

* gender = #male

* birthDate = "1981-11-10"

* address =  ClAddressPacBus1

* deceasedBoolean = false

* maritalStatus = CSEstadoCivil#01 "Soltero(a)"

Instance: identidadGeneroPacBus1
InstanceOf: IdentidadDeGenero
Usage: #inline

*  valueCodeableConcept = CSIdentidaddeGenero#1 "Masculino"

Instance: SexoBiologicoPacBus1
InstanceOf: SexoBiologico
Usage: #inline

*  valueCodeableConcept 
  * coding = http://hl7.org/fhir/administrative-gender#male "male"
  * text = "Masculino"

Instance: PaisDireccionPacBus1
InstanceOf: PaisDireccion
Usage: #inline

*  valueCodeableConcept = CSCodPaises#152 "Chile"

Instance: PaisOrigenMPIPacBus1
InstanceOf: PaisOrigenMPI
Usage: #inline

*  valueCodeableConcept = CSCodPaises#032 "Argentina"


Instance: ReligionPacBus1
InstanceOf: Religion
Usage: #inline

*  valueCodeableConcept = CSReligion#9 "Ninguna, ateo, agnóstico"

Instance: PueblosAfrodescendientePacBus1
InstanceOf: PueblosAfrodescendiente
Usage: #inline

* valueBoolean = false

Instance: PueblosOriginariosPacBus1
InstanceOf: PueblosOriginarios
Usage: #inline

* extension[pertenece].valueBoolean = false

Instance: PaisEmisionPacBus1
InstanceOf: PaisDireccion
Usage: #inline

*  valueCodeableConcept = CSCodPaises#152 "Chile"

Instance: segundoApellidoPacBus1
InstanceOf: SegundoApellido
Usage: #inline

*  valueString = "rochefort"

Instance: SituacionCallePacBus1
InstanceOf: SituacionCalle
Usage: #inline

* valueBoolean = false 

Instance: ClAddressPacBus1
InstanceOf: ClAddress
Usage: #inline

* extension[SituacionCalle] = SituacionCallePacBus1
* use = #home
* line[0] = "Calle Los Cedros 1234, Casa 15"
* city.extension = ComunasClPacBus1
* district.extension = ProvinciasClPacBus1
* state.extension = RegionesClPacBus1
* country.extension = CodigoPaisesPacBus1

Instance: ComunasClPacBus1
InstanceOf: ComunasCl
Usage: #inline

* valueCodeableConcept = CSCodComunasCL#13110 "La Florida"

Instance: ProvinciasClPacBus1
InstanceOf: ProvinciasCl
Usage: #inline

* valueCodeableConcept = CSCodProvinciasCL#131 "Santiago"

Instance: RegionesClPacBus1
InstanceOf: RegionesCl
Usage: #inline

* valueCodeableConcept = CSCodRegionCL#13 "Metropolitana de Santiago"

Instance: CodigoPaisesPacBus1
InstanceOf: CodigoPaises
Usage: #inline

* valueCodeableConcept = CSCodPaises#152 "Chile"


