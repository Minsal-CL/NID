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
* class ^slicing.discriminator.type = #value
* class ^slicing.discriminator.path = "value"
* class ^slicing.rules = #open
* class ^slicing.description = "Permite diferenciar las clases, entre los planes y los tramos de FONASA"
* class ^slicing.ordered = false
* class contains 
        tramos 0..1 MS and 
        plan 0..1 

* class[tramos]
  * ^short = "Tramos de FONASA. Permite diferenciar los tramos de FONASA"
  * type 1..1 MS
    * ^short = "Tramo de FONASA al que pertenece el usuario"
  * type from VSTramosFONASA
    * coding 1..1 MS
      * code 1..1 MS
      * display 1..1 MS
      * system 1..1 MS
  * value 1..1 MS
  * value  = "Tramos de FONASA"

* class[plan]
  * ^short = "Nombre del Plan de la ISAPRE"
  * type 1..1 MS
    * obeys cov-cls-typ-01
    * ^short = "Nombre del plan de la isapre, en caso de no existir codificación puede utilizar el text. Para llenar este campo"
    * coding 0..1 MS 
      * code 1..1 MS
      * display 1..1 MS
      * system 1..1 MS
    * text 0..1 MS
  * value 1..1 MS
  * value = "Plan de Isapre"

Invariant: cov-cls-typ-01
Description: "En caso de no existir el codigo debe completar el texto con el nombre del plan de la isapre"
Expression: "coding.exists() or text.exists()"
Severity: #error



