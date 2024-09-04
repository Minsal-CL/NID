Profile: MINSALOcupacion
Parent: ObservacionCL
Id: MINSALOcupacion
Title: "MINSAL Ocupación"
Description: "MINSAL Ocupación"


* status MS
* category MS
  * coding 1..1 MS
    * code 1..1 MS
    * system 0..1 MS
    * display 1..1 MS
  * coding = http://terminology.hl7.org/CodeSystem/observation-category#social-history

* code MS
* code from VSTipoObservacion
  * coding 1..1 MS
  * coding = CSTipoObservacion#04 "Ocupación"

* subject only Reference(MINSALPaciente)

* effectivePeriod 0..1 MS
  * start 1..1 MS
  * end 1..1 MS

* valueCodeableConcept 1..1 MS
  * coding from VSOcupacionesDet
  * coding 1..1 MS
    * code 1..1 MS
    * system 1..1 MS
    * display 0..1 MS
