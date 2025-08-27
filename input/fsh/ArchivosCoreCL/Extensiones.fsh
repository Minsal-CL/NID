Alias: $nacionality = http://hl7.org/fhir/StructureDefinition/patient-nationality

/*Por problemas en más de un servidor las extensiones deben utilizar el recurso base en los contextos*/
Extension: IdentidadDeGenero
Id: IdentidadDeGenero
Title: "Identidad De Género"
Description: "Identidad De Género"
Context: Patient, Practitioner
* ^experimental = true

* value[x] only CodeableConcept
* valueCodeableConcept ^short = "Identidad De Género"
* valueCodeableConcept from  VSIdentidaddeGenero (preferred)

Extension: SexoBiologico
Id: SexoBiologico
Title: "Sexo Biologico del paciente"
Description: "Sexo Biologico del paciente"
Context: Patient, Practitioner

* ^experimental = true

* value[x] only CodeableConcept
* valueCodeableConcept ^short = "SexoBiologico"
* valueCodeableConcept from VSSexoListadoDeis (preferred)

* valueCodeableConcept ^binding.extension.extension[0].url = "key"
* valueCodeableConcept ^binding.extension.extension[=].valueId = "FHIRGender"
* valueCodeableConcept ^binding.extension.extension[+].url = "purpose"
* valueCodeableConcept ^binding.extension.extension[=].valueCode = #candidate
* valueCodeableConcept ^binding.extension.extension[+].url = "valueSet"
* valueCodeableConcept ^binding.extension.extension[=].valueCanonical = "http://hl7.org/fhir/ValueSet/administrative-gender"
* valueCodeableConcept ^binding.extension.extension[+].url = "documentation"
* valueCodeableConcept ^binding.extension.extension[=].valueMarkdown = "Una vinculación adicional alternativa al código \"Sexo Biológico\" de FHIR, mantenida para compatibilidad retroactiva."
* valueCodeableConcept ^binding.extension.url = "http://hl7.org/fhir/tools/StructureDefinition/additional-binding"

Extension:   Nacionalidad
Parent:      $nacionality
Id:          Nacionalidad
Title:       "Código de Nacionalidad"
Description: "Esta extensión incluye códigos de nacionalidades de los pacientes"
Context: Patient
* extension[code] MS
  * ^short = "Código de la Nacionalidad"
  * value[x] only CodeableConcept
  * value[x] ^short = "Código de la Nacionalidad"
  * valueCodeableConcept from VSCodigosPaisesNID (example)

* extension[period] 
  * ^short = "Período de vigencia de la nacionalidad"
  * value[x] only Period
  * value[x] ^short = "Período de vigencia de la nacionalidad"
  

Extension:   PaisDireccion
Id:          CodigoPaises
Title:       "Código de Países"
Description: "Esta extensión incluye códigos de países"
Context: DomainResource, Extension, Address.country, CodeableConcept, Identifier.type
* value[x] only CodeableConcept
* value[x] ^short = "Código del País"
//* url 1..1 MS
* valueCodeableConcept from VSCodigosPaisesNID (preferred)
* valueCodeableConcept.coding 0..1 MS
  * code 0..1 MS
  * system 0..1 MS
  * display 0..1 MS

//* valueCodeableConcept.coding.system from CodPaises (extensible)

/* 		Extension 		*/
/*	Comunas Chile	*/
Extension:   ComunasCl
Id:          ComunasCl
Title:       "Códigos para Comunas en Chile"
Description: "Esta extensión que permite codificar las Comunas en Chile en el campo de Dirección"
Context: Address.city
* value[x] only CodeableConcept
* value[x] ^short = "Código de Comunas"
* url 1..1 MS
* valueCodeableConcept from VSCodigosComunaCL
* valueCodeableConcept.coding 1..1 MS
  * code 1..1 MS
  * system 0..1 MS
  * display 0..1 MS


/* 		Extension 		*/
/*	Provincias Chile	*/
Extension:   ProvinciasCl
Id:          ProvinciasCl
Title:       "Códigos para Provincias en Chile"
Description: "Esta extensión que permite codificar las Provincias en Chile en el campo de Dirección"
Context: Address.district
* value[x] only CodeableConcept
* value[x] ^short = "Código de Provincias"
* url 1..1 MS
* valueCodeableConcept from VSCodigosProvinciasCL
* valueCodeableConcept.coding 1..1 MS
  * code 1..1 MS
  * system 0..1 MS
  * display 0..1 MS
//* valueCodeableConcept.coding.system  from CSCodProvinciasCL (extensible)

/* 		Extension 		*/
/*	Regiones Chile	*/
Extension:   RegionesCl
Id:          RegionesCl
Title:       "Códigos para Regiones en Chile"
Description: "Esta extensión que permite codificar las Regiones en Chile en el campo de Dirección"
Context: Address.state
* value[x] only CodeableConcept
* value[x] ^short = "Código de Provincias"
* url 1..1 MS
* valueCodeableConcept from VSCodigosRegionesCL
* valueCodeableConcept.coding 1..1 MS
  * code 1..1 MS
  * code 
  * system 0..1 MS
  * display 0..1 MS
//* valueCodeableConcept.coding.system  from CSCodRegionCL (required)

Extension:   IdentificacionContactoCl
Id:          IdContacto
Title:       "Identificación del Contacto de un Paciente"
Description: "Identificación de contacto de paciente en especial para casos en los cuales este actúa como Tutor Legal"
Context: Patient.contact
* extension contains
	tutId 1..* MS and
	docProc 0..1 MS
* url MS

//* extension[tutId].url = "tutId"
* extension[tutId] ^short = "Identificación del Tutor"
* extension[tutId] ^definition = "Identificación del Tutor"
* extension[tutId] 1..1 MS
* extension[tutId].url MS
* extension[tutId].value[x] only Identifier
* extension[tutId].valueIdentifier 1..1 MS
* extension[tutId].valueIdentifier.type 1..1 MS

* extension[tutId].valueIdentifier.system 0..1 MS
* extension[tutId].valueIdentifier.value 1..1 MS

//* extension[docProc].url = "docProc"
* extension[docProc] ^short = "País de procedencia del documento"
* extension[docProc].value[x] only CodeableConcept
* extension[docProc].url MS
* extension[docProc].valueCodeableConcept from VSCodigosPaisesNID (preferred)
* extension[docProc].valueCodeableConcept 1..1 MS
* extension[docProc].valueCodeableConcept.coding 1..1 MS


Extension: SegundoApellido
Id: SegundoApellido
Title: "Segundo Apellido"
Description: "Segundo Apellido"
Context: HumanName.family
* value[x] only string
* valueString ^short = "Segundo apellido de la persona"
