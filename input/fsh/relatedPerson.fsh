Profile: MINSALAcompanante
Parent: RelatedPerson
Id: MINSALAcompanante
Title: "MINSAL Acompañante"
Description: "Información sobre una persona que participa en la atención a un paciente, pero que no es el destinatario de la asistencia sanitaria ni tiene una responsabilidad formal en el proceso asistencial."

//* patient.identifier 1..1 MS
* patient only Reference(MINSALPaciente)
* patient 1..1 MS

* name obeys mpi-rela-1
* name 1..1 MS
* telecom 1..1 MS
* period 1..1 MS
* address 1..1 MS
* relationship 1..1 MS

Invariant: mpi-rela-1
Description: "RelatedPerson.name.given, RelatedPerson.name.family o RelatedPerson.name.text DEBEN estar presentes"
Severity: #error
Expression: "family.exists() or given.exists() or text.exists()"