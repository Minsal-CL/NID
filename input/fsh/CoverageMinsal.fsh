Profile: MINSALCobertura
Parent: Coverage
Id: MINSALCobertura
Title: "MINSAL Cobertura de Salud del paciente"
Description: "Recurso para almacenar la cobertura del paciente"

//VScalificacionPrevisional

// * extension contains DirigenteVecinal  named DirigenteVecinal  1..1 MS
// * extension contains Prais named Prais 1..1 MS
// * extension contains Antuco named Antuco 1..1 MS
// * extension contains Prilonco named Prilonco 1..1 MS

* status 1..1 MS
  * ^short = "active | cancelled | draft | entered-in-error"
  * ^definition = "Estado del beneficiario del plan" 
* type 1..1 MS
  * ^short = "Tipo de segur. (FONASA, ISAPRE u Otros)"
* type from VSPrevision (required)
* beneficiary 1..1 MS
  * ^short = "Referencia al beneficiario del plan de salud"
* beneficiary only Reference(MINSALPaciente)
* policyHolder 1..1 MS
  * ^short = "Propietario de la póliza"
* policyHolder only Reference(MINSALPaciente)
* period 0..1 MS
  * ^short = "Desde cuando es beneficiario. En caso de finalizar el contrato debe incluirse el \"end\"."
* payor 1..1 MS
  * ^short = "Entidad que paga el seguro. (FONASA, Alguna Isapre u otros)"
* payor only Reference(OrganizacionCL)

* class MS
  * type from VSClasesDeCobertura (extensible)
  * value.extension contains ValorDeLaClase named valorClase 1..1 MS
* class ^slicing.discriminator[0].type = #value
* class ^slicing.discriminator[=].path = "type.coding"
* class ^slicing.rules = #open
* class ^slicing.description = "Permite diferenciar las clases, entre los planes de isapre, los tramos de FONASA, leyes previsionales y otras leyes de priorización"
* class ^slicing.ordered = false
* class contains 
      tramos 0..1 MS and 
      plan 0..1 MS and
      leyesPrev 0..* MS and
      leyesRep 0..* MS and
      leyesPrio 0..* MS

* class[tramos]
  * ^short = "Tramos de FONASA, este valor es obligatorio en caso de ser FONASA"
  * type
    * coding = CSClasesDeCobertura#1 "Tramos de FONASA"
  * value.extension[valorClase]
    * value[x] from VSTramosFONASA (required)
   
* class[plan]
  * ^short = "Nombre del plan de isapre"
  * type
    * coding = CSClasesDeCobertura#2 "Plan de ISAPRE"

* class[leyesPrev]
  * ^short = "Nombre de la ley previsional"
  * type
    * coding = CSClasesDeCobertura#3 "Otras Leyes Previsionales"
  * value.extension[valorClase]
    * value[x] from VSLeyPrevisionales (required)

* class[leyesRep]
  * ^short = "Nombre de la ley previsional"
  * type
    * coding = CSClasesDeCobertura#4 "Leyes de Reparación" 
  * value.extension[valorClase]
    * value[x] from VSLeyReparacion (required)
    
* class[leyesPrio]
  * ^short = "Nombre de la ley previsional"
  * type
    * coding = CSClasesDeCobertura#5 "Leyes de Priorización"
  * value.extension[valorClase]
    * value[x] from VSGrupoMarcas (required)

/*
Invariant: cov-cls-typ-01
Description: "En caso de no existir el codigo debe completar el texto con el nombre del plan de la isapre"
Expression: "coding.exists() or text.exists()"
Severity: #error
*/
/********************************************************/

CodeSystem: CSClasesDeCobertura
Id: CSClasesDeCobertura
Title: "Clase de Cobertura de Salud"
Description: "Permitira definir los distintos tipos de clases requeridos para la cobertura. Los tramos de FONASA, Planes de Isapre, Otras leyes previsionales, Leyes de priorización y de reparación."

* ^version = "0.1"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"
* ^caseSensitive = false
* ^experimental = true

* #1 "Tramos de FONASA"
* #2 "Plan de ISAPRE"
* #3 "Otras Leyes Previsionales"
* #4 "Leyes de Reparación" 
* #5 "Leyes de Priorización"

ValueSet: VSClasesDeCobertura
Id: VSClasesDeCobertura
Title: "Clase de Cobertura de Salud"
Description: "Permitira definir los distintos tipos de clases requeridos para la cobertura. Los tramos de FONASA, Planes de Isapre, Otras leyes previsionales, Leyes de priorización y de reparación."

* ^version = "0.1"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"
* ^experimental = false

* codes from system CSClasesDeCobertura


// ValueSet: VSClasesDeCoberturaGeneral
// Id: VSClasesDeCoberturaGeneral
// Title: "Todas las Clase de Cobertura de Salud"
// Description: "Permitira definir los distintos tipos de clases requeridos para la cobertura. Incluido los de mismo estandar"

// * ^version = "0.1"
// * ^status = #active
// * ^date = "2023-01-15"
// * ^contact.name = "MINSAL CHILE"
// * ^contact.telecom.system = #email
// * ^contact.telecom.value = "minsal@minsal.cl"
// * ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"
// * ^experimental = false

// * codes from valueset VSClasesDeCobertura
// * http://terminology.hl7.org/CodeSystem/coverage-class#group
// * http://terminology.hl7.org/CodeSystem/coverage-class#plan

/********************************************************/

Extension: ValorDeLaClase
Id: ValorDeLaClase
Title: "Valor Del Class del Coverage"
Description: "Da el valor a la clase del Coverage, de manera codificada"
Context: Coverage.class.value

* value[x] 1..1
* value[x] ^short = "Valor de la Clase del Coverage"
* value[x] only CodeableConcept

/********************************************************/

CodeSystem:  CSLeyPrevisionales
Id: CSLeyPrevisionales
Title: "Leyes Previsionales"
Description: "Código asociados a Leyes Previsonales que modifican o eximen los montos de copagos de las prestaciones específica, señaladas en la ley respectiva"

* ^version = "0.1"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"
* ^experimental = true 
* ^caseSensitive = true


* #1 "Ley Nº18.490: Accidentes de Transporte"
* #2 "Ley Nº 16.744: Accidentes del Trabajo y Enfermedades Profesionales"
* #3 "Ley Nº 16.744: Accidente Escolar"
* #4 "Ley Nº 19.650/99 de Urgencia"
* #6 "Ley Nº 19.966 Régimen General de Garantías en Salud GES" 
* #7 "Ley Nº20.850 Ricarte Soto"
* #8 "Ley N° 21.030 de Despenalización de la Interrupción Voluntaria del Embarazo en Tres Causales."
* #96 "Ninguna"
* #97 "No recuerda"


ValueSet:  VSLeyPrevisionales
Id: VSLeyPrevisionales
Title: "Leyes Previsionales"
Description: "Código asociados a Leyes Previsonales que modifican o eximen los montos de copagos de las prestaciones específica, señaladas en la ley respectiva"

* ^version = "0.1"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"
* ^experimental = true 

* codes from system  CSLeyPrevisionales

/********************************************************/

CodeSystem:  CSLeyReparacion
Id: CSLeyReparacion
Title: "Leyes Reparación"
Description: "Código asociados a Leyes de Reparación que modifican o eximen los montos de copagos de las prestaciones específica, señaladas en la ley respectiva"

* ^version = "0.1"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"
* ^experimental = true 

* ^caseSensitive = true

* #1 "Antuco"
* #2 "Prilonco"
* #3 "Dirigente Vecinal"
* #4 "Prais"

ValueSet:  VSLeyReparacion
Id: VSLeyReparacion
Title: "Leyes Reparación"
Description: "Código asociados a Leyes de Reparación que modifican o eximen los montos de copagos de las prestaciones específica, señaladas en la ley respectiva"


* ^version = "0.1"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"
* ^experimental = true 

* codes from system  CSLeyReparacion

/********************************************************/
