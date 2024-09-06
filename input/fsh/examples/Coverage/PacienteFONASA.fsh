Instance: CoberturaFONASAEjemplo
InstanceOf: MINSALCobertura
Usage: #example
Title: "Ejemplo de Cobertura FONASA"
Description: "Ejemplo de la cobertura FONASA de un paciente"

* status = #active
* type = CSPrevision#1 "FONASA"
* beneficiary = Reference(MinsalPacienteEjemplo)
* policyHolder = Reference(MinsalPacienteEjemplo)
* period.start = "2024-01-12"
* payor = Reference(FONASA)
* class[tramos]
  * type = CSClasesDeCobertura#1 "Tramos de FONASA"
  * value.extension[valorClase].valueCoding = CSTramosFONASA#A "FONASA A"