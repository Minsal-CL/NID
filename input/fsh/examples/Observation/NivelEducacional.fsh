Instance: EjemploNivelEducacional
InstanceOf: MINSALNivelEducacional
Usage: #example
Title: "Nivel Educacional de un Paciente"
Description: "Nivel Educacional de un Paciente registrado como dato estadistico en un recinto de salud, requerido en el ingreso de él en el sistema."

* status = #final
* category = http://terminology.hl7.org/CodeSystem/observation-category#social-history
* code = CSTipoObservacion#01 "Nivel Educacional"
* subject = Reference(MinsalPacienteEjemplo)
* effectivePeriod
  * start = "2021-03-08"
  
* component[UltimoCursoAprobado]
  * code = CSNivelEducacionalDesc#01 "Último curso aprobado"
  * valueInteger = 7

* component[UltimoNivelAprobado]
  * code = CSNivelEducacionalDesc#02 "Último nivel aprobado"
  * valueCodeableConcept = CSUNivelAprob#5 "Educación Superior"