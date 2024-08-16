### Versión 0.2.2
Se crea el CapabilityStatement del Servidor:
 - [Administrador del Indice Maestro Paciente](CapabilityStatement-MPI-IHE-PIXm-PDQm-Manager.html)

Se crean los CapabilityStatement de Cliente: 
  - [Indice Maestro Paciente Buscador de Datos Demográficos (PDQm)](CapabilityStatement-MPI.IHE.PDQm.Search.Cliente.html)
  - [Indice Maestro Paciente para Cliente Buscador PIXm](CapabilityStatement-MPI.IHE.PIXm.Buscador.html)
  - [Indice Maestro Paciente para Cliente de Origen PIXm](CapabilityStatement-MPI.IHE.PIXm.Origen.html)

Se define la operación [$ihe-pix](OperationDefinition-MPI.PIXm.pix.html) para está guía.

Se crean los parametros de la operación **$ihe-pix**:
  * [MINSAL Parametros Entrada PIXm](StructureDefinition-ParametrosSalidaPixmMpi.html)
  * [MINSAL Parametros Salida PIXm](StructureDefinition-ParametrosSalidaPixmMpi.html)

Perfil [MINSAL Cobertura](StructureDefinition-MINSALCobertura.html):
  * Se cambia la referencia de **Organization** al perfil de la core **OrganizacionCL**

Perfil [MINSAL Paciente](StructureDefinition-MINSALPaciente.html):
  * Se convalida Paciente LE con MINSAL Paciente
  * Se crea el parametro de busqueda de [SegundoApellido](SearchParameter-mpi-paciente-segundoApellido.html)
  * Se incluye el dato Link por recomendación de la guía PIXm

Se generan las dependencias a las guías [PIXm](https://profiles.ihe.net/ITI/PIXm/index.html) y [PDQm](https://profiles.ihe.net/ITI/PDQm/).


### Versión 0.2.0
Primera versión publicada de la guía MPI.