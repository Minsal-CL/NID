### Alcance

Esta guía de implementación aborda el proceso asociado a la identificación de un usuario en su interacción con el sistema de salud mediante las transacciones de información entre el sistema local y el índice maestro de Paciente (MPI). El MPI es una componente de la Arquitectura Nacional de Interoperabilidad que permite administrar y mantener la identidad en los registros de las personas que reciben servicios de salud dentro del territorio nacional de manera unívoca.

### Antecedentes

Es fundamental para cualquier prestador de salud  gestionar con precisión los datos clínicos de los pacientes, los que son recopilados de diversas fuentes. La identificación precisa de los pacientes es crucial. La presencia de registros demográficos duplicados en un sistema no solo crea ineficiencias, sino también genera riesgos en desmedro del cuidado de los pacientes.  costos innecesarios para la organización.

### Descripción

El MPI representa el pilar fundamental de la interoperabilidad en el ámbito de la salud. Facilita el intercambio seguro de datos de pacientes entre diversas organizaciones, sistemas y partes interesadas del sector sanitario. Sin una EMPI robusta, los esfuerzos por lograr la interoperabilidad pueden verse obstaculizados por incoherencias y errores en los datos.
La identificación precisa de los pacientes es esencial para garantizar su seguridad. La EMPI ayuda a prevenir errores en la medicación, diagnósticos equivocados y otros eventos adversos que pueden ocurrir cuando los proveedores de atención médica carecen de un historial completo y preciso del paciente.
Además, la EMPI reduce los costos administrativos al simplificar el proceso de registro de pacientes. Las organizaciones sanitarias pueden evitar la entrada de datos redundantes y mejorar la eficiencia en el intercambio de información.

### Objetivos de la Implementación de un Índice Maestro de Pacientes (Máster Patient Index - MPI)

#### General

* Generar un sistema seguro e interoperable de identificación unívoca de pacientes, para soportar la gestión (carga, consulta e identificación cruzada de duplicados) de la información de descripción de un paciente de manera fidedigna y de calidad.

#### Específicos

* Apoyar los esfuerzos de gobierno de datos garantizando que los datos de los pacientes sean coherentes y fiables. Esto es importante para cumplir con las regulaciones nacionales de privacidad de datos.
* Ayudar a prestar una atención centrada en el paciente al proporcionar a los profesionales sanitarios una visión completa y precisa del historial médico de un paciente, independientemente de dónde se hayan originado los datos.
* Reducir los registros duplicados y mejorar la precisión de los datos
* Ahorrar de costos para las organizaciones sanitarias y los aseguradores.

### Objetivos de esta Guía de Implementación

#### General

* Brindar las directrices para el desarrollo de sistema de información que garanticen la interoperabilidad con el Índice Maestro de Pacientes, según los estándares definidos por el Ministerio de Salud.

#### Específicos

* Otorgar las herramientas necesarias para el desarrollo de sistemas informáticos que interoperen con el Índice Maestro de Pacientes, en base al estándar HL7 FHIR.

* Describir los distintos perfiles de usuario de los procesos asociados al Índice Maestro de Pacientes y los recursos asociados a cada uno.

* Ejemplificar los distintos casos de uso asociados al Índice Maestro de Pacientes
