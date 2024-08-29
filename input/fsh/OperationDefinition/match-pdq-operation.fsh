Instance: MPI.PDQm.match
InstanceOf: OperationDefinition
Title: "MPI PDQm $Match"
Description: """
Operación compatible con la operación [$match](http://hl7.org/fhir/R4/patient-operation-match.html) del estandar y la del operación [$match](https://profiles.ihe.net/ITI/PDQm/OperationDefinition-PDQmMatch.html) del PDQm. Los únicos cambios son restringir los parámetros de entrada para usar el perfil de [Paciente MPI Busqueda](./StructureDefinition-MINSALPacienteBusqueda.html) para el perfil de Entrada de $match y restringir los parámetros de salida para usar el perfil de [Paciente MPI](./StructureDefinition-MINSALPaciente.html).

"""  
Usage: #definition

* extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-fmm"
* extension[=].valueInteger = 1
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
* extension[=].valueCode = #draft
* base = "http://hl7.org/fhir/OperationDefinition/Patient-match"
* name = "MPI_PDQM_Matches"
* status = #draft
* kind = #operation
* date = "2024-08-27"
* code = #match
* resource = #Patient
* system = false
* type = true
* instance = false
* inputProfile = Canonical(ParametrosEntradaPDQmMpi)
* outputProfile = Canonical(BundleSearchMPIMatch)
* parameter[0]
  * name = #resource
  * use = #in
  * min = 1
  * max = "1"
  * documentation = "Utiliza esto para proporcionar un conjunto completo de detalles del paciente con los que el MPI debe hacer coincidir (por ejemplo, enviar un registro de paciente a Patient/$match mediante POST)."
  * type = #Patient
* parameter[+]
  * name = #onlyCertainMatches
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "Si hay múltiples coincidencias potenciales, entonces **NO** se deberían devolver los resultados con esta bandera configurada en verdadero. Cuando es falso, el servidor **PUEDE** devolver múltiples resultados, con cada resultado calificado en consecuencia."
  * type = #boolean
* parameter[+]
  * name = #count
  * use = #in
  * min = 0
  * max = "1"
  * documentation = "El número máximo de registros a devolver. Si no se proporciona un valor, el servidor decide cuántas coincidencias devolver. Ten en cuenta que los clientes **DEBERÍAN** ser cuidadosos al usar esto, ya que **PUEDE** evitar que se devuelvan coincidencias probables y válidas."
  * type = #integer
* parameter[+]
  * name = #return
  * use = #out
  * min = 0
  * max = "*"
  * documentation = """Un bundle contiene un conjunto de registros de Paciente que representan posibles coincidencias; opcionalmente, **PUEDE** contener también un OperationOutcome con información adicional sobre los resultados de la búsqueda (como advertencias o mensajes informativos, como un conteo de registros que estaban cerca pero fueron eliminados). Si la operación no tuvo éxito, entonces **PUEDE** devolverse un OperationOutcome junto con un código de estado BadRequest (por ejemplo, problema de seguridad o propiedades insuficientes en el fragmento de paciente, verificar contra el perfil).

Nota: dado que este es el único parámetro de salida, es un recurso y tiene el nombre 'return'. El resultado de esta operación se devuelve directamente como un recurso.
"""
  * type = #Bundle
