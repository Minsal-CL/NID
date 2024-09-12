Instance: AgrupacionMarcas
InstanceOf: MINSALAgrupacionPorMarcas
Usage: #example
Title: "Agrupacion Marcas"
Description: "Agrupación de pacientes que están con la condición de TEA"

* type = #person
* actual = true
* code = CSGrupoMarcas#03 "TEA"
* member
  * entity = Reference(MinsalPacienteEjemplo)