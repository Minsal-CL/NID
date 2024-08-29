### Versión 0.3.0

Se generan las dependencias a las guías [PIXm](https://profiles.ihe.net/ITI/PIXm/index.html) y [PDQm](https://profiles.ihe.net/ITI/PDQm/).

Se crea el CapabilityStatement del Servidor:
  - [Administrador del Indice Maestro Paciente](CapabilityStatement-MPI-IHE-PIXm-PDQm-Manager.html)

Se crean los CapabilityStatement de Cliente: 
  - [Indice Maestro Paciente: "Cliente Buscador de Datos Demográficos (PDQm)"](CapabilityStatement-MPI.IHE.PDQm.Search.Cliente.html)
  - [Indice Maestro Paciente: "Cliente Buscador PIXm"](CapabilityStatement-MPI.IHE.PIXm.Buscador.html)
  - [Indice Maestro Paciente: "Cliente de Origen PIXm"](CapabilityStatement-MPI.IHE.PIXm.Origen.html)
  - [Indice Maestro Paciente: "Cliente Buscador de Datos Demográficos (PDQm) con implementación de Match"](CapabilityStatement-MPI.IHE.PDQm.Search.Cliente.Match.html)

Se define la operación [$ihe-pix](OperationDefinition-MPI.PIXm.pix.html) para está guía.
Se define la operación [$match](OperationDefinition-MPI.PDQm.match.html) para está guía.

Se crean los parametros de la operación **$ihe-pix**:
  * [MINSAL Parametros Entrada PIXm](StructureDefinition-ParametrosSalidaPixmMpi.html)
  * [MINSAL Parametros Salida PIXm](StructureDefinition-ParametrosSalidaPixmMpi.html)

Se crean los parametros y perfiles para la operación **$match**:
  * [MINSAL Parametros Entrada $match PDQM](StructureDefinition-ParametrosEntradaPDQmMpi.html)
  * [MINSAL Paciente Busqueda](StructureDefinition-MINSALPacienteBusqueda.html)
  * [MINSAL Bundle Resultado Operación $match](StructureDefinition-BundleSearchMPIMatch.html)

Se crea perfil [MINSAL Bundle Resultado Consulta](StructureDefinition-BundleSearchMPI.html) para los resultados de busquedas mediante consultas. 

Perfil [MINSAL Cobertura](StructureDefinition-MINSALCobertura.html):
  * Se cambia la referencia de **Organization** al perfil de la core **OrganizacionCL**

Perfil [MINSAL Agrupacion por marcas](StructureDefinition-MINSALAgrupacionPorMarcas.html)
  * Se depreca el MS al characteristic
  * Se da MS al Code y obligatoriedad para definir el tipo de Agrupación.

Perfil [MINSAL Nivel Educacional](StructureDefinition-MINSALNivelEducacional.html)
  * Se agrega dependencia al ObservacionCL de la Core de HL7
  * Se crea el CS y VS para diferenciar los componentes
  * Se agrega la categoría de social-history
  * Se agrega el code como tipo de obsercación y obliga a Nivel Educacional

Perfil [MINSAL Ocupación](StructureDefinition-MINSALOcupacion.html)
  * Se agrega dependencia al ObservacionCL de la Core de HL7
  * Se agrega la categoría de social-history
  * Se agrega el code como tipo de obsercación y obliga a Ocupación

Perfil [MINSAL Situacion Discapacidad](StructureDefinition-MINSALSituacionDiscapacidad.html)
  * Se agrega dependencia al ObservacionCL de la Core de HL7
  * Se agrega la categoría de social-history
  * Se agrega el code como tipo de obsercación y obliga a Situación de Discapacidad
  * Se crea invariante para obligar el uso de los componenetes en caso de ser Verdadero

Perfil [MINSAL Acompañante](StructureDefinition-MINSALAcompanante.html)
  * Se crea invariante para obligar el uso de un dato given o family o text en caso de utilizar el dato name
  
Perfil [MINSAL Paciente](StructureDefinition-MINSALPaciente.html):
  * Se convalida Paciente LE con MINSAL Paciente
  * Se crea el parametro de busqueda de [SegundoApellido](SearchParameter-mpi-paciente-segundoApellido.html)
  * Se incluye el dato Link por recomendación de la guía PIXm

Se combinan los extensiones **Pueblos Originarios** y **Pueblo Originarios Pertenecientes** en la extensión compleja [Pueblos Originarios](StructureDefinition-PueblosOriginarios.html)
 
### Versión 0.2.0
Primera versión publicada de la guía MPI.