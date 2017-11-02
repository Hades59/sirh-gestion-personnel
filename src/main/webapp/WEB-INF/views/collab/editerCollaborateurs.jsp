<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible">
<title>SGP App</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
	integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
	integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
	crossorigin="anonymous"></script>

</head>

<body class="container-fluid">
	<!-- Barre de navigation -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Log</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="lister.html">Collaborateurs <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="statistiques.html">Statistiques</a></li>
				<li class="nav-item"><a class="nav-link" href="activites.html">Activités</a>
				</li>
			</ul>
		</div>
	</nav>
	<script type="text/javascript"> 
	$(document).ready(function() {

		$("#btn-Svg").on("click", function(e) {
			$("#typeCivilite").html($("#civilite").val());
			$("#typeNom").html($("#formNom").val());
			$("#typePrenom").html($("#formPrenom").val());
			$("#typeDateN").html($("#formDateN").val());
			$("#typeAdr").html($("#formAdr").val());
			$("#typeNumSecu").html($("#formNumSecu").val());
			$("#typeTel").html($("#formTel").val());
			$("#typeDept").html($("#formDept").val());
			$("#typeNomFonct").html($("#formNomFonct").val());
			$("#typeIBAN").html($("#formIBAN").val());
			$("#typeBIC").html($("#formBIC").val());
		});		
	});
	
	function Svg(){
		document.forms[0].action="<%=request.getContextPath()%>/collaborateurs/editer";
		document.forms[0].method = "POST";
		document.forms[0].submit();
	};
	
// 	function NewPictures(){
<%-- 		document.forms[0].action="<%=request.getContextPath()%>/collaborateurs/editer"; --%>
// 		document.forms[0].method = "POST";
// 		document.forms[0].submit();
// 	}
	</script>
	<form class="col-sm-8">
		<!-- Photo -->
		<div class="form-group col text-center align-middle">
			<div>
				<button class="" title="Modifier la photo" onClick="NewPictures();">
					<div>
						<img class="form mt-3 mb-3 mr-3 ml-3"
							src="../image/photos-Main-Coon.jpg" alt="" width=200px
							height=300px>
					</div>
				</button>
			</div>
		</div>
		<div class="form-group col text-left">
			<%
				Collaborateur collab = (Collaborateur) request.getAttribute("col");
			%>
			<div class="form-group row">
				<div class="form-group col">
					<h2><%=collab.getNom()%>
						<%=collab.getPrenom()%>
						-
						<%=collab.getMatricule()%>
					</h2>
				</div>
				<div class="form-group col">
					<div class="form-group row">
						<div class="form-group col text-left">
							<input type="checkbox" id="Desac" class="form-group row"
								aria-label="Désactiver">
						</div>
						<div class="form-group col text-right">
							<label class="form-group row" for="Desac">Désactiver</label>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Info -->
		<div id="accordion" role="tablist">
			<div class="card">
				<div class="card-header" role="tab" id="headingIdentite">
					<h5 class="mb-0">
						<a data-toggle="collapse" href="#collapseIdentite"
							aria-expanded="false" aria-controls="collapseIdentite">
							Identité </a>
					</h5>
				</div>
			</div>
		</div>
		<div id="collapseIdentite" class="collapse " role="tabpanel"
			aria-labelledby="headingOne" data-parent="#accordion">
			<div class="card-body">
				<div class="form-group row">
					<div class="form-group col-sm-3">
						<label for="civilite" class="form-label">Civilité</label>
					</div>
					<div class="form-group col-sm-7">
						<select id="civilite" class="form-control">
							<option></option>
							<option>Mlle</option>
							<option>Mme</option>
							<option>Mr</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label for="formNom" class="col-sm-3">Nom</label>
					<div class="col-sm-9">
						<input type="text" class="col-sm-9" id="formNom"
							value="<%=collab.getNom()%>" placeholder="" required>
						<div class="invalid-feedback">Le nom est obligatoire.</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="formPrenom" class="col-sm-3">Prénom</label>
					<div class="col-sm-9">
						<input type="text" class="col-sm-9" id="formPrenom"
							value="<%=collab.getPrenom()%>" placeholder="" required>
						<div class="invalid-feedback">Le nom est obligatoire.</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="formDateN" class="col-sm-3">Date de naissance</label>
					<div class="col-sm-9">
						<div class="col-sm-9" id="formDateN"><%=collab.getDateNaiss()%></div>
						<div class="invalid-feedback">La date de naissance est
							obligatoire.</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="formAdr" class="col-sm-3">Adresse</label>
					<div class="col-sm-9">
						<input type="text" id="formAdr" class="col-sm-9" rows="3"
							value="<%=collab.getAdresse()%>" placeholder="" required>
						<div class="invalid-feedback">L'adresse est obligatoire.</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="formNumSecu" class="col-sm-3">Numéro de
						sécurité social</label>
					<div class="col-sm-9">
						<input type="text" class="col-sm-9" id="formNumSecu"
							value="<%=collab.getNumSecuSoc()%>" placeholder="" required>
						<div class="invalid-feedback">Le numéro de sécurité social
							est obligatoire.</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="formTel" class="col-sm-3">Téléphone</label>
					<div class="col-sm-9">
						<input type="text" class="col-sm-9" id="formTel" placeholder=""
							required>
						<div class="invalid-feedback">Le numéro de téléphone est
							obligatoire.</div>
					</div>
				</div>
			</div>
		</div>
		<div id="accordion" role="tablist">
			<div class="card">
				<div class="card-header" role="tab" id="headingPoste">
					<h5 class="mb-0">
						<a data-toggle="collapse" href="#collapsePoste"
							aria-expanded="false" aria-controls="collapsePoste"> Poste </a>
					</h5>
				</div>
			</div>
		</div>
		<div id="collapsePoste" class="collapse" role="tabpanel"
			aria-labelledby="headingOne" data-parent="#accordion">
			<div class="card-body">
				<div class="form-group row">
					<label for="formDept" class="col-sm-3">Département</label>
					<div class="col-sm-9">
						<div class="form-group col-sm-9">
							<select id="dept" class="form-control">
								<option selected></option>
								<option value="Compta">Comptabilité</option>
								<option value="RH">Ressources Humaines</option>
								<option value="Infor">Informatique</option>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="formNomFonct" class="col-sm-3">Nom</label>
					<div class="col-sm-9">
						<input type="text" class="col-sm-9" id="formNomFonct">
					</div>
				</div>
			</div>
		</div>
		<div id="accordion" role="tablist">
			<div class="card">
				<div class="card-header" role="tab" id="headingCoordBanc">
					<h5 class="mb-0">
						<a data-toggle="collapse" href="#collapseCoordBanc"
							aria-expanded="false" aria-controls="collapseCoordBanc">
							Coordonées Bancaires </a>
					</h5>
				</div>
			</div>
			<div id="collapseCoordBanc" class="collapse" role="tabpanel"
				aria-labelledby="headingOne" data-parent="#accordion">
				<div class="card-body">
					<div class="form-group row">
						<label for="formIBAN" class="col-sm-3">IBAN</label>
						<div class="col-sm-9">
							<input type="text" class="col-sm-12" id="formIBAN" placeholder=""
								required>
							<div class="invalid-feedback">L'IBAN est obligatoire.</div>
						</div>
					</div>
					<div class="form-group row">
						<label for="formBIC" class="col-sm-3">BIC</label>
						<div class="col-sm-9">
							<input type="text" class="col-sm-12" id="formBIC" placeholder=""
								required>
							<div class="invalid-feedback">Le BIC est obligatoire.</div>
						</div>
					</div>
				</div>
			</div>
			<div class="form-group col-sm">
				<!-- 			<button type="button" id="btn-Svg" onClick="Svg();" -->
				<%-- 				class="float-right btn btn-outline-dark" href="<%=request.getContextPath()%>/collaborateurs/lister" --%>
				<!-- 				data-toggle="modal" data-target="#exampleModalLong"> -->
				<!-- 				Sauvegarder</button> -->
				<a href=""
					<%=request.getContextPath()%>/collaborateurs/lister" class="float-right btn btn-outline-dark"
					onClick="Svg();">Sauvegarder</a>
			</div>
		</div>
	</form>
</body>

</html>