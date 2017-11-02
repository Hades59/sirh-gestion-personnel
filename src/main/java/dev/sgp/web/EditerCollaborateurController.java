/**
 * 
 */
package dev.sgp.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.service.CollaborateurService;
import dev.sgp.util.Constantes;

/**
 * @author ETY3
 *
 */
public class EditerCollaborateurController extends HttpServlet{
	// recuperation du service
		private CollaborateurService collabService = Constantes.COLLAB_SERVICE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// recupere la valeur d'un parametre dont le nom est matricule
//		String err = "";
//		String matriculeParam = req.getParameter("matricule");
//		if(matriculeParam == null){
//			err += "Un matricule est attendu";
//		}
//		String titreParam = req.getParameter("titre");
//		if(titreParam == null){
//			err += "Un titre est attendu";
//		}
//		String nomParam = req.getParameter("nom");
//		if(nomParam  == null){
//			err += "Un nom est attendu";
//		}
//		String prenomParam = req.getParameter("prenom");
//		if(prenomParam  == null){
//			err += "Un prenom est attendu";
//		}
//		if(err.length() == 0){
//			resp.sendError(400, err);
//		}
//		else{
//			resp.setContentType("text/html");
//			// code HTML ecrit dans le corps de la reponse
//			resp.getWriter().write("<h1>Edition de collaborateur</h1>" + "<ul>" + "<li>Matricule : " + matriculeParam
//					+ "</li>" + "<li>Titre: " + titreParam + "</li>" + "<li>Nom: " + nomParam + "</li>" + "<li>Prenom: " + prenomParam + "</li>" + "</ul>");
//		}
		Collaborateur collab = Constantes.COLLAB_SERVICE.listerCollaborateurs()
				.stream()
				.filter(c->c.getId() == Integer.parseInt(req.getParameter("id")))
				.findFirst()
				.get();
		req.setAttribute("col", collab);
		req.getRequestDispatcher("/WEB-INF/views/collab/editerCollaborateurs.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		//doTeg(req, resp);
//		
//		String nom = req.getParameter("Nom");
//		String prenom = req.getParameter("Prenom");
////		String dateN = req.getParameter("DateN");
//		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
//		String adresse = req.getParameter("Adresse");
//		String numSecu = req.getParameter("NumSecu");
//		
//		Collaborateur collab = new Collaborateur();
//		collab.setNom(nom);
//		collab.setPrenom(prenom);
////		collab.setDateNaiss(dateN);
//		collab.setAdresse(adresse);
//		collab.setNumSecuSoc(numSecu);
//		collabService.sauvegarderCollaborateur(collab);
//
//		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
//		req.setAttribute("listeNoms", collaborateurs);
//
//		req.getRequestDispatcher("/WEB-INF/views/collab/editerCollaborateurs.jsp").forward(req, resp);
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp").forward(req, resp);
	}
}
