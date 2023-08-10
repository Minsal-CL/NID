// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Profile: CoberturaMinsalMPI
Parent: Coverage
Title: "Cobertura de Salud del paciente"
Description: "Recurso para almacenar la cobertura del paciente"



//VScalificacionPrevisional

* extension contains DirigenteVecinal  named DirigenteVecinal  1..1 MS
* extension contains Prais named Prais 1..1 MS
* extension contains Antuco named Antuco 1..1 MS
* extension contains Prilonco named Prilonco 1..1 MS

* beneficiary 1..1 MS
* beneficiary only Reference(PacienteMinsalMPI)
* policyHolder 1..1 MS
* policyHolder only Reference(PacienteMinsalMPI)
* period 0..1 MS
* status 1..1 MS
* payor 1..1 MS
* payor only Reference(Organization)
* class 1..1 MS
* class.type.coding 1..1 *
  * code 1..1 MS


* class.value = "Plan"