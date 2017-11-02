/**
 * 
 */
package dev.sgp.web;

import java.io.IOException;
import java.util.Arrays;
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
public class ListerCollaborateursController extends HttpServlet {
	// recuperation du service
	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*// A ajouter
		req.setAttribute("listeNoms", Arrays.asList("Robert", "Jean", "Hugues"));*/
		// utilisation du service
		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
		req.setAttribute("listeNoms", collaborateurs);
		
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp").forward(req, resp);	
	}
	/* (non-Javadoc)
	 * @see javax.servlet.http.HttpServlet#doPost(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp").forward(req, resp);	
		}
	
}
