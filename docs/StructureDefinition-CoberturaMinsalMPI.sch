<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <sch:ns prefix="f" uri="http://hl7.org/fhir"/>
  <sch:ns prefix="h" uri="http://www.w3.org/1999/xhtml"/>
  <!-- 
    This file contains just the constraints for the profile Coverage
    It includes the base constraints for the resource as well.
    Because of the way that schematrons and containment work, 
    you may need to use this schematron fragment to build a, 
    single schematron that validates contained resources (if you have any) 
  -->
  <sch:pattern>
    <sch:title>f:Coverage</sch:title>
    <sch:rule context="f:Coverage">
      <sch:assert test="count(f:extension[@url = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/DirigenteVecinal']) &gt;= 1">extension with URL = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/DirigenteVecinal': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/DirigenteVecinal']) &lt;= 1">extension with URL = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/DirigenteVecinal': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/Prais']) &gt;= 1">extension with URL = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/Prais': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/Prais']) &lt;= 1">extension with URL = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/Prais': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/Antuco']) &gt;= 1">extension with URL = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/Antuco': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/Antuco']) &lt;= 1">extension with URL = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/Antuco': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/Prilonco']) &gt;= 1">extension with URL = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/Prilonco': minimum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:extension[@url = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/Prilonco']) &lt;= 1">extension with URL = 'http://minsal.cl/fhir/ig/mpi/StructureDefinition/Prilonco': maximum cardinality of 'extension' is 1</sch:assert>
      <sch:assert test="count(f:policyHolder) &gt;= 1">policyHolder: minimum cardinality of 'policyHolder' is 1</sch:assert>
      <sch:assert test="count(f:payor) &lt;= 1">payor: maximum cardinality of 'payor' is 1</sch:assert>
      <sch:assert test="count(f:class) &lt;= 1">class: maximum cardinality of 'class' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
