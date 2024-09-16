//Extension: IdentidadDeGenero
//Id: IdentidadDeGenero
//Title: "Identidad De Genero"
//Description: "Identidad De Genero"
//
////* value[x] only CodeSystem
////* valueReference = Reference()
//* valueCodeableConcept ^short = "Identidad De Genero"
//* valueCodeableConcept from  VSIdentidadDeGenero

//Extension: SexoBiologico
//Id: SexoBiologico
//Title: "Sexo Biologico del paciente"
//Description: "Sexo Biologico del paciente"
//* value[x] only CodeableConcept
////* valueReference = Reference()
//* valueCodeableConcept ^short = "SexoBiologico"
//* valueCodeableConcept from http://hl7.org/fhir/ValueSet/administrative-gender


Extension: SituacionCalle
Id: SituacionCalle
Title: "Situacion Calle"
Description: "Situacion Calle"
Context: Address

//* value[x] only Boolean
//* valueReference = Reference()
* valueBoolean ^short = "Situacion Calle"

Extension: PueblosAfrodescendiente
Id: PueblosAfrodescendiente
Title: "Pueblos Afrodescendiente"
Description: "Pueblos Afrodescendiente"
Context: Patient

* value[x] only boolean
* url and valueBoolean MS
* valueBoolean 1..1
* valueBoolean ^short = "Pueblos Afrodescendiente"
* valueBoolean ^definition = "Pueblos Afrodescendiente"


/*
Extension: PueblosOriginariosPerteneciente
Id: PueblosOriginariosPerteneciente
Title: "Pueblos Originarios Perteneciente"
Description: "Pueblos Originarios Perteneciente"
Context: Patient

//* value[x] only Boolean
//* valueReference = Reference()
* valueBoolean ^short = "Pueblos Originarios Perteneciente"

Extension: PueblosOriginarios
Id: PueblosOriginarios
Title: "Pueblos Originarios"
Description: "Almacenar si el paciente pertenece a algun pueblo originario"
Context: Patient

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
*/

/*
Extension: OrigenDiscapacidad
Title: "Origen Discapacidad"
Description: "OrigenDiscapacidad"
* value[x] only CodeableConcept
* value[x] ^short = "Origen Discapacidad"
* url and value[x].coding and value[x] and value[x].coding.system and value[x].coding.display and value[x].coding.code MS
* value[x].coding.system 1..1
* value[x].coding.display 0..1
* value[x].coding.code 1..1
* value[x].coding.code from VSOrigenDiscapacidad (required)
* value[x].coding.system ^short = "URI del system para validar"
* value[x].coding.display ^short = "Nombre discapacidad"
* value[x].coding.code ^short = "Código discapacidad"
*/

Extension: Religion
Title: "Religión"
Description: "Religión"
Context: Patient
* value[x] only CodeableConcept
* value[x] from VSReligion (required)
* value[x] ^short = "Religión del paciente"
* url and value[x].coding and value[x] and value[x].coding.system and value[x].coding.display and value[x].coding.code MS
* value[x].coding.system 1..1
* value[x].coding.display 0..1
* value[x].coding.code 1..1
* value[x].coding.code 
* value[x].coding.system ^short = "URI del system para validar"
* value[x].coding.display ^short = "Nombre de la religión"
* value[x].coding.code ^short = "Nombre de la religión"

Extension:   PaisOrigenMPI
Id:          PaisOrigenMPI
Title:       "País de origen del paciente"
Description: "País de origen del paciente"
Context:     Patient
* value[x] only CodeableConcept
* value[x] from CodPais
* value[x] ^short = "Código de País"
* url 1..1 MS
* valueCodeableConcept.coding 1..1 MS
  * code 1..1 MS
  * system 0..1 MS
  * display 0..1 MS


// Extension: DirigenteVecinal 
// Id: DirigenteVecinal 
// Title: "Dirigente Vecinal"
// Description: "Dirigente Vecinal"
// Context: Coverage

// //* value[x] only Boolean
// //* valueReference = Reference()
// * valueBoolean ^short = "Dirigente Vecinal"


// Extension: Prilonco 
// Id: Prilonco 
// Title: "Prilonco"
// Description: "Prilonco"
// Context: Coverage

// //* value[x] only Boolean
// //* valueReference = Reference()
// * valueBoolean ^short = "Prilonco"


// Extension: Antuco
// Id: Antuco
// Title: "Antuco"
// Description: "Antuco"
// Context: Coverage

// //* value[x] only Boolean
// //* valueReference = Reference()
// * valueBoolean ^short = "Antuco"


// Extension: Prais
// Id: Prais
// Title: "PRAIS"
// Description: "Programa de Reparación Atención Integral"
// Context: Coverage

// //* value[x] only Boolean
// //* valueReference = Reference()
// * valueBoolean ^short = "PRAIS"

/********************************************************/
Extension: ValorDeLaClase
Id: ValorDeLaClase
Title: "Valor de la Clase"
Description: "Da el valor de class del Coverage, de manera codificada"
Context: Coverage.class.value

* value[x] 1..1
* value[x] ^short = "Valor de la Clase del Coverage"
* value[x] only Coding

/********************************************************/

Extension: Mencion
Id:   Mencion
Title:  "Mención profesional añadida al título profesional"
Description: "Mención profesional obtenida junto con el título, dato que se agrega en texto lible"
Context: Practitioner.qualification

* value[x] only string

/********************************************************/



/********************************************************/




/********************************************************/
