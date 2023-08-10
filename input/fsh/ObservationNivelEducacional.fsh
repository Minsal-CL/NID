Profile: NivelEducacional
Parent: Observation
Id: NivelEducacional
Title: "Nivel Educacional"
Description: "Nivel Educacional"


* status MS
* category MS
* category from VSTipoObservacion
  * coding 1..1 MS
    * code 1..1 MS
    * code = #01
    * system 0..1 MS
    * display 1..1 MS
    * display = #"Nivel Educacional"

* code MS
* code from VSTipoObservacion
  * coding 1..1 MS
    * code 1..1 MS
    * system 0..1 MS


* valueCodeableConcept 1..1 MS
  * coding from VSOcupacionesDet
  * coding 1..1 MS
    * code 1..1 MS
    * system 1..1 MS

* component 2..2 MS
  * code MS
    * coding 1..1 MS
      * code 1..1 MS
      * system 1..1 MS
      * display 0..1 MS



* component ^slicing.discriminator.type = #value
* component ^slicing.discriminator.path = "use"
* component ^slicing.rules = #open
* component ^slicing.description = "Slice para diferenciar ultimo curso aprobado de ultimo nivel aprobado"
* component contains UtlimoCursoAprobado 1..1 MS and UtlimoNivelAprobado 1..1 MS



* component ^short = "Información sobre el ultimo nivel y curso aprobado"
* component ^definition = "Información sobre el ultimo nivel y curso aprobado"

* component[UtlimoCursoAprobado] ^short = "Ultimo Curso Aprobado"
* component[UtlimoCursoAprobado] ^definition = "Ultimo Curso Aprobado"
  * code MS
    * coding 1..1 MS
      * code 1..1 MS
      * code = #01
      * system 1..1 MS
      * display 1..1 MS
      * display = "Ultimo curso aprobado"
* component[UtlimoCursoAprobado].valueInteger 1..1 MS

* component[UtlimoNivelAprobado] ^short = "Ultimo Curso Aprobado"
* component[UtlimoNivelAprobado] ^definition = "Ultimo Curso Aprobado"
  * code MS
    * coding 1..1 MS
      * code 1..1 MS
      * code = #02
      * system 1..1 MS
      * display 0..1 MS
      * display = "Ultimo nivel aprobado"
* component[UtlimoNivelAprobado].valueCodeableConcept
  * coding 1..1 MS
    * code 1..1 MS
    * system 1..1 MS
    * display 0..1 MS



/*    
  "component": [
    {
      "code": {
        "coding": [
          {
            "system": VSNivelEducacionalDesc,
            "code": 01
          }
        ]
      },
     ValueInter
    },
    {
      "code": {
        "coding": [
          {
            "system": "http://acme-rehab.org",
            "code": "alcohol-type"
          }
        ]
      },
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://snomed.info/sct",
            "code": "53410008",
            "display": "Beer (substance)"
          }
        ],
        "text": "Beer"
      }
    },
    {
      "code": {
        "coding": [
          {
            "system": "http://acme-rehab.org",
            "code": "alcohol-type"
          }
        ]
      },
      "valueCodeableConcept": {
        "coding": [
          {
            "system": "http://snomed.info/sct",
            "code": "6524003",
            "display": " Distilled spirits (substance)"
          }
        ],
        "text": "Liquor"
      }
    }
  ]



VSNivelEducacionalDesc
VSNivelEducacionalDesc
 "NivelEducacionalDesc
 "NivelEducacionalDesc
CSNivelEducacionalDesc
CSNivelEducacionalDesc
CSNivelEducacionalDesc
 "NivelEducacionalDesc
 "NivelEducacionalDesc

CSUNivelAprob

*/