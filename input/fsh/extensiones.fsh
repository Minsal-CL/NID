Extension: IdentidadDeGenero
Id: IdentidadDeGenero
Title: "Identidad De Genero"
Description: "Identidad De Genero"

//* value[x] only CodeSystem
//* valueReference = Reference()
* valueCodeableConcept ^short = "Identidad De Genero"


Extension: SexoBiologico
Id: SexoBiologico
Title: "SexoBiologico"
Description: "SexoBiologico"
* value[x] only CodeableConcept
//* valueReference = Reference()
* valueCodeableConcept ^short = "SexoBiologico"

Extension: SituacionCalle
Id: SituacionCalle
Title: "SituacionCalle"
Description: "SituacionCalle"

//* value[x] only Boolean
//* valueReference = Reference()
* valueBoolean ^short = "SituacionCalle"

Extension: PueblosAfrochilenoAfrodescendientePerteneciente
Id: PueblosAfrochilenoAfrodescendientePerteneciente
Title: "PueblosAfrochilenoAfrodescendientePerteneciente"
Description: "PueblosAfrochilenoAfrodescendientePerteneciente"

//* value[x] only Boolean
//* valueReference = Reference()
* valueBoolean ^short = "PueblosAfrochilenoAfrodescendientePerteneciente"

Extension: PueblosOriginariosPerteneciente
Id: PueblosOriginariosPerteneciente
Title: "PueblosOriginariosPerteneciente"
Description: "PueblosOriginariosPerteneciente"

//* value[x] only Boolean
//* valueReference = Reference()
* valueBoolean ^short = "PueblosOriginariosPerteneciente"

Extension: PueblosOriginarios
Title: "Pueblos Originarios"
Description: "Almacenar si el paciente pertenece a algun pueblo originario"
* value[x] only CodeableConcept
* value[x] ^short = "Código Pueblo Originario"
* url and value[x].coding and value[x] and value[x].coding.system and value[x].coding.display and value[x].coding.code MS
* value[x].coding.system 1..1
* value[x].coding.display 1..1
* value[x].coding.code 1..1
* value[x].coding.code from PueblosOriginariosVS (required)
* value[x].coding.system ^short = "URI del system para validar"
* value[x].coding.display ^short = "Nombre del pueblo"
* value[x].coding.code ^short = "Código del pueblo"