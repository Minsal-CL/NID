Instance: EjemploSituacionDiscapacidad
InstanceOf: MINSALSituacionDiscapacidad
Usage: #example
Title: "Situacion Discapacidad de un Paciente"
Description: "Describe de manera simplificada la situacion de discapacidad de un paciente. En este caso una visual"

* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* code = CSTipoObservacion#03 "Situacion Discapacidad"
* subject = Reference(MinsalPacienteEjemplo)
* effectivePeriod
  * start = "2018-07-15"

* valueBoolean = true

* component[OrigenDiscapacidad]
  * code = CSComponenteDiscapacidad#01 "Origen de la discapacidad"
  * valueCodeableConcept = CSOrigenDiscapacidad#2 "Origen sensorial visual"

* component[ValoracionDiscapacidad]
  * code = CSComponenteDiscapacidad#02 "Evaluación Valoración de Desempeño en Comunidad (IVADEC-DIF)"
  * valueCodeableConcept = CSValoracionDesempeno#2 "Discapacidad leve"