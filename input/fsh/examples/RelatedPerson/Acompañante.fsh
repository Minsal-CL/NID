Instance: EjemploAcompanate
InstanceOf: MINSALAcompanante
Usage: #example
Title: "Acompañante de un Paciente"
Description: "Padre de una paciente dentro del Maestro Paciente"

* patient = Reference(MinsalPacienteEjemplo)
* name
  * use = #official
  * family = "Castilla"
  * given[0] = "Pedro"
* period
  * start = "2024-01-23T16:30:00-03:00"
  * end = "2024-01-23T18:00:00-03:00"
* address = ClAddressNueva
* telecom
  * system = #phone
  * value = "+56987654321"
  * use = #mobile
* relationship = http://terminology.hl7.org/CodeSystem/v2-0131#C "Emergency Contact"