Instance:    EjemploPractiProf
InstanceOf:  MINSALPrestadorProfesional
Usage:       #example
Title:       "Profesional de Salud de Ejemplo"
Description: "Ejemplo de un profesional que entrega servicios de salud"

*  identifier[run]
  * use = #official
  * type.coding = https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador#01 "RUN"
  * type.text = "Rol Único Nacional"
  * value = "19949350-7"
  * assigner.display = "Republica de Chile"

* identifier[rnpi]
  * use = #secondary
  * type.coding = https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador#13 "RNPI"
  * type.text = "Registro Nacional de Prestadores Individuales"
  * value = "1234543"
  * assigner.display = "Intendencia de prestadores individuales - Superintendencia de Salud"

* active = true

* name[0]
  * prefix[0] = "Dra"
  * given[0] = "María"
  * family = "Gonzalez"
  * family.extension[segundoApellido] = SegundoApellidoPractitionerProfesionalEjemplo

* gender = #female
* birthDate = "1991-04-01"

* qualification[TituloProfesional]
  * identifier.value = "cert"
  * code
    * coding = CSTituloProfesional#1 "MÉDICO CIRUJANO"
    * text = "MÉDICO CIRUJANO"
  * period.start = "2007-11-01"
  * issuer.display = "Universidad de Chile"

* qualification[EspecialidadMedica]
  * identifier.value = "esp"
  * code
    * coding = CSEspecialidadMed#30 "MEDICINA INTERNA"
    * text = "MEDICINA INTERNA"
  * period.start = "2010-11-01"
  * issuer.display = "Pontificia Universidad Católica de Chile"

* qualification[Subespecialidad]
  * extension = MencionExample
  * identifier.value = "subesp"
  * code
    * coding = CSEspecialidadMed#23  "HEMATOLOGÍA"
    * text = "HEMATOLOGÍA"
  * period.start = "2014-11-01"
  * issuer.display = "Universidad de Valparaíso"

Instance: MencionExample
InstanceOf: Mencion
Usage: #Inline

* valueString = "Linfoma"

Instance: SegundoApellidoPractitionerProfesionalEjemplo
InstanceOf: SegundoApellido
Usage: #Inline

* valueString = "Gutierrez"
