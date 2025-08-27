Alias: TitProf = https://interoperabilidad.minsal.cl/fhir/ig/eis/ValueSet/VSTituloProfesional
Alias: EspMedVs = https://interoperabilidad.minsal.cl/fhir/ig/eis/ValueSet/VSEspecialidadMedica



Profile:        PrestadorCL2
Parent:         Practitioner
Id:             CorePrestadorCl
Title:          "CL Prestador"
Description:    "Este Perfil fue creado para cubrir la descripción de un Prestador a nivel Nacional"
* ^language = #es

* extension contains IdentidadDeGenero named IdentidadDeGenero 0..1 MS
* extension ^definition = "Extensión para almacenar la identidad de género de cada profesional"

* extension contains SexoBiologico named SexoBiologico 0..1 MS
* extension ^definition = "Extensión para almacenar el sexo biológico del profesional"

// * extension contains NacionalidadProfesional named NacionalidadProfesional 0..1 MS


* identifier  MS
* identifier ^short = "Identificación de los prestadores"
* identifier ^definition = "El identificador oficial para cada prestador en Chile es el Registro Nacional de Prestadores Institucionales (NRPI). Además, existe el identificador nacional chileno, el Registro Único Nacional (RUN). Y por último puede ingresar un número de pasaporte y un ID extra para cada prestador."

* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type.coding.code"
* identifier ^slicing.rules = #open
* identifier contains run 0..1 MS and rnpi 0..1 MS and pasaporte 0..1 MS and otro 0..1 MS
* identifier.type from VSTipoIdentificador (extensible)

* identifier[run]
  * use MS
  * system MS
  * value MS
* identifier[run] ^short = "Identificador destinado a almacenar el número de RUN" 
* identifier[run] ^definition = "Corresponde al identificador (RUN) otorgado el Registro Civil de Chile"
* identifier[run].system ^short = "endPoint que valida el RUN"
* identifier[run].system ^definition = "Define la url del endPoint a la cual apunta la API, para validar el RUN"
* identifier[run].system ^comment = "Se define el el endPoint al cual debe apuntar a la API, con el fin de validar que el número de RUN ingresado exista y que sea correcto. Por momento se usará la url = \"http://api_run/run\""
* identifier[run].value ^short = "Número de RUN"
* identifier[run].value ^definition = "Valor del RUN en la Cédula de Identidad entregada por el Registro Civil, en formato sin puntos y con guion para diferencia el dígito verificador"
//* identifier[run].system = "http://registrocivil.cl/run"
* identifier[run].type.coding.code = #1

* identifier[rnpi]
  * use MS
  * system MS
  * value MS
* identifier[rnpi] ^short = "Valor de RNPI" 
* identifier[rnpi] ^definition = "Valor de RNPI"
* identifier[rnpi].system ^short = "endPoint para validar los códigos"
* identifier[rnpi].system ^definition = "Define la url del endPoint a la cual apunta la API"
* identifier[rnpi].system ^comment = "Se define el endPoint al cual debe apuntar a la API"
* identifier[rnpi].value ^short = "Valor identificador"
* identifier[rnpi].value ^definition = "Valor identificador"
* identifier[rnpi].type.coding.code = #13

* identifier[pasaporte]
  * use MS
  * system MS
  * value MS
* identifier[pasaporte] ^short = "Valor de PASAPORTE" 
* identifier[pasaporte] ^definition = "Valor de PASAPORTE"
* identifier[pasaporte].system ^short = "endPoint para validar los códigos"
* identifier[pasaporte].system ^definition = "Define la url del endPoint a la cual apunta la API"
* identifier[pasaporte].system ^comment = "Se define el endPoint al cual debe apuntar a la API"
* identifier[pasaporte].value ^short = "Valor identificador"
* identifier[pasaporte].value ^definition = "Valor identificador"
* identifier[pasaporte].type.coding.code = #5

* identifier[otro]
  * use MS
  * system MS
  * value MS
* identifier[otro] ^short = "Para otros identificadores que el notificador estime conveniente" 
* identifier[otro] ^definition = "Para otros identificadores que el notificador estime conveniente"
* identifier[otro].system ^short = "endPoint para validar los códigos"
* identifier[otro].system ^definition = "Define la url del endPoint a la cual apunta la API"
* identifier[otro].system ^comment = "Se define el endPoint al cual debe apuntar a la API"
* identifier[otro].value ^short = "Valor identificador"
* identifier[otro].value ^definition = "Valor identificador"
* identifier[otro].type.coding.code = #14

* active MS
* name and name.use and name.family and name.given  MS 
* name.use ^short = "Uso del nombre del prestador"
* name.use ^definition = "Este es el uso que se le da al nombre del Prestador considerando que puede ser nombre oficial, temporal, seudónimo, entre otros, Pero por motivos legales este uso es Oficial "
* name.use = #official  
* name.family ^short = "Primer Apellido"
* name.family ^definition = "Se debe ingresar el primer apellido, según indica su identificacion personal"
* name.family.extension contains SegundoApellido named segundoApellido 0..1 MS
* name.family.extension ^short = "Extensión para el segundo apellido"
 
* telecom and gender and birthDate  MS
* telecom ^definition = "Contacto del prestador"
* telecom.system ^short = "Debe utilizar \"phone\" o \"email\"."
* telecom.system MS 

* telecom.use MS
* telecom.use ^short = "Uso del contacto descrito. Puede usar \"home | work | temp | old | mobile\""

* telecom.value MS

* gender 0..1
* gender ^short = "Sexo Registral (male | female | other | unknown (requerido))"
* gender ^definition = "Sexo de nacimiento registrado"

* birthDate 0..1
* birthDate ^short = "Fecha de nacimiento del Paciente. El formato debe ser YYYY-MM-DD"
* birthDate ^definition = "Fecha de nacimiento del Paciente. El formato debe ser YYYY-MM-DD (Ej: 1996-08-21)"

* address only Address or ClAddress2
* address MS

* qualification MS
* qualification ^short = "Certificados, títulos y/o Especialidad(es) obtenidas por el Prestador"
* qualification ^definition = "Certificados, títulos y/o especialidades que el Prestador pueda validar"

* qualification ^slicing.discriminator.type = #value
* qualification ^slicing.discriminator.path = "identifier.value"
* qualification ^slicing.rules = #open
* qualification ^slicing.description = "Debido a que los profesionales de la salud pueden tener título y ademas poseer especialidades, es que se ha realizado un slice, con el fin de poder diferenciarlos. El de Certificados tiene identifier.value el valor cert y el slice de especialidad el valor esp"


* qualification contains TituloProfesional 0..* MS and EspecialidadMedica 0..* MS and Subespecialidad 0..* MS
* qualification[TituloProfesional].code from TitProf (example)
* qualification[TituloProfesional] ^short = "Especificación de los Títulos o Certificados Profesionales que tiene el Prestador"
* qualification[TituloProfesional] ^definition = "Listado de Títulos o Certificados Profesionales que tiene el prestador. Solo se consideran aquellos que pueden ser demostrados en consulta a la casa de estudios pertinente"
* qualification[TituloProfesional].identifier MS
* qualification[TituloProfesional].identifier.value MS
* qualification[TituloProfesional].identifier.value = "cert"
* qualification[TituloProfesional].identifier.value ^short = "Valor del tipo de calificación, en este caso cert"
* qualification[TituloProfesional].identifier.value ^definition = "Valor del tipo de calificación, en este caso cert"
* qualification[TituloProfesional].code MS
  * coding MS
    * code MS
    * system MS
    * display MS
  * text MS

* qualification[TituloProfesional].code.text ^short = "Nombre del título entregado por la Super Intendencia de Salud"
* qualification[TituloProfesional].code.coding.system ^short = "El sistema sobre el cual se verificarán los títulos o certificados de los Prestadores"
* qualification[TituloProfesional].code.coding.system ^definition = "La url sobre la cual se encuentra el endPoint para el acceso a  los códigos de títulos y/o certificados de prestadores. El perfil especifica que se debe usar la siguiente url:  \"https://api.minsal.cl/v1/catalogos/profesiones/\""
* qualification[TituloProfesional].code.coding.display ^short = "Nombre del título o certificado agregado"
* qualification[TituloProfesional].code.coding.display ^definition = "Nombre del título o certificado agregado. Agregar un poco más de información acerca del item que se está agregando."
* qualification[TituloProfesional].code.coding.code ^short = "Nombre del título o certificado agregado"
* qualification[TituloProfesional].code.coding.code ^definition = "Nombre del título o certificado agregado. Agregar un poco más de información acerca del item que se está agregando."
* qualification[TituloProfesional].issuer MS
* qualification[TituloProfesional].issuer.display MS
* qualification[TituloProfesional].issuer ^short = "Organización que entrega el certificado o título"
* qualification[TituloProfesional].issuer.display ^short = "Nombre de la organización que entrega certificado o título"
* qualification[TituloProfesional].issuer.display ^definition = "Nombre de la organización que entrega el certificado o título válido para ejercer como prestdor. En este elemento solo se puede agregar texto libre"


//especialidades
* qualification[EspecialidadMedica] ^short = "Especificación de la o las  especialidades que posea el prestador"
* qualification[EspecialidadMedica] ^definition = "Listado de especialidades que posee el prestador. Solo se consideran aquellos que pueden ser demostrados en consulta a la casa de estudios pertinente"
* qualification[EspecialidadMedica].identifier MS
* qualification[EspecialidadMedica].identifier.value MS
* qualification[EspecialidadMedica].identifier.value = "esp"
* qualification[EspecialidadMedica].identifier.value ^short = "Valor del tipo de calificación, en este caso esp"
* qualification[EspecialidadMedica].identifier.value ^definition = "Valor del tipo de calificación, en este caso esp"
* qualification[EspecialidadMedica].code from https://interoperabilidad.minsal.cl/fhir/ig/eis/ValueSet/VSEspecialidadMedica (example)
* qualification[EspecialidadMedica].code MS
  * coding MS
    * code MS
    * system MS
    * display MS
  * text MS
* qualification[EspecialidadMedica].code.text ^short = "Nombre de la especialidad entregada por la Super Intendencia de Salud"
* qualification[EspecialidadMedica].code.coding.system MS
* qualification[EspecialidadMedica].code.coding.system ^short = "El sistema sobre el cual se verificarán las especialidades de los Prestadores"
* qualification[EspecialidadMedica].code.coding.system ^definition = "la url sobre la cual se encuentra el endPoint para el acceso a  los códigos de especialidades de prestadores. El perfil especifica  \"https://api.minsal.cl/v1/catalogos/tiposEspecialidadMedica/\""
* qualification[EspecialidadMedica].code.text ^short = "Texto libre de la especialidad del profesional"
* qualification[EspecialidadMedica].code.coding.display ^short = "Nombre de la especialidad"
* qualification[EspecialidadMedica].code.coding.display ^definition = "Nombre la especialidad agregada. Agregar un poco más de información acerca del item que se está agregando."
* qualification[EspecialidadMedica].issuer MS 
* qualification[EspecialidadMedica].issuer.display MS
* qualification[EspecialidadMedica].issuer ^short = "Organización que entrega el certificado o título"
* qualification[EspecialidadMedica].issuer.display ^short = "Nombre de la organización que entrega certificado o título"
* qualification[EspecialidadMedica].issuer.display ^definition = "Nombre de la organización que entrega el certificado o título válido para ejercer como prestdor. En este elemento solo se puede agregar texto libre"

//subespecialidades
* qualification[Subespecialidad] ^short = "Especificación de la o las subespecialidades que posea el prestador"
* qualification[Subespecialidad] ^definition = "Listado de subespecialidades que posee el prestador. Solo se consideran aquellos que pueden ser demostrados en consulta a la casa de estudios pertinente"
* qualification[Subespecialidad].identifier MS
* qualification[Subespecialidad].identifier.value MS
* qualification[Subespecialidad].identifier.value = "subesp"
* qualification[Subespecialidad].identifier.value ^short = "Valor del tipo de calificación, en este caso subesp"
* qualification[Subespecialidad].identifier.value ^definition = "Valor del tipo de calificación, en este caso subesp"
* qualification[Subespecialidad].code from https://interoperabilidad.minsal.cl/fhir/ig/eis/ValueSet/VSEspecialidadMedica (example)
* qualification[Subespecialidad].code MS
  * coding MS
    * code MS
    * system MS
    * display MS
  * text MS
* qualification[Subespecialidad].code.text ^short = "Nombre del título entregado por la Super Intendencia de Salud"
* qualification[Subespecialidad].code.coding.system ^short = "El sistema sobre el cual se verificarán las especialidades de los Prestadores"
* qualification[Subespecialidad].code.coding.system ^definition = "la url sobre la cual se encuentra el endPoint para el acceso a  los códigos de especialidades de prestadores."
* qualification[Subespecialidad].code.text ^short = "Texto libre de la subespecialidad del profesional"
* qualification[Subespecialidad].code.coding.display ^short = "Nombre de la subespecialidad"
* qualification[Subespecialidad].code.coding.display ^definition = "Nombre la subespecialidad agregada. Agregar un poco más de información acerca del item que se está agregando."
* qualification[Subespecialidad].issuer MS
* qualification[Subespecialidad].issuer.display MS
* qualification[Subespecialidad].issuer ^short = "Organización que entrega el certificado o título"
* qualification[Subespecialidad].issuer.display ^short = "Nombre de la organización que entrega certificado o título"
* qualification[Subespecialidad].issuer.display ^definition = "Nombre de la organización que entrega el certificado o título válido para ejercer como prestdor. En este elemento solo se puede agregar texto libre"
