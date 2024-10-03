Instance: EjemploPacienteBusqueda
InstanceOf: MINSALPacienteBusqueda
Usage: #example
Title: "Ejemplo de Paciente para Busqueda"
Description: "Este un ejemplo del recurso \"MINSAL Paciente Busqueda\", el cual es útilizado para buscar pacientes dentro del MPI utilizando la operación [$match](OperationDefinition-MPI.PDQm.match.html)."

* identifier[0]
  * use = #official
  * type
    * coding = CSTipoIdentificador#01 "RUN"
  * value = "12216373-3"

* active = true

* name[NombreOficial]
  * use = #official
  * family = "Martinez"
  * given = "Andres"

* telecom[0]
  * system = #phone
  * value = "+5694332547"

* gender = #male

* birthDate = "1981-11-10"

