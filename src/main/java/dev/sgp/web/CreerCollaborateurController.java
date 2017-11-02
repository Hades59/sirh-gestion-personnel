package dev.sgp.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.service.CollaborateurService;
import dev.sgp.util.Constantes;

public class CreerCollaborateurController extends HttpServlet {
	// recuperation du service
	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/views/collab/creerCollaborateur.jsp").forward(req, resp);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String nom = req.getParameter("Nom");
		String prenom = req.getParameter("Prenom");
//		String dateN = req.getParameter("DateN");
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		String adresse = req.getParameter("Adresse");
		String numSecu = req.getParameter("NumSecu");
		
		Collaborateur collab = new Collaborateur();
		collab.setNom(nom);
		collab.setPrenom(prenom);
//		collab.setDateNaiss(dateN);
		collab.setAdresse(adresse);
		collab.setNumSecuSoc(numSecu);
		collabService.sauvegarderCollaborateur(collab);

		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
		req.setAttribute("listeNoms", collaborateurs);

		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp").forward(req, resp);
	}

	/**
	 * @param paramMap
	 * @param resp
	 * @return
	 * @throws IOException
	 */
	protected boolean Verify(Map<String, String[]> paramMap, HttpServletResponse resp) throws IOException {
		StringBuilder error = new StringBuilder();
		if (paramMap.get("nom") == null || !Pattern.matches("[a-zA-Z]+", paramMap.get("nom")[0])) {
			error.append("<Nom> n'est pas complété ou incorrect.");
			return false;
		}
		if (paramMap.get("prénom") == null || !Pattern.matches("[a-zA-Z]+", paramMap.get("prénom")[0])) {
			error.append("<Pénom> n'est pas complété ou incorrect.");
			return false;
		}
		if (paramMap.get("adresse") == null || !Pattern.matches("[a-zA-Z0-9]+", paramMap.get("adresse")[0])) {
			error.append("<Adresse> n'est pas complété ou incorrect.");
			return false;
		}
		if (paramMap.get("numSécu") == null || !Pattern.matches("([0-9]){15}", paramMap.get("numSécu")[0])) {
			error.append("<NumSécu> n'est pas complété ou incorrect.");
			return false;
		}
		return true;
	}
}
