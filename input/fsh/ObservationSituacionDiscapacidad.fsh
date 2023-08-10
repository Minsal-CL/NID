Profile: SituacionDiscapacidad
Parent: Observation
Id: SituacionDiscapacidad
Title: "Situacion Discapacidad"
Description: "Situacion Discapacidad"

* extension contains OrigenDiscapacidad named OrigenDiscapacidad 1..1 MS


* status MS
* category MS
* category from VSTipoObservacion
  * coding 1..1 MS
    * code 1..1 MS
    * code = #03
    * system 0..1 MS
    * display 1..1 MS
    * display = #"Situacion Discapacidad"

* valueCodeableConcept 1..1 MS
  * coding from VSValoracionDesempeno
  * coding 1..1 MS
    * code 1..1 MS
    * system 1..1 MS
    * display 0..1 MS
