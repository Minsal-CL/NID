Profile:        OrganizacionCL2
Parent:         Organization
Id:             CoreOrganizacionCl
Title:          "CL Organización"
Description:    "Este Perfil ha sido desarrollado para cubrir las necesidades del Caso de Uso de Receta Electrónica. Sin embargo, se ha modelado para también cubrir las necesidades nacionales de un Recurso de Organización en Salud"
* ^language = #es

* active ^short = "Estado de si es una Organización Validada o no (true|false)"
* active ^definition = "Indicador si una organización sigue vigente en su rol dentro del sistema de salud"

* identifier and identifier.system and identifier.value MS
* identifier ^short = "Identificador de organización de salud (DEIS, RUT, Códigos para ciertos tipos de Recintos, etc.)"
* identifier ^definition = "Identificador universal de la organización en Chile"
* identifier.system ^short = "indicador del sistema de identificación usado para determinar el valor del identificador"
* identifier.system ^definition = "Se debe aún definir un ValueSet para estos casos"

* name and alias MS
* name ^short = "Nombre Legal de la Organización" 
* name ^definition = "Nombre Legal de la Organización"
* alias ^short = "Nombre de Fantasía" 
* alias ^definition = "Nombre por lo que popularmente es conocida la Organización y que no corresponde al nombre legal" 		

* telecom MS
* telecom ^short = "Contactos de la organización" 
* telecom ^definition = "Contactos de la organización" 
* telecom.system ^short = "phone | fax | email | pager | url | sms | other  ContactPointSystem (Required)" 
* telecom.system ^definition = "El tipo de medio de contacto el cual se notifica"
* telecom.use from  http://hl7.org/fhir/ValueSet/contact-point-use (required)
* telecom.system ^short = "phone | fax | email | pager | url | sms | other"
* telecom.system ^definition = "Forma de telecomunicación para el punto de contacto: qué sistema de comunicación se requiere para hacer uso del contacto."
* telecom.system from  http://hl7.org/fhir/ValueSet/contact-point-system (required)
* telecom.system ^binding.description = "VS HL7 FHIR tipos diferentes de medios de contacto" 
* telecom.value ^short = "Dato del contacto de la ubicación descrita"
* telecom.value ^definition = "Valor del contacto como por ejemplo el número de teléfono fijo o de móvil o el email de Organización"

* address MS
* address only Address or ClAddress2


* contact MS
* contact ^short = "Contacto de la Organización para ciertos propósitos"
* contact ^definition = "Contacto de la Organización para ciertos propósitos"
* contact.purpose MS
* contact.purpose ^short = "El tipo de contacto"
* contact.purpose ^definition = "El propósito mediante el cual el contacto puede ser alcanzado"
* contact.purpose from http://hl7.org/fhir/ValueSet/contactentity-type (extensible)
* contact.purpose ^binding.description = "Códigos del propósito del contacto, HL7 FHIR"
* contact.name MS
* contact.name ^short = "Nombre asociado al contacto"
* contact.name ^definition = "Nombre asociado al contacto"

* contact.telecom  MS
* contact.telecom ^short = "Detalles de contacto de la Organización"
* contact.telecom ^definition = "Detalles del contacto de la Organización comúnmente el o los mas usados (Ej: Teléfono fijo, móvil, email, etc.)"
* contact.telecom.use ^short = "home | work | temp | old | mobile" 
* contact.telecom.use ^definition = "Propósito para el contacto que se ha definido" 
* contact.telecom.use from  http://hl7.org/fhir/ValueSet/contact-point-use (required)
* contact.telecom.system ^short = "phone | fax | email | pager | url | sms | other"
* contact.telecom.system ^definition = "Forma de telecomunicación para el punto de contacto: qué sistema de comunicación se requiere para hacer uso del contacto."
* contact.telecom.system from  http://hl7.org/fhir/ValueSet/contact-point-system (required)
* contact.telecom.value ^short = "Dato del contacto de la Organización"
* contact.telecom.value ^definition = "Valor del contacto como por ejemplo el número de teléfono fijo o de móvil o el email del Paciente"