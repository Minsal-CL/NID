Instance: mpi-paciente-segundoApellido
InstanceOf: SearchParameter
Usage: #definition
Title: "Busqueda Paciente por Segundo Apellido"
Description: "Regresa los pacientes que cumplan con el criterio de segundo apellido."
* status = #active
* date = "2023-04-06"
* code = #segundoApellido
* name = "paciente_segundo_apellido"
* base = #Patient
* type = #string
* expression = "Patient.name.family.extension.where(url='https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/SegundoApellido').value"
* xpathUsage = #normal
* multipleOr = true
* multipleAnd = true
* modifier[0] = #exact
* modifier[=].extension
  * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
  * valueCode = #MAY