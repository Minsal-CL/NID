### Descripción General

Esta Guía modela el funcionamiento mediante transacciones FHIR, para el consumo y tributación de elementos identificatorios y demográficos de pacientes, entre sistemas de información en salud y un **Indice Maestro de Pacientes** (MPI)
<br>

Las transacciones descritas a continuación se basan el modelamiento de intercambio de datos desarrollado por *IHE* para estos fines, aplicados al estándar **FHIR** en las definiciones de los siguientes perfiles:

* [PIXm](https://profiles.ihe.net/ITI/PIXm/index.html): El perfil Patient Identifier Cross-reference for Mobile (PIXm) proporciona transacciones RESTful  para crear, actualizar y eliminar registros de pacientes en un gestor de referencias cruzadas de identificadores de pacientes y para consultar el gestor de referencias cruzadas de identificadores de pacientes para los identificadores entre dominios de un paciente.
<br>
<div align="center">
  <img src="PIXm.png"> 
  <p>Diagrama Actores PIXm (Fuente: Perfil IHE)</p>
</div>
<br>

* [PDQm](https://profiles.ihe.net/ITI/PDQm/): El perfil de integración de consulta de datos demográficos de pacientes ofrece a varias aplicaciones distribuidas la posibilidad de consultar una lista de pacientes en un servidor de información de pacientes, basándose en criterios de búsqueda definidos por el usuario, y recuperar la información demográfica de un paciente (y, opcionalmente, información relacionada con la visita) directamente en la aplicación.
<br>
<div align="center">
  <img src="PDQm.png"> 
  <p>Diagrama Actores PDQm (Fuente: Perfil IHE)</p>
</div>

<br>

### Caso de Uso 1: Identificación Cruzada de Pacientes

Este Caso comprende la identificción de un paciente en un sistema determinado (con identificación local),consultada por sistema (otra identificación local), por medio de un gestor de identificaciones.

#### Actores

* *Fuente de la Identificación del Paciente*: La Fuente de Identidad del Paciente es el productor y editor de los datos de identidad del paciente.
* *Consumidor de la identificación por referencia cruzada*: El consumidor de referencias cruzadas de identificadores de pacientes consulta las listas de identificadores de pacientes desde el gestor de referencias cruzadas de identificadores de pacientes.
* *Gestor de indentificaciones de referencias cruzadas*: El gestor de referencias cruzadas de identificadores de pacientes gestiona los datos de identidad de pacientes de distintos dominios y cruza referencias de datos de identidad de pacientes de distintos dominios para el mismo paciente.

#### Transacciones

Por el momento consideraremos solo una trasaccion para un único caso de uso de **PIXm**, que consite en la consulta de identificación de pacientes entre identificadores de distintos dominios *(el mismo paciente en diferentes dominios con identificadores distintos)*.
<br>
<div align="center">
  <img src="PIXmtrans.png"> 
  <p>Transacción del Caso (Fuente: Perfil IHE)</p>
</div>

<br>

##### Solicitud

La operación se desarrolla basada en un **HTTP GET** o **HTTP POST** del *Consumidor* al *Gestor* usando la operacion **FHIR** [$ihe-pix](OperationDefinition-MPI.PIXm.pix.html)
<br>

La URL para la operación se muestra a continuación:

```
[base]/Patient/$ihe-pix
```

<br>

Para determinar la obtención de los *Identificadores Correspondientes* la operación debe ser como se describe a continuación mediante **GET**:
<br>

```
GET [base]/Patient/$ihe-pix?sourceIdentifier=[token]{&targetSystem=[uri]}{&_format=[token]}
```
<br>
El parámetro *sourceIdentifier* es obligatorio y solo es uno, en cambio el parámetro *targetSystrem* puede ser mas de uno separados cada uno de ellos por medio del caracter **&**. En principio el parámetro *format* no se estará usando.

Como ejemplo
<br>

```
GET {{mpi}}/Patient/$ihe-pix?sourceIdentifier=urn:oid:2.16.840.1.113883.2.22.0.2.102100.50.10%ACL123456789876
```
<br>

Para el caso de **POST**, se debe hacer uso de un recurso [Parameter](StructureDefinition-ParametrosEntradaPixmMpi.html) en el *body*. Utilizando el ejemplo anterior debería quedar de la siguiente manera:
<br>
```
POST [base]/Patient/$ihe-pix
```
<br>
```
{
  "resourceType" : "Parameters",
  "parameter" : [
    {
      "name" : "sourceIdentifier",
      "valueIdentifier" : {
        "system" : "urn:oid:2.16.840.1.113883.2.22.0.2.102100.50.10",
        "value" : "ACL123456789876"
      }
    }
  ]
}
```
<br>
Esta operación hará búsqueda de todos los identificadores existentes para el paciente que en el sistema de dominio *2.16.840.1.113883.2.22.0.2.102100.50.10*, se encuentra identificado como *ACL123456789876*

##### Respuesta

La respuesta se desarrolla basada en un recurso [Parameters](StructureDefinition-ParametrosSalidaPixmMpi.html) en donde cada parámetro de respuesta es un *targetIdentifier* con el valor del identificador y el dominio al cual pertenece
<br>

```
{
    "resourceType": "Parameters",
    "id": "ParametroSalidaIhe-PIXm",
    "meta": {
        "profile": [
            "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/ParametrosSalidaPixmMpi"
        ]
    },
    "parameter": [
        {
            "name": "targetIdentifier",
            "valueIdentifier": {
                "use": "official",
                "system": "urn:oid:2.16.840.1.113883.2.22.0.2.102100.50.10",
                "value": "ACL123456789876"
            }
        },
        {
            "name": "targetId",
            "valueReference": {
                "reference": "Patient/MinsalPacienteEjemplo"
            }
        },
        {
            "name": "targetId",
            "valueReference": {
                "reference": "Patient/DuplicadoMPIPaciente"
            }
        }
    ]
}
```

### Caso de Uso 2: Consulta de información de Datos Demográficos de paciente.
<br>

Este caso comprende la consulta de información de datos demográficos de paciente sobre multiples sistemas distribuidos basado en uno o más criterios de búsqueda

#### Actores
<br>

* *Consumidor de Información de Paciente*: Sistema que consulta por los datos de un paciente.
* *Proveedor de la Información Demográfica de Paciente*: Sistema que provee al sistema que consulta, los datos requeridos sobre el paciente.

#### Transacciones
<br>

Esta es básicamente una transacción de consulta basada en el perfil **PDQm**, que consite en la consulta del *Consumidor*  sobre datos demográficos del paciente para solicitar información sobre pacientes cuyos datos demográficos coinciden con los datos proporcionados en los parámetros de consulta del mensaje de solicitud. El proveedor de datos demográficos del paciente recibe la solicitud. El proveedor de datos demográficos de pacientes procesa la solicitud y devuelve una respuesta en forma de información demográfica de los pacientes coincidentes
<br>

<div align="center">
  <img src="PDQtrans.png"> 
  <p>Transacciones de 2 Casos de Uso (Fuente: Perfil IHE)</p>
</div>

<br>

Como se aprecia existen dos casos de uso declarado. El de **Query** será aquel que se trabajará por el momento, en el cual se consulta por todos los datos de pacientes asociados a los parámetros de busqueda hecha al que suple la información. El caso de **Retrieve** se aplica para la búsqueda específica de los datos de 1 (un) paciente.
<br>


##### Solicitud Mediante Query

La operación se desarrolla basada en un **HTTP GET**  para búsqueda *SearchSet*
<br>

La especificación es como se muestra:

```
[base]/Patient?<parameters>
```

<br>

Para nuestro caso se determinan un set de parámetros de búsqueda aceptables para realizar la operacion:

* Por identificador
```
GET {{mpi}}/Patient?_format=json&identifier=15335473-1
```
El parámetro format no es necesario

* Por registro activo
```
GET {{mpi}}/Patient?_format=json&active=true
```
* Por Fecha de Nacimiento
```
GET {{mpi}}/Patient?birthdate=1981-11-10
```
* Por Apellido
```
GET {{mpi}}/Patient?family=martinez
```
* Por Nombre
```
GET {{mpi}}/Patient?given=Andres
```
* Por Id de Recurso
```
GET {{mpi}}/Patient?_id=AC1696435881599
```
* Por Nombre Completo
```
GET {{mpi}}/Patient?name=Andres Martinez 
```
* Por Telecom
```
GET {{mpi}}/Patient?telecom=5694332547
```
* Por SegundoApellido
```
GET {{mpi}}/Patient?segundo-apellido=rochefort
```
<br>

##### Respuesta Mediante Query

La respuesta del sistema que suple es un recurso [Bundle](StructureDefinition-BundleSearchMPI.html) de tipo **SearchSet** en donde se indica la cantidad de recursos encontrados con los parámetros coincidentes y cada uno de los éstos incluídos como entrada.
<br>
```
GET {{mpi}}/Patient?identifier=15335473-1&birthdate=1981-11-10&name=andres%20martinez
```
<br>
```
{
    "resourceType": "Bundle",
    "id": "EjemploBusqueda",
    "meta": {
        "profile": [
            "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/BundleSearchMPI"
        ]
    },
    "type": "searchset",
    "total": 1,
    "link": [
        {
            "relation": "self",
            "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/Patient?identifier=15335473-1&birthdate=1981-11-10&name=andres%20martinez"
        }
    ],
    "entry": [
        {
            "fullUrl": "https://interoperabilidad.minsal.cl/fhir/ig/nid/Patient/AC1696435881599",
            "resource": {
                "resourceType": "Patient",
                "id": "AC1696435881599",
                "meta": {
                    "profile": [
                        "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/MINSALPaciente"
                    ]
                },
                "extension": [
                    {
                        "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/IdentidadDeGenero",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero",
                                    "code": "1",
                                    "display": "Masculino"
                                }
                            ]
                        }
                    },
                    {
                        "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/SexoBiologico",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "http://hl7.org/fhir/administrative-gender",
                                    "code": "male",
                                    "display": "male"
                                }
                            ],
                            "text": "Masculino"
                        }
                    },
                    {
                        "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/CodigoPaises",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CodPais",
                                    "code": "152",
                                    "display": "Chile"
                                }
                            ]
                        }
                    },
                    {
                        "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/PaisOrigenMPI",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CodPais",
                                    "code": "032",
                                    "display": "Argentina"
                                }
                            ]
                        }
                    },
                    {
                        "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/Religion",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "https://interoperabilidad.minsal.cl/fhir/ig/nid/CodeSystem/CSReligion",
                                    "code": "9",
                                    "display": "Ninguna, ateo, agnóstico"
                                }
                            ]
                        }
                    },
                    {
                        "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/PueblosAfrodescendiente",
                        "valueBoolean": false
                    },
                    {
                        "extension": [
                            {
                                "url": "pertenece",
                                "valueBoolean": false
                            }
                        ],
                        "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/PueblosOriginarios"
                    }
                ],
                "identifier": [
                    {
                        "use": "official",
                        "type": {
                            "extension": [
                                {
                                    "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/CodigoPaises",
                                    "valueCodeableConcept": {
                                        "coding": [
                                            {
                                                "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CodPais",
                                                "code": "152",
                                                "display": "Chile"
                                            }
                                        ]
                                    }
                                }
                            ],
                            "coding": [
                                {
                                    "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador",
                                    "code": "01",
                                    "display": "RUN"
                                }
                            ]
                        },
                        "value": "12216373-3"
                    }
                ],
                "active": true,
                "name": [
                    {
                        "use": "official",
                        "family": "Martinez",
                        "_family": {
                            "extension": [
                                {
                                    "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/SegundoApellido",
                                    "valueString": "rochefort"
                                }
                            ]
                        },
                        "given": [
                            "Andres"
                        ]
                    }
                ],
                "telecom": [
                    {
                        "system": "phone",
                        "value": "+5694332547",
                        "use": "mobile"
                    }
                ],
                "gender": "male",
                "birthDate": "1981-11-10",
                "deceasedBoolean": false,
                "address": [
                    {
                        "extension": [
                            {
                                "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/SituacionCalle",
                                "valueBoolean": false
                            }
                        ],
                        "use": "home",
                        "line": [
                            "Calle Los Cedros 1234, Casa 15"
                        ],
                        "_city": {
                            "extension": [
                                {
                                    "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/ComunasCl",
                                    "valueCodeableConcept": {
                                        "coding": [
                                            {
                                                "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodComunasCL",
                                                "code": "13110",
                                                "display": "La Florida"
                                            }
                                        ]
                                    }
                                }
                            ]
                        },
                        "_district": {
                            "extension": [
                                {
                                    "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/ProvinciasCl",
                                    "valueCodeableConcept": {
                                        "coding": [
                                            {
                                                "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodProvinciasCL",
                                                "code": "131",
                                                "display": "Santiago"
                                            }
                                        ]
                                    }
                                }
                            ]
                        },
                        "_state": {
                            "extension": [
                                {
                                    "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/RegionesCl",
                                    "valueCodeableConcept": {
                                        "coding": [
                                            {
                                                "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL",
                                                "code": "13",
                                                "display": "Metropolitana de Santiago"
                                            }
                                        ]
                                    }
                                }
                            ]
                        },
                        "_country": {
                            "extension": [
                                {
                                    "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/CodigoPaises",
                                    "valueCodeableConcept": {
                                        "coding": [
                                            {
                                                "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CodPais",
                                                "code": "152",
                                                "display": "Chile"
                                            }
                                        ]
                                    }
                                }
                            ]
                        }
                    }
                ],
                "maritalStatus": {
                    "coding": [
                        {
                            "system": "https://interoperabilidad.minsal.cl/fhir/ig/nid/CodeSystem/CSEstadoCivil",
                            "code": "01",
                            "display": "Soltero(a)"
                        }
                    ]
                }
            },
            "search": {
                "mode": "match"
            }
        }
    ]
}
```
<br>

##### Solicitud Mediante Retrive

La operación se desarrolla basada en un **HTTP POST** utilizando un recurso [Parameters](StructureDefinition-ParametrosEntradaPDQmMpi.html) en el cuerpo, donde uno de sus parámetros es un recurso [Patient](StructureDefinition-MINSALPacienteBusqueda.html), el cuál son los datos que permitirán la búsqueda de los pacientes utilizando la operación [$match](https://build.fhir.org/ig/Minsal-CL/NID/OperationDefinition-MPI.PDQm.match.html).

<br>
La especificación es como se muestra:
```
[base]/Patient/$match
```
<br>
```
{
    "resourceType": "Parameters",
    "parameter": [
        {
            "name": "resource",
            "resource": {
                //Recurso Patient
            }     
        },
        {
            "name": "onlyCertainMatches",
            "valueBoolean": //true o false
        },
        {
            "name": "count",
            "valueInteger": //valor entero
        }
    ]
}
```
<br>
<br>
Ejemplo del uso de la operación **$match**
La especificación es como se muestra:
```
POST {{mpi}}/Patient/$match
```
<br>
```
{
    "resourceType": "Parameters",
    "parameter": [
        {
            "name": "resource",
            "resource": {
                "resourceType": "Patient",
                "identifier": [
                    {
                        "use": "official",
                        "type": {
                            "coding": [
                                {
                                    "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador",
                                    "code": "01",
                                    "display": "RUN"
                                }
                            ]
                        },
                        "value": "12216373-3"
                    }
                ],
                "active": true,
                "name": [
                    {
                        "use": "official",
                        "family": "Martinez",
                        "given": [
                            "Andres"
                        ]
                    }
                ],
                "telecom": [
                    {
                        "system": "phone",
                        "value": "+5694332547"
                    }
                ],
                "gender": "male",
                "birthDate": "1981-11-10"
            }
        },
        {
            "name": "onlyCertainMatches",
            "valueBoolean": false
        },
        {
            "name": "count",
            "valueInteger": 1
        }
    ]
}
```
<br>

##### Respuesta Mediante Retrive

El resultado de la operación $match es un recurso [Bundle Searchset](StructureDefinition-BundleSearchMPIMatch.html), el cuál puede entregar uno o más recursos pacientes que correspondan a la busqueda. En el caso de alguna dificultad o problema con la operación se entregará un **Operation Ouctome** dentro de los resultados del Bundle.
Ejemplo de un $match exitoso:
<br>
```
{
    "resourceType": "Bundle",
    "type": "searchset",
    "total": 1,
    "link": [
        {
            "relation": "self",
            "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/Patient/$match"
        }
    ],
    "entry": [
        {
            "fullUrl": "https://interoperabilidad.minsal.cl/fhir/ig/nid/Patient/AC1696435881599",
            "resource": {
                "resourceType": "Patient",
                "id": "AC1696435881599",
                "meta": {
                    "profile": [
                        "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/MINSALPaciente"
                    ]
                }
                "extension": [
                    {
                        "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/IdentidadDeGenero",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSIdentidaddeGenero",
                                    "code": "1",
                                    "display": "Masculino"
                                }
                            ]
                        }
                    },
                    {
                        "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/SexoBiologico",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "http://hl7.org/fhir/administrative-gender",
                                    "code": "male",
                                    "display": "male"
                                }
                            ],
                            "text": "Masculino"
                        }
                    },
                    {
                        "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/CodigoPaises",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CodPais",
                                    "code": "152",
                                    "display": "Chile"
                                }
                            ]
                        }
                    },
                    {
                        "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/PaisOrigenMPI",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CodPais",
                                    "code": "032",
                                    "display": "Argentina"
                                }
                            ]
                        }
                    },
                    {
                        "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/Religion",
                        "valueCodeableConcept": {
                            "coding": [
                                {
                                    "system": "https://interoperabilidad.minsal.cl/fhir/ig/nid/CodeSystem/CSReligion",
                                    "code": "9",
                                    "display": "Ninguna, ateo, agnóstico"
                                }
                            ]
                        }
                    },
                    {
                        "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/PueblosAfrodescendiente",
                        "valueBoolean": false
                    },
                    {
                        "extension": [
                            {
                                "url": "pertenece",
                                "valueBoolean": false
                            }
                        ],
                        "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/PueblosOriginarios"
                    }
                ],
                "identifier": [
                    {
                        "use": "official",
                        "type": {
                            "extension": [
                                {
                                    "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/CodigoPaises",
                                    "valueCodeableConcept": {
                                        "coding": [
                                            {
                                                "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CodPais",
                                                "code": "152",
                                                "display": "Chile"
                                            }
                                        ]
                                    }
                                }
                            ],
                            "coding": [
                                {
                                    "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSTipoIdentificador",
                                    "code": "01",
                                    "display": "RUN"
                                }
                            ]
                        },
                        "value": "12216373-3"
                    }
                ],
                "active": true,
                "name": [
                    {
                        "use": "official",
                        "family": "Martinez",
                        "_family": {
                            "extension": [
                                {
                                    "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/SegundoApellido",
                                    "valueString": "rochefort"
                                }
                            ]
                        },
                        "given": [
                            "Andres"
                        ]
                    }
                ],
                "telecom": [
                    {
                        "system": "phone",
                        "value": "+5694332547",
                        "use": "mobile"
                    }
                ],
                "gender": "male",
                "birthDate": "1981-11-10",
                "deceasedBoolean": false,
                "address": [
                    {
                        "extension": [
                            {
                                "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/StructureDefinition/SituacionCalle",
                                "valueBoolean": false
                            }
                        ],
                        "use": "home",
                        "line": [
                            "Calle Los Cedros 1234, Casa 15"
                        ],
                        "_city": {
                            "extension": [
                                {
                                    "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/ComunasCl",
                                    "valueCodeableConcept": {
                                        "coding": [
                                            {
                                                "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodComunasCL",
                                                "code": "13110",
                                                "display": "La Florida"
                                            }
                                        ]
                                    }
                                }
                            ]
                        },
                        "_district": {
                            "extension": [
                                {
                                    "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/ProvinciasCl",
                                    "valueCodeableConcept": {
                                        "coding": [
                                            {
                                                "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodProvinciasCL",
                                                "code": "131",
                                                "display": "Santiago"
                                            }
                                        ]
                                    }
                                }
                            ]
                        },
                        "_state": {
                            "extension": [
                                {
                                    "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/RegionesCl",
                                    "valueCodeableConcept": {
                                        "coding": [
                                            {
                                                "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CSCodRegionCL",
                                                "code": "13",
                                                "display": "Metropolitana de Santiago"
                                            }
                                        ]
                                    }
                                }
                            ]
                        },
                        "_country": {
                            "extension": [
                                {
                                    "url": "https://hl7chile.cl/fhir/ig/clcore/StructureDefinition/CodigoPaises",
                                    "valueCodeableConcept": {
                                        "coding": [
                                            {
                                                "system": "https://hl7chile.cl/fhir/ig/clcore/CodeSystem/CodPais",
                                                "code": "152",
                                                "display": "Chile"
                                            }
                                        ]
                                    }
                                }
                            ]
                        }
                    }
                ],
                "maritalStatus": {
                    "coding": [
                        {
                            "system": "https://interoperabilidad.minsal.cl/fhir/ig/nid/CodeSystem/CSEstadoCivil",
                            "code": "01",
                            "display": "Soltero(a)"
                        }
                    ]
                }
            },
            "search": {
                "extension": [
                    {
                        "url": "http://hl7.org/fhir/StructureDefinition/match-grade",
                        "valueCode": "probable"
                    }
                ],
                "mode": "match",
                "score": 0.7
            }
        }
    ]
}
```
Ejemplo con **OperationOutcome**:

```
{
    "resourceType": "Bundle",
    "type": "searchset",
    "link": [
        {
            "relation": "self",
            "url": "https://interoperabilidad.minsal.cl/fhir/ig/nid/Patient/$match"
        }
    ],
    "entry": [
        {
            "fullUrl": "https://interoperabilidad.minsal.cl/fhir/ig/nid/OperationOutcome/OperationOutcomeFalloMatch",
            "resource": {
                "resourceType": "OperationOutcome",
                "id": "OperationOutcomeFalloMatch",
                "issue": [
                    {
                        "severity": "error",
                        "code": "timeout",
                        "details": {
                            "text": "La búsqueda ha expirado debido a un timeout en el servidor."
                        }
                    }
                ]
            },
            "search": {
                "mode": "outcome"
            }
        }
    ]
}
```


