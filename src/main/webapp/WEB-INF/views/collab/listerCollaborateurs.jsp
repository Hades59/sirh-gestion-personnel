<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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
	<div class="form-row">
		<div class="col-sm">
			<button type="button" id="btn-Creer" class="btn btn-outline-dark"
				data-toggle="modal" data-target="#exampleModalLong">
				<a href="nouveau.html"> Ajouter un nouveau collaborateur</a>
			</button>
		</div>
	</div>
	<h1>Les collaborateurs</h1>
	<!-- Partie recherche -->
	<form>
		<div class="row">
			<div class="form-group col-5">
				<label for="recherche" class="form-label float-right">Recherche
					un nom ou un prenom qui commence par :</label>
			</div>
			<div class="form-group col-2">
				<input type="text" class="form-control float-left"
					id="btn-Recherche">
			</div>
			<div class="form-group col-1">
				<button type="button" id="btn-Recherche"
					class="btn btn-outline-dark">Rechercher</button>
			</div>
			<div class="form-group col-1">
				<input type="checkbox" id="collabDesac" class="float-right"
					aria-label="Voir les collaborateurs désactivés">
			</div>
			<div class="form-group col-3">
				<label for="collabDesac">Voir les collaborateurs désactivés</label>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-5">
				<label for="filtre" class="form-label float-right">Filtrer
					par département :</label>
			</div>
			<div class="form-group col-3">
				<select id="filtre" class="form-control">
					<option selected>Tous</option>
					<option value="Compta">Comptabilité</option>
					<option value="RH">Ressources Humaines</option>
					<option value="Infor">Informatique</option>
				</select>
			</div>
		</div>
	</form>
	<!-- Partie fiches -->
	<div class="form-group col">
		<!-- Fiche 1 -->
		<div class="form-group card" style="width: 20rem">
			<!-- En-tête -->
			<div class="card-header">
				<h5>NOM Prénom</h5>
			</div>
			<!-- Contenu -->
			<div class="col text-center">
				<!-- Photo -->
				<div>
					<img class="form-group mt-3 mb-3 mr-3 ml-3"
						src=photos-Main-Coon.jpg " width=100px height=150px>
				</div>
				<div class="col"></div>
				<!-- Info -->
				<div class="col">
					<div class="form-group row">Fonction:</div>
					<div class="form-group row">Département:</div>
					<div class="form-group row">Email:</div>
					<div class="form-group row">Téléphone:</div>
				</div>
				<!-- Bouton Editer -->
				<div class="form-group col-sm">
					<button type="button" id="btn-Creer" class="btn btn-outline-dark"
						href="nouveau.html" data-toggle="modal"
						data-target="#exampleModalLong">
						<a href="creer.html"> Éditer</a>
					</button>
				</div>
			</div>
		</div>
	</div>
	<ul>
		<%
			List<String> listeNoms = (List<String>) request.getAttribute("listeNoms");
			for (String nom : listeNoms) {
		%>
		<li><%=nom%></li>
		<%
			}
		%>
	</ul>
</body>
<style>
#btn-Creer {
	float: right;
}
</style>
</html>