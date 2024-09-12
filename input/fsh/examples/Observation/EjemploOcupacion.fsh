Instance: EjemploOcupacion
InstanceOf: MINSALOcupacion
Usage: #example
Title: "Ocupación de un Paciente"
Description: "Ejemplo del trabajo que cumple como dato estadistico requerido al momento de realizar el ingreso a la atención."

* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* code = CSTipoObservacion#04 "Ocupación"
* subject = Reference(MinsalPacienteEjemplo)
* effectivePeriod
  * start = "2021-03-08"

* valueCodeableConcept = CSOcupacionesDet#2147	"Ingenieros biomédicos"