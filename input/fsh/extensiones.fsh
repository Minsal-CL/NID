Extension: IdentidadDeGenero
Id: IdentidadDeGenero
Title: "Identidad De Genero"
Description: "Identidad De Genero"

//* value[x] only CodeSystem
//* valueReference = Reference()
* valueCodeableConcept ^short = "Identidad De Genero"


Extension: SexoBiologico
Id: SexoBiologico
Title: "Sexo Biologico del paciente"
Description: "Sexo Biologico del paciente"
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

Extension: PueblosAfrodescendiente
Id: PueblosAfrodescendiente
Title: "PueblosAfrodescendiente"
Description: "PueblosAfrodescendiente"
* value[x] only boolean
* url and valueBoolean MS
* valueBoolean 1..1
* valueBoolean ^short = "PueblosAfrodescendiente"
* valueBoolean ^definition = "PueblosAfrodescendiente"

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
* value[x].coding.display 0..1
* value[x].coding.code 1..1
* value[x].coding.code from PueblosOriginariosVS (required)
* value[x].coding.system ^short = "URI del system para validar"
* value[x].coding.display ^short = "Nombre del pueblo"
* value[x].coding.code ^short = "Código del pueblo"
* value[x].text 0..1 MS
* value[x].text ^short = "Otro pueblo originario"

Extension: Religion
Title: "Religión"
Description: "Religión"
* value[x] only CodeableConcept
* value[x] ^short = "Religión del paciente"
* url and value[x].coding and value[x] and value[x].coding.system and value[x].coding.display and value[x].coding.code MS
* value[x].coding.system 1..1
* value[x].coding.display 0..1
* value[x].coding.code 1..1
* value[x].coding.code from VSReligion (required)
* value[x].coding.system ^short = "URI del system para validar"
* value[x].coding.display ^short = "Nombre de la religión"
* value[x].coding.code ^short = "Nombre de la religión"



Extension:   PaisOrigenMPI
Id:          PaisOrigenMPI
Title:       "País de origen del paciente"
Description: "País de origen del paciente"
* value[x] only CodeableConcept
* value[x] ^short = "Código de País"
* url 1..1 MS
* valueCodeableConcept.coding 1..1 MS
  * code 1..1 MS
  * code from CodPais
  * system 0..1 MS
  * display 0..1 MS


Extension: DirigenteVecinal 
Id: DirigenteVecinal 
Title: "Dirigente Vecinal"
Description: "Dirigente Vecinal"

//* value[x] only Boolean
//* valueReference = Reference()
* valueBoolean ^short = "Dirigente Vecinal"


Extension: Prilonco 
Id: Prilonco 
Title: "Prilonco"
Description: "Prilonco"

//* value[x] only Boolean
//* valueReference = Reference()
* valueBoolean ^short = "Prilonco"


Extension: Antuco
Id: Antuco
Title: "Antuco"
Description: "Antuco"

//* value[x] only Boolean
//* valueReference = Reference()
* valueBoolean ^short = "Antuco"


Extension: Prais
Id: Prais
Title: "PRAIS"
Description: "PRAIS"

//* value[x] only Boolean
//* valueReference = Reference()
* valueBoolean ^short = "PRAIS"