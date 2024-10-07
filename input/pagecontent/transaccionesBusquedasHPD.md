### Descripción General

Esta sección de la Guía modela el funcionamiento mediante transacciones FHIR para el consumo y gestión de elementos identificatorios y demográficos de prestadores e instituciones, facilitando el intercambio de información entre sistemas de salud y un **Directorio de Prestadores Individuales e Institucionales (HPD)**.
<br>

Las transacciones descritas a continuación se basan en el modelamiento de intercambio de datos desarrollado por IHE para estos fines, adaptadas al estándar FHIR en los siguientes perfiles:

* [HPD](https://www.ihe.net/uploadedFiles/Documents/ITI/IHE_ITI_Suppl_HPD.pdfl): El perfil  Healthcare Provider Directory (HPD) proporciona transacciones RESTful para la creación, actualización y eliminación de registros de prestadores de servicios de salud y para consultar la información de prestadores individuales e institucionales en el directorio. Sin embargo, es importante destacar que, actualmente, el HPD no cuenta con una versión completamente desarrollada bajo el estándar FHIR, por lo que, la versión en esta guía es una adaptación de lo descrito en el perfil IHE. 

<br>
<div align="center">
  <img src="HPD.png" width=989px height=480px> 
  <p>Diagrama Actores HPD (Fuente: Perfil IHE)</p>
</div>
<br>

### Profesionales Individuales y Administrativos

#### Solicitud de Búsqueda

La operación se desarrolla basada en un **HTTP GET**  para búsqueda *SearchSet*
<br>

La especificación es como se muestra:

```
[base]/Practitioner?_profile=[uriPerfil]&<parameters>
```

Para nuestro caso se determinan un set de parámetros de búsqueda aceptables para realizar la operacion, e incluir el parámetro "_profile" para buscar según la url canonica o referencia interna del [Prestador Administrativo](StructureDefinition-MINSALPractitionerAdministrativo.html) o [Prestador Profesional](StructureDefinition-MINSALPrestadorProfesional.html):

* Por identificador
```
GET {{hpd}}/Practitioner?_profile=[uriPerfil]&_format=json&identifier=19949350-7
```
El parámetro format no es necesario

* Por registro activo
```
GET {{hpd}}/Practitioner?_profile=[uriPerfil]&active=true
```
* Por Fecha de Nacimiento
```
GET {{hpd}}/Practitioner?_profile=[uriPerfil]&birthdate=1991-04-01
```
* Por Apellido
```
GET {{hpd}}/Practitioner?_profile=[uriPerfil]&family=Gonzalez
```
* Por Nombre
```
GET {{hpd}}/Practitioner?_profile=[uriPerfil]&given=María
```
* Por Id de Recurso
```
GET {{hpd}}/Practitioner?_profile=[uriPerfil]&_id=PD1696435881599
```
<br>

#### Respuesta

La respuesta del sistema que suple es un recurso [Bundle](StructureDefinition-BundleSearchProfHPD.html) de tipo **SearchSet** en donde se indica la cantidad de recursos encontrados con los parámetros coincidentes y cada uno de los éstos incluídos como entrada.
<br>
```
GET {{hpd}}/Practitioner?_profile=StructureDefinition/MINSALPrestadorProfesional&identifier=19949350-7&birthdate=1991-04-01&given=María&family=Gonzalez
```
```
{
  "resourceType": "Bundle",
  "id": "EjemploBusquedaProf",
  "meta": {
    "profile": [
      "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/BundleSearchProfHPD"
    ]
  },
  "link": [
    {
      "relation": "self",
      "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/Practitioner?_profile=StructureDefinition/MINSALPrestadorProfesional&identifier=19949350-7&birthdate=1991-04-01&given=María&family=Gonzalez"
    }
  ],
  "entry": [
    {
      "search": {
        "mode": "match"
      },
      "fullUrl": "https://interoperabilidad.minsal.cl/fhir/ig/nid/Practitioner/EjemploPractiProf",
      "resource": {
        "resourceType": "Practitioner",
        "id": "EjemploPractiProf",
        "meta": {
          "profile": [
            "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/MINSALPrestadorProfesional"
          ]
        },
        "identifier": [
          {
            "type": {
              "coding": [
                {
                  "code": "01",
                  "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador",
                  "display": "RUN"
                }
              ],
              "text": "Rol Único Nacional"
            },
            "assigner": {
              "display": "Republica de Chile"
            },
            "use": "official",
            "value": "19949350-7"
          },
          {
            "type": {
              "coding": [
                {
                  "code": "13",
                  "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador",
                  "display": "RNPI"
                }
              ],
              "text": "Registro Nacional de Prestadores Individuales"
            },
            "assigner": {
              "display": "Intendencia de prestadores individuales - Superintendencia de Salud"
            },
            "use": "secondary",
            "value": "1234543"
          }
        ],
        "name": [
          {
            "prefix": [
              "Dra"
            ],
            "given": [
              "María"
            ],
            "family": "Gonzalez",
            "_family": {
              "extension": [
                {
                  "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/SegundoApellido",
                  "valueString": "Gutierrez"
                }
              ]
            }
          }
        ],
        "qualification": [
          {
            "identifier": [
              {
                "value": "cert"
              }
            ],
            "code": {
              "coding": [
                {
                  "code": "1",
                  "system": "https://interoperabilidad.minsal.cl/fhir/ig/nid/CodeSystem/CSTituloProfesional",
                  "display": "MÉDICO CIRUJANO"
                }
              ],
              "text": "MÉDICO CIRUJANO"
            },
            "period": {
              "start": "2007-11-01"
            },
            "issuer": {
              "display": "Universidad de Chile"
            }
          },
          {
            "identifier": [
              {
                "value": "esp"
              }
            ],
            "code": {
              "coding": [
                {
                  "code": "30",
                  "system": "https://interoperabilidad.minsal.cl/fhir/ig/nid/CodeSystem/CSEspecialidadMed",
                  "display": "MEDICINA INTERNA"
                }
              ],
              "text": "MEDICINA INTERNA"
            },
            "period": {
              "start": "2010-11-01"
            },
            "issuer": {
              "display": "Pontificia Universidad Católica de Chile"
            }
          },
          {
            "extension": [
              {
                "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/Mencion",
                "valueString": "Linfoma"
              }
            ],
            "identifier": [
              {
                "value": "subesp"
              }
            ],
            "code": {
              "coding": [
                {
                  "code": "23",
                  "system": "https://interoperabilidad.minsal.cl/fhir/ig/nid/CodeSystem/CSEspecialidadMed",
                  "display": "HEMATOLOGÍA"
                }
              ],
              "text": "HEMATOLOGÍA"
            },
            "period": {
              "start": "2014-11-01"
            },
            "issuer": {
              "display": "Universidad de Valparaíso"
            }
          }
        ],
        "active": true,
        "gender": "male",
        "birthDate": "1991-04-01"
      }
    }
  ],
  "type": "searchset",
  "total": 1
}
```
<br>

### Intituciones

#### Solicitud de Búsqueda
La operación se desarrolla basada en un **HTTP GET**  para búsqueda *SearchSet*
<br>
La especificación es como se muestra:
```
[base]/Organization?<parameters>
```
<br>
Para nuestro caso se determinan un set de parámetros de búsqueda aceptables para realizar la operacion. 

* Por identificador
```
GET {{hpd}}/Organization?identifier=123141&_format=json
```
El parámetro format no es necesario

* Por Nombre
```
GET {{hpd}}/Organization?name=Hospital
```
* Por Id de Recurso
```
GET {{hpd}}/Organization?&_id=1321234
```
<br>

#### Respuesta

La respuesta del sistema que suple es un recurso [Bundle](StructureDefinition-BundleSearchINSHPD.html) de tipo **SearchSet** en donde se indica la cantidad de recursos encontrados con los parámetros coincidentes y cada uno de los éstos incluídos como entrada.
<br>
```
GET {{hpd}}/Organization?identifier=120101&name=Hospital
```
```
{
  "resourceType": "Bundle",
  "id": "EjemploBusquedaOrg",
  "meta": {
    "profile": [
      "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/BundleSearchINSHPD"
    ]
  },
  "link": [
    {
      "relation": "self",
      "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/Organization?identifier=120101&name=Hospital"
    }
  ],
  "entry": [
    {
      "search": {
        "mode": "match"
      },
      "fullUrl": "https://interoperabilidad.minsal.cl/fhir/ig/nid/Organization/OrganizationLEEjemplo",
      "resource": {
        "resourceType": "Organization",
        "id": "OrganizationLEEjemplo",
        "meta": {
          "profile": [
            "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/MINSALPrestadorOrganizacional"
          ]
        },
        "identifier": [
          {
            "system": "https://interoperabilidad.minsal.cl/fhir/ig/tei/CodeSystem/CSEstablecimientoDestino",
            "value": "120101"
          }
        ],
        "alias": [
          "Hospital de Los Ángeles"
        ],
        "telecom": [
          {
            "system": "phone",
            "value": "(+56) 432336000"
          }
        ],
        "address": [
          {
            "line": [
              "Ricardo Vicuña 147"
            ],
            "city": "Los Ángeles",
            "_city": {
              "extension": [
                {
                  "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/ComunasCl",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "code": "08301",
                        "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodComunasCL",
                        "display": "Los Ángeles"
                      }
                    ]
                  }
                }
              ]
            },
            "postalCode": "4451055",
            "country": "Chile",
            "_country": {
              "extension": [
                {
                  "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/CodigoPaises",
                  "valueCodeableConcept": {
                    "coding": [
                      {
                        "code": "152",
                        "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CodPais",
                        "display": "Chile"
                      }
                    ]
                  }
                }
              ]
            }
          }
        ],
        "name": "Complejo Asistencial Dr. Víctor Ríos Ruiz (Los Ángeles)"
      }
    }
  ],
  "type": "searchset",
  "total": 1
}
```
<br>