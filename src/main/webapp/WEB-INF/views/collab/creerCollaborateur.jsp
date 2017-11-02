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
					href="listeCollaborateurs.jsp">Collaborateurs <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="statistiques.html">Statistiques</a></li>
				<li class="nav-item"><a class="nav-link" href="activites.html">Activités</a>
				</li>
			</ul>
		</div>
	</nav>
	<h1>Nouveau Collaborateur</h1>

	<script>
		$(document).ready(function() {

			$("#btn-Creer").on("click", function(e) {
				$("#typeNom").html($("#formNom").val());
				$("#typePrenom").html($("#formPrenom").val());
				$("#typeDateN").html($("#formDateN").val());
				$("#typeAdr").html($("#formAdr").val());
				$("#typeNumSecu").html($("#formNumSecu").val());
			});
			$("#formNom").on('focusout', function(event) {
				if ($('#formNom').val() == '') {
					alert('Le nom est obligatoire.');
					event.preventDefault();
					return false;
				}
			});
			$("#formPrenom").on('focusout', function(event) {
				if ($('#formPrenom').val() == '') {
					alert('Le prenom est obligatoire.');
					event.preventDefault();
					return false;
				}
			});
		});
		function valider(){
			document.forms[0].action="<%=request.getContextPath()%>/collaborateurs/creer";
			document.forms[0].method = "POST";
			document.forms[0].submit();
		}
	</script>
	<!-- Formulaire -->
	<form class="col-sm-8">
		<div class="form-group row">
			<label for="formNom" class="col-sm-2">Nom</label>
			<div class="col-sm-9">
				<input type="text" class="col-sm-9" id="formNom" name="Nom"
					placeholder="" required>
				<div class="invalid-feedback">Le nom est obligatoire.</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="formPrenom" class="col-sm-2">Prénom</label>
			<div class="col-sm-9">
				<input type="text" class="col-sm-9" id="formPrenom" name="Prenom"
					placeholder="" required>
				<div class="invalid-feedback">Le prénom est obligatoire.</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="formDateN" class="col-sm-2">Date de naissance</label>
			<div class="col-sm-9">
				<input type="date" class="col-sm-9" id="formDateN" name="DateN" placeholder=""
					required>
				<div class="invalid-feedback">La date de naissance est	obligatoire.</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="formAdr" class="col-sm-2">Adresse</label>
			<div class="col-sm-9">
				<input type="text" id="formAdr" class="col-sm-9" rows="3" name="Adresse"
					placeholder="" required>
				<div class="invalid-feedback">L'adresse est obligatoire.</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="formNumSecu" class="col-sm-2">Numéro de sécurité
				social</label>
			<div class="col-sm-9">
				<input type="text" class="col-sm-9" id="formNumSecu" name="NumSecu"
					placeholder="" required>
				<div class="invalid-feedback">Le numéro de sécurité social est
					obligatoire.</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-sm-9">
				<button type="button" id="btn-Creer" class="btn btn-outline-dark"
					data-toggle="modal" data-target="#exampleModalLong">Créer</button>
			</div>
		</div>
		<!-- Vérification création formulaire -->
		<div class="modal fade" id="exampleModalLong" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLongTitle"
			aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle">Création
							d'un collaborateurs</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col">
								<div class="row">
									<div class="col">Nom:</div>
									<div id="typeNom" class="col"></div>
								</div>
								<div class="row">
									<div class="col">Prénom:</div>
									<div id="typePrenom" class="col"></div>
								</div>
								<div class="row">
									<div class="col">Date de Naissance:</div>
									<div id="typeDateN" class="col"></div>
								</div>
								<div class="row">
									<div class="col">Adresse:</div>
									<div id="typeAdr" class="col"></div>
								</div>
								<div class="row">
									<div class="col">Numéro de Sécurité Social:</div>
									<div id="typeNumSecu" class="col"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="button" onClick="valider();" class="btn btn-primary">Save
							changes</button>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
<style>
#btn-Creer {
	float: right;
}
</style>

</html>