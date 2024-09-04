Extension: PueblosOriginarios
Id: PueblosOriginarios
Title: "Pueblos Originarios"
Description: "Extensión para describir si el paciente pertenece algún pueblo originario"
Context: Patient

* obeys mpi-PueblosOriginarios

* extension contains pertenece 1..1 and perteneciente 0..1

* extension[pertenece]
  * ^short = "Pregunta de si pertenece o no a un pueblo originario"
  * value[x] 1..1
  * value[x] only boolean

* extension[perteneciente]
  * ^short = "Define al Pueblo Originario perteneciente"
  * value[x] 1..1
  * value[x] only CodeableConcept
  * value[x] from PueblosOriginariosVS (required)

Invariant:   mpi-PueblosOriginarios
Description: "Si pertenece a un pueblo originario debe especificar, cúal"
Expression:  "extension.where(url = 'pertenece' and value.ofType(boolean).where(true)).exists() implies extension.where(url = 'perteneciente').exists()"
Severity:    #error
