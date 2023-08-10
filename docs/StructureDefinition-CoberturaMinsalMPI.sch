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
      <sch:assert test="count(f:class) &gt;= 1">class: minimum cardinality of 'class' is 1</sch:assert>
      <sch:assert test="count(f:class) &lt;= 1">class: maximum cardinality of 'class' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Coverage/f:class/f:type</sch:title>
    <sch:rule context="f:Coverage/f:class/f:type">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:coding) &gt;= 1">coding: minimum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:coding) &lt;= 1">coding: maximum cardinality of 'coding' is 1</sch:assert>
      <sch:assert test="count(f:text) &lt;= 1">text: maximum cardinality of 'text' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
  <sch:pattern>
    <sch:title>f:Coverage/f:class/f:type/f:coding</sch:title>
    <sch:rule context="f:Coverage/f:class/f:type/f:coding">
      <sch:assert test="count(f:id) &lt;= 1">id: maximum cardinality of 'id' is 1</sch:assert>
      <sch:assert test="count(f:system) &gt;= 1">system: minimum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:system) &lt;= 1">system: maximum cardinality of 'system' is 1</sch:assert>
      <sch:assert test="count(f:version) &lt;= 1">version: maximum cardinality of 'version' is 1</sch:assert>
      <sch:assert test="count(f:code) &gt;= 1">code: minimum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:code) &lt;= 1">code: maximum cardinality of 'code' is 1</sch:assert>
      <sch:assert test="count(f:display) &gt;= 1">display: minimum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:display) &lt;= 1">display: maximum cardinality of 'display' is 1</sch:assert>
      <sch:assert test="count(f:userSelected) &lt;= 1">userSelected: maximum cardinality of 'userSelected' is 1</sch:assert>
    </sch:rule>
  </sch:pattern>
</sch:schema>
