Profile: MINSALAgrupacionPorMarcas
Parent: Group
Id: MINSALAgrupacionPorMarcas
Title: "MINSAL Agrupación por marcas"
Description: "Agrupación por marcas"

* type MS
* type = #person

* actual = true
* actual MS

* code 1.. MS
  * ^short = "Define el tipo de grupo"
* code from VSGrupoMarcas

* member 1..* MS 
  * entity 1..1 MS
    * ^short = "Referencia a los pacientes miembros del grupo"
* member.entity only Reference(MINSALPaciente)

/*
* characteristic.code from VSGrupoMarcas
* characteristic 1..1 MS
  * code MS
    * coding 1..1 MS
      * display MS
      * system 1..1 MS
      * code 1..1 MS     
    * text MS
  * valueCodeableConcept MS
*/