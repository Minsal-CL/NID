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

* obeys cov-cls-01 and cov-cls-02

* status 1..1 MS
  * ^short = "active | cancelled | draft | entered-in-error"
  * ^definition = "Estado del beneficiario del plan" 
* type 1..1 MS
  * ^short = "Tipo de seguro. (FONASA, ISAPRE u Otros)"
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
* class ^slicing.discriminator[0].type = #value
* class ^slicing.discriminator[=].path = "type"
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
  * type from VSClasesDeCobertura (extensible)
  * type = CSClasesDeCobertura#1 "Tramos de FONASA"
  * value.extension 1..1
  * value.extension contains ValorDeLaClase named valorClase 1..1 MS
  * value.extension[valorClase]
    * value[x] from VSTramosFONASA (required)
   
* class[plan]
  * ^short = "Nombre del plan de isapre"
  * type from VSClasesDeCobertura (extensible)
  * type = CSClasesDeCobertura#2 "Plan de ISAPRE"
  * value MS
  * value ^short = "Nombre del plan de isapre."

* class[leyesPrev]
  * ^short = "Nombre de la ley previsional"
  * type from VSClasesDeCobertura (extensible)
  * type = CSClasesDeCobertura#3 "Otras Leyes Previsionales"
  * value.extension 1..1
  * value.extension contains ValorDeLaClase named valorClase 1..1 MS
  * value.extension[valorClase]
    * value[x] from VSLeyPrevisionales (required)

* class[leyesRep]
  * ^short = "Nombre de la ley previsional"
  * type from VSClasesDeCobertura (extensible)
  * type = CSClasesDeCobertura#4 "Leyes de Reparación"
  * value.extension 1..1
  * value.extension contains ValorDeLaClase named valorClase 1..1 MS
  * value.extension[valorClase]
    * value[x] from VSLeyReparacion (required)
    
* class[leyesPrio]
  * ^short = "Nombre de la ley previsional"
  * type from VSClasesDeCobertura (extensible)
  * type = CSClasesDeCobertura#5 "Leyes de Priorización"
  * value.extension 1..1
  * value.extension contains ValorDeLaClase named valorClase 1..1 MS
  * value.extension[valorClase]
    * value[x] from VSGrupoMarcas (required)


Invariant: cov-cls-01
Description: "En caso de que el coverga.type es FONASA entonces debe inlcuir el Tramo de FONASA"
Expression: "type.coding.where(code = 1).exists() implies class.type.coding.where(code = 1).exists()"
Severity: #error

Invariant: cov-cls-02
Description: "En caso de que el coverga.type es ISAPRE entonces debe inlcuir el Plan de ISAPRE"
Expression: "type.coding.where(code = 2).exists() implies class.type.coding.where(code = 2).exists()"
Severity: #error