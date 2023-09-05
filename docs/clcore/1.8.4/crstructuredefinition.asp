<%@ language="javascript"%>

<%
  var s = String(Request.ServerVariables("HTTP_ACCEPT"));
  var id = Request.QueryString("id");
  if (s.indexOf("application/json+fhir") > -1) 
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/StructureDefinition-"+id+".json2");
  else if (s.indexOf("application/fhir+json") > -1) 
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/StructureDefinition-"+id+".json1");
  else if (s.indexOf("application/xml+fhir") > -1) 
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/StructureDefinition-"+id+".xml2");
  else if (s.indexOf("application/fhir+xml") > -1) 
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/StructureDefinition-"+id+".xml1");
  else if (s.indexOf("json") > -1) 
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/StructureDefinition-"+id+".json");
  else if (s.indexOf("html") == -1) 
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/StructureDefinition-"+id+".xml");
  else if (id == "ContactoParticipantes")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-ContactoParticipantes.html");
  else if (id == "ComunasCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-ComunasCl.html");
  else if (id == "RazonNOrealizarseInm")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-RazonNOrealizarseInm.html");
  else if (id == "TiposEncuentro")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-TiposEncuentro.html");
  else if (id == "ProvenanceCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-ProvenanceCl.html");
  else if (id == "ServicioSalud")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-ServicioSalud.html");
  else if (id == "CoreEspecialidadCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-CoreEspecialidadCl.html");
  else if (id == "VSEspecialidadesDeisCL")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-VSEspecialidadesDeisCL.html");
  else if (id == "TiposServicio")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-TiposServicio.html");
  else if (id == "CoreDiagnosticoCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-CoreDiagnosticoCl.html");
  else if (id == "TiposVacunaRNI")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-TiposVacunaRNI.html");
  else if (id == "NotasEncuentro")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-NotasEncuentro.html");
  else if (id == "EncounterCL")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-EncounterCL.html");
  else if (id == "DocumentoCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-DocumentoCl.html");
  else if (id == "CorePacienteCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-CorePacienteCl.html");
  else if (id == "RazonNOrealizarse")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-RazonNOrealizarse.html");
  else if (id == "CodigoPaises")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-CodigoPaises.html");
  else if (id == "NombreCampana")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-NombreCampana.html");
  else if (id == "CoreLocalizacionCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-CoreLocalizacionCl.html");
  else if (id == "ImmunizationCL")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-ImmunizationCL.html");
  else if (id == "BundleCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-BundleCl.html");
  else if (id == "IdContacto")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-IdContacto.html");
  else if (id == "CoreMedicamentoCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-CoreMedicamentoCl.html");
  else if (id == "ProvinciasCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-ProvinciasCl.html");
  else if (id == "AuditEventCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-AuditEventCl.html");
  else if (id == "ObservacionesDiagnostico")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-ObservacionesDiagnostico.html");
  else if (id == "SegundoApellido")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-SegundoApellido.html");
  else if (id == "CorePrestadorCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-CorePrestadorCl.html");
  else if (id == "cl-address")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-cl-address.html");
  else if (id == "CoreOrganizacionCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-CoreOrganizacionCl.html");
  else if (id == "RegionesCl")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/1.8.4/StructureDefinition-RegionesCl.html");
  else if (id == "index")
    Response.Redirect("https://hl7chile.cl/fhir/ig/clcore/StructureDefinition.html");

%>

<!DOCTYPE html>
<html>
<body>
Internal Error - unknown id <%= Request.QueryString("id") %> (from /clcore/1.8.4/crstructuredefinition.asp) .
</body>
</html>
