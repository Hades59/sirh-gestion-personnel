/**
 * 
 */
package dev.sgp.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author ETY3
 *
 */
public class EditerCollaborateurController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doTeg(req, resp);
	}
	/**
	 * @param req
	 * @param resp
	 * @throws IOException
	 */
	private void doTeg(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		// recupere la valeur d'un parametre dont le nom est matricule
		String matriculeParam = req.getParameter("matricule");
		if(matriculeParam == null){
			resp.sendError(400, "Un matricule est attendu");
		}
		String titreParam = req.getParameter("titre");
		if(titreParam == null){
			resp.sendError(400, "Un titre est attendu");
		}
		String nomParam = req.getParameter("nom");
		if(nomParam  == null){
			resp.sendError(400, "Un nom est attendu");
		}
		String prenomParam = req.getParameter("prenom");
		if(prenomParam  == null){
			resp.sendError(400, "Un prenom est attendu");
		}else{
		resp.setContentType("text/html");
		// code HTML ecrit dans le corps de la reponse
		resp.getWriter().write("<h1>Edition de collaborateur</h1>" + "<ul>" + "<li>Matricule : " + matriculeParam
				+ "</li>" + "<li>Titre: " + titreParam + "</li>" + "<li>Nom: " + nomParam + "</li>" + "<li>Prenom: " + prenomParam + "</li>" + "</ul>");
		}
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doTeg(req, resp);
	}
}
