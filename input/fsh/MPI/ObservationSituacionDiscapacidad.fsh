Profile: MINSALSituacionDiscapacidad
Parent: ObservacionCL
Id: MINSALSituacionDiscapacidad
Title: "MINSAL Situacion Discapacidad"
Description: "Describe de manera simplificada la situacion de discapacidad de un paciente."

/*
* extension contains OrigenDiscapacidad named OrigenDiscapacidad 1..1 MS
* valueCodeableConcept 1..1 MS
  * coding from VSValoracionDesempeno
  * coding 1..1 MS
    * code 1..1 MS
    * system 1..1 MS
    * display 0..1 MS
*/
* obeys mpi-obs-dis-01

* status MS
* category MS
  * coding 1..1 MS
  * coding = http://terminology.hl7.org/CodeSystem/observation-category#social-history

* code MS
* code from VSTipoObservacion
  * coding 1..1 MS
  * coding = CSTipoObservacion#03 "Situacion Discapacidad"

* value[x] only boolean
  * ^short = "Define si tiene o no Discapacidad"
* valueBoolean 1..1 MS

* subject only Reference(MINSALPaciente)

* component 0..2 MS
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #closed
* component ^slicing.ordered = true
* component ^slicing.description = "Slice para diferenciar ultimo curso aprobado de ultimo nivel aprobado"
* component contains
   OrigenDiscapacidad 0..1 MS and
   ValoracionDiscapacidad 0..1 MS

* component[OrigenDiscapacidad]
  * ^short = "Define el origen de la discapacidad"
  * code MS
  * code = CSComponenteDiscapacidad#01 "Origen de la discapacidad"
  * code from VSComponenteDiscapacidad
  * value[x] only CodeableConcept
  * valueCodeableConcept 1..1 MS
    * coding 1..1 MS
      * code 1..1 MS
      * system 1..1 MS
      * display 0..1 MS
  * valueCodeableConcept from VSOrigenDiscapacidad

* component[ValoracionDiscapacidad]
  * ^short = "Define la valoracion del desempeño en la discapacidad"
  * code MS
  * code = CSComponenteDiscapacidad#02 "Evaluación Valoración de Desempeño en Comunidad (IVADEC-DIF)"
  * code from VSComponenteDiscapacidad
  * value[x] only CodeableConcept
  * valueCodeableConcept 1..1 MS
    * coding 1..1 MS
      * code 1..1 MS
      * system 1..1 MS
      * display 0..1 MS
  * valueCodeableConcept from VSValoracionDesempeno

Invariant: mpi-obs-dis-01
Description: "Si valueBoolean es verdadero entonces component[ValoracionDiscapacidad] y component[OrigenDiscapacidad] deben existir"
Expression: "value.ofType(boolean).where(true) implies component[0].exists() and component[1].exists()" 
Severity: #error