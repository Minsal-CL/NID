ValueSet: VSTipoIdentificador
Id: VSTipoIdentificador
Title: "Tipo Identificador"
Description: "Tipo Identificador"
* ^experimental = false
* ^version = "1.0.0"
* ^status = #active
* ^date = "2023-07-03T00:00:00-03:00"
* ^contact.name = "MINSAL TIC/Interoperabilidad"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "interoperabilidad@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system CSTipoIdentificador

CodeSystem: CSTipoIdentificador
Id: CSTipoIdentificador
Title: "Tipo Identificador"
Description: "Tipo Identificador"
* ^experimental = false
* ^caseSensitive = true
* ^version = "1.0.0"
* ^status = #active
* ^date = "2023-07-03T00:00:00-03:00"
* ^contact.name = "MINSAL TIC/Interoperabilidad"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "interoperabilidad@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* #01 "Run"
* #02 "Run materno/progenitor(a)"
* #03 "Número de Folio de comprobante de parto"
* #04 "Número de pasaporte"
* #05 "Número de documento identificador de país de origen"
* #06 "Número de identificador FONASA"
* #07 "Identificador Provisorio Escolar"
* #08 "Identificador Provisorio Apoderado"
* #09 "Registro Único de Contribuyentes"

ValueSet: VSIdentidadDeGenero
Id: VSIdentidadDeGenero
Title: "IdentidadDeGenero"
Description: "IdentidadDeGenero"
* ^experimental = false
* ^version = "0.1"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system CSIdentidadDeGenero

CodeSystem: CSIdentidadDeGenero
Id: CSIdentidadDeGenero
Title: "IdentidadDeGenero"
Description: "IdentidadDeGenero"
* ^experimental = false
* ^caseSensitive = true
* ^version = "0.9"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* #01 "Masculino"
* #02 "Femenino"
* #03 "Transgénero masculino"
* #04 "Transgénero femenino"
* #05 "No binarie"
* #06 "otra"
* #07 "No revelado"

ValueSet: VSEstadoCivil
Id: VSEstadoCivil
Title: "EstadoCivil"
Description: "EstadoCivil"
* ^experimental = false
* ^version = "0.1"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system CSEstadoCivil

CodeSystem: CSEstadoCivil
Id: CSEstadoCivil
Title: "EstadoCivil"
Description: "EstadoCivil"
* ^experimental = false
* ^caseSensitive = true
* ^version = "0.9"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* #01 "Soltero(a)"
* #02 "Casado(a)"
* #03 "Viudo(a)"
* #04 "Divorciado(a)"
* #05 "Separado(a) judicialmente"
* #06 "Conviviente civil"
* #99 "Desconocido"

ValueSet: PueblosOriginariosVS
Id: PueblosOriginariosVS
Title: "Pueblos Originarios de Chile"
Description: "Pueblos Originarios de Chile"
* ^experimental = true
* include codes from system PueblosOriginariosCS

CodeSystem: PueblosOriginariosCS
Id: PueblosOriginariosCS
Title: "Pueblos Originarios de Chile"
Description:  "Pueblos Originarios de Chile"
* ^experimental = true
* ^caseSensitive = true
* #01	"Mapuche"
* #02	"Aymara"
* #03	"Rapa Nui o pascuense"
* #04	"Lickanatay"
* #05	"Quechua"
* #06	"Colla"
* #07	"Diaguita"
* #08	"Kaweskar"
* #09	"Yagan"
* #10	"Chango"
* #96	"Otro (Especificar)"

ValueSet: VSReligion
Id: VSReligion
Title: "Religion"
Description: "Religion"
* ^experimental = false
* ^version = "0.1"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system CSReligion

CodeSystem: CSReligion
Id: CSReligion
Title: "Religion"
Description: "Religion"
* ^experimental = false
* ^caseSensitive = true
* ^version = "0.9"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* #1 "Católica"
* #2 "Evangélica"
* #3 "Testigo de Jehová"
* #4 "Judaica"
* #5 "Mormón"
* #6 "Musulmana"
* #7 "Ortodoxa"
* #8 "Otra religión o credo"
* #9 "Ninguna, ateo, agnóstico"
* #99 "Desconocido"

ValueSet: VSOrigenDiscapacidad
Id: VSOrigenDiscapacidad
Title: "OrigenDiscapacidad"
Description: "OrigenDiscapacidad"
* ^experimental = false
* ^version = "0.1"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* codes from system CSOrigenDiscapacidad

CodeSystem: CSOrigenDiscapacidad
Id: CSOrigenDiscapacidad
Title: "OrigenDiscapacidad"
Description: "OrigenDiscapacidad"
* ^experimental = false
* ^caseSensitive = true
* ^version = "0.9"
* ^status = #active
* ^date = "2023-01-15"
* ^contact.name = "MINSAL CHILE"
* ^contact.telecom.system = #email
* ^contact.telecom.value = "minsal@minsal.cl"
* ^jurisdiction = urn:iso:std:iso:3166#CL "Chile"

* #01 "Origen Físico"
* #02 "Origen sensorial visual "
* #03 "Origen sensorial auditivo"
* #04 "Origen mental síquico "
* #05 "Origen mental intelectual "
* #06 "Origen múltiple"