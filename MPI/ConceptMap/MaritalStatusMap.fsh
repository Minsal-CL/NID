Instance:       MPIMaritalStatusMap
InstanceOf:     ConceptMap
Usage:          #definition
Title:          "Mapeo de estados civiles entre el ValueSet DEIS y el ValueSet MaritalStatus de FHIR"
Description:    "Mapeo de estados civiles entre el ValueSet DEIS y el ValueSet MaritalStatus de FHIR, necesario para interoperar con otros sistemas que utilizan el estándar FHIR."

* status = #draft
* date = "2024-08-27"
* name = "MPI_ConceptMap_MaritalStatusMap"
* experimental = true
* sourceCanonical = Canonical(VSEstadoCivil)
* targetCanonical = VSMaritalStatus

* version = "0.4.8"

* group[0]
  * source = Canonical(CSEstadoCivil)
  * target = v3-MaritalStatus
  * element[0]
    * code = #01
    * display = "Soltero(a)"
    * target[0]
      * code = #S
      * display = "Never Married"
      * equivalence = #equivalent
      
  * element[+]
    * code = #02
    * display = "Casado(a)"
    * target[0]
      * code = #M
      * display = "Married"
      * equivalence = #equivalent
      
  * element[+]
    * code = #03
    * display = "Viudo(a)"
    * target[0]
      * code = #W
      * display = "Widowed"
      * equivalence = #equivalent

  * element[+]
    * code = #04
    * display = "Divorciado(a)"
    * target[+]
      * code = #D
      * display = "Divorced"
      * equivalence = #equivalent

  * element[+]
    * code = #05
    * display = "Separado(a) judicialmente"
    * target[0]
      * code = #A
      * display = "Annulled"
      * equivalence = #equivalent

  * element[+]
    * code = #06
    * display = "Conviviente civil"
    * target[0]
      * code = #T
      * display = "Domestic partner"
      * equivalence = #equivalent

* group[+]
  * source = Canonical(CSEstadoCivil)
  * target = v3-NullFlavor
  * element[0]
    * code = #99
    * display = "Desconocido"
    * target[0]
      * code = #UNK
      * display = "Unknown"
      * equivalence = #equal