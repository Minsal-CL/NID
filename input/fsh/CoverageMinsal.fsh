// This is a simple example of a FSH file.
// This file can be renamed, and additional FSH files can be added.
// SUSHI will look for definitions in any file using the .fsh ending.
Profile: MINSALCobertura
Parent: Coverage
Id: MINSALCobertura
Title: "MINSAL Cobertura de Salud del paciente"
Description: "Recurso para almacenar la cobertura del paciente"



//VScalificacionPrevisional

* extension contains DirigenteVecinal  named DirigenteVecinal  1..1 MS
* extension contains Prais named Prais 1..1 MS
* extension contains Antuco named Antuco 1..1 MS
* extension contains Prilonco named Prilonco 1..1 MS

* beneficiary 1..1 MS
* beneficiary only Reference(MINSALPaciente)
* policyHolder 1..1 MS
* policyHolder only Reference(MINSALPaciente)
* period 0..1 MS
* status 1..1 MS
* payor 1..1 MS
* payor only Reference(Organization)
* class 1..1 MS
  * type 1..1 MS
  * type from VSPrevision
    * coding 1..1 MS
      * code 1..1 MS
      * display 1..1 MS
      * system 1..1 MS
* class.value 1..1 MS