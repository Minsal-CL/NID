Profile: MINSALNivelEducacional
Parent: ObservacionCL
Id: MINSALNivelEducacional
Title: "MINSAL Nivel Educacional"
Description: "Nivel Educacional como dato estadistico para el ingreso de un paciente en el sistema."


* status MS
* category MS
* category MS
  * coding 1..1 MS
    * code 1..1 MS
    * system 0..1 MS
    * display 0..1 MS
  * coding = http://terminology.hl7.org/CodeSystem/observation-category#social-history

* code MS
* code from VSTipoObservacion
  * coding 1..1 MS
  * coding = CSTipoObservacion#01 "Nivel Educacional"

* subject only Reference(MINSALPaciente)

* component 2..2 MS
* component ^short = "Información sobre el último nivel y curso aprobado"
* component ^definition = "Información sobre el último nivel y curso aprobado"
* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #closed
* component ^slicing.ordered = true
* component ^slicing.description = "Slice para diferenciar ultimo curso aprobado de ultimo nivel aprobado"
* component contains UltimoCursoAprobado 1..1 MS and UltimoNivelAprobado 1..1 MS

* component[UltimoCursoAprobado] 
  * ^short = "Último curso aprobado"
  * ^definition = "Último curso aprobado"
  * code MS
  * code = CSNivelEducacionalDesc#01 "Último curso aprobado"
  * code from VSNivelEducacionalDesc
  * value[x] only integer
  * valueInteger 1..1 MS

* component[UltimoNivelAprobado] 
  * ^short = "Último nivel aprobado"
  * ^definition = "Último nivel aprobado"
  * code MS
  * code = CSNivelEducacionalDesc#02 "Último nivel aprobado"
  * code from VSNivelEducacionalDesc
  * valueCodeableConcept 1..1 MS
    * coding 1..1 MS
      * code 1..1 MS
      * system 1..1 MS
  * value[x] only CodeableConcept
  * valueCodeableConcept from VSUNivelAprob






