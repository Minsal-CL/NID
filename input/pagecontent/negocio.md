### Diagrama de proceso
A continuación se presenta el diagrama relacionado con el proceso MPI

<div align="center" >
  <img  style="border: 1px solid; color: black;" src="DiagramaFlujoMPI.PNG" width="500" height="650"> 
  <p>Visión Resumen de un Perfil</p>
</div>

### Casos de Uso

El alcance de esta guía de implementación aborda 1 escenario general, que es el siguiente:

 a. Consultar y disponibilizar la información de prestadores:

|ID de caso de uso|Nombre del caso de uso|Descripción del caso de uso|
|-----------------|----------------------|---------------------------|
|CU01|Consulta Identidad Paciente|Consulta del sistema de información al maestro, si existe el paciente.|
|CU02|Responder resultado|El maestro envía respuesta al sistema de información consultante, si existe o no el paciente.|
|CU03|Actualización de paciente|Cuando el paciente exista, el sistema de información de salud o registro clínico electrónico actualizará la información en el Índice Maestro de Paciente.|
|CU04|Creación de pacientes|Cuando el paciente no exista, el sistema de información de salud o registro clínico electrónico lo creará en el Índice Maestro de Pacientes|
|CU05|Fusión pacientes|Cuando existan dos perfiles del mismo paciente, se fusionaron en un mismo registro.|
{:.grid}

#### Actores

* Consultador: Sistema de información de salud o registro clínico electrónico implementado en un establecimiento de salud u organización, que requiera consultar la información de pacientes.
* Actualizador: Sistema de información de salud o registro clínico electrónico implementado en un establecimiento de salud u organización, que indexa o actualiza la información de pacientes.
* Disponibilizador: Sistema informático que carga la información de identificación de pacientes a partir de fuentes de confianza y la gestión del Maestro Índice de pacientes, identifica y disponibiliza a los sistemas de información de salud o registros clínicos electrónicos
* Fusionador: sistema de información de salud o registro clínico electrónico implementado en un establecimiento de salud u organización, o persona a través de una interfaz, que requiera fusionar registros de pacientes cuando correspondan a la misma persona.
