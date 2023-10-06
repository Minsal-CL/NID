### Casos de Uso

El alcance de esta guía de implementación aborda 1 escenario general, que es el siguiente':'

 a. Consultar y disponibilizar la información de prestadores:

|ID de caso de uso|Nombre del caso de uso|Descripción del caso de uso|
|-----------------|----------------------|---------------------------|
|CU01|Consultar prestador|Consulta del sistema de información al maestro, si existe el prestador.|
|CU02|Responder resultado|El maestro envía respuesta al sistema de información consultante, si existe o no el prestador.|
|CU03|Responder resultado valido|El maestro envía respuesta de que existe el prestador consultado al sistema de información, enviando los datos disponibles del prestador.|
|CU04|Responder resultado negativo|El maestro envía respuesta de que no existe el prestador consultado al sistema de información.|
{:.grid}

#### Actores

* Consultador: sistema de información de salud o registro clínico electrónico implementado en un establecimiento de salud, que requiera consultar la información de prestadores individuales y/o institucionales.

* Disponibilizador: maestro de prestadores que disponibilizan la información de la superintendencia de salud en el caso del maestro de prestadores individuales.
