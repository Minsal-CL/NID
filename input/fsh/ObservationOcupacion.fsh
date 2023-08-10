Profile: Ocupacion
Parent: Observation
Id: Ocupacion
Title: "Ocupación"
Description: "Ocupación"


* status MS
* category MS
* category from VSTipoObservacion
  * coding 1..1 MS
    * code 1..1 MS
    * code = #04
    * system 0..1 MS
    * display 1..1 MS
    * display = #Ocupación

* effectivePeriod 0..1 MS
  * start 1..1 MS
  * end 1..1 MS

* valueCodeableConcept 1..1 MS
  * coding from VSOcupacionesDet
  * coding 1..1 MS
    * code 1..1 MS
    * system 1..1 MS
    * display 0..1 MS
