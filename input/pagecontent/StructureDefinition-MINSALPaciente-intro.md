<!--
#### Uso de Extensiones:

Para realizar el cumplimiento de la norma 231, de estandares de información en salud y los datos mínimos de Paciente, se hace uso de las siguientes extensiones:
 
  - [Identidad DeGenero](https://hl7chile.cl/fhir/ig/clcore/1.9.4/StructureDefinition-IdentidadDeGenero.html)
  - [Sexo Biológico](https://hl7chile.cl/fhir/ig/clcore/1.9.4/StructureDefinition-SexoBiologico.html)
  - [Nacionalidad](https://hl7chile.cl/fhir/ig/clcore/1.9.4/StructureDefinition-CodigoPaises.html)
  - [Pais Origen](StructureDefinition-PaisOrigenMPI.html)
  - [Religión](StructureDefinition-Religion.html)
  - [Pueblos Afrodescendiente](StructureDefinition-PueblosAfrodescendiente.html)
  - [Pueblo Originarios](StructureDefinition-PueblosOriginariosMPI.html)

#### Estado Marital

Para cumplir con los perfile IHE de Paciente PDQm y PIXm, los cuales requiere el uso del ValueSet ["Marital Status"](http://hl7.org/fhir/ValueSet/marital-status) se generó el [Mapeo de estados civiles entre el ValueSet DEIS y el ValueSet MaritalStatus de FHIR](ConceptMap-MPIMaritalStatusMap.html) para que el dato MaritalStatus del paciente pueda incluir ambos códigos, tanto el solicitado por el DEIS, como por los perfiles IHE.

-->