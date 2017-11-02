/**
 * 
 */
package dev.sgp.entite;

import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.util.ResourceBundle;

/**
 * @author ETY3
 *
 */
public class Collaborateur {

	static Integer globalId = 0;
	/** id : Integer */
	Integer id;
	/** matricule : String */
	String matricule;
	/** nom : String */
	String nom;
	/** prenom : String */
	String prenom;
	/** dateNaiss : LocalDate */
	LocalDate dateNaiss;
	/** adresse : String */
	String adresse;
	/** numSecuSoc : String */
	String numSecuSoc;
	/** tel : String */
	String tel;
	/** emailPro : String */
	String emailPro;
	/** photo : String */
	String photo;
	/** dateHeureCreation : ZonedDateTime */
	ZonedDateTime dateHeureCreation;
	/** actif : Boolean */
	Boolean actif;
	
	
	
	/**
	 * 
	 */
	public Collaborateur() {
		super();
		this.id = globalId++;
	}
	/** Getter for matricule
	 * @return the matricule
	 */
	public String getMatricule() {
		return matricule;
	}
	/** Setter for matricule
	 * @param matricule the matricule to set
	 */
	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}
	/** Getter for nom
	 * @return the nom
	 */
	public String getNom() {
		return nom;
	}
	/** Setter for nom
	 * @param nom the nom to set
	 */
	public void setNom(String nom) {
		this.nom = nom;
	}
	/** Getter for prenom
	 * @return the prenom
	 */
	public String getPrenom() {
		return prenom;
	}
	/** Setter for prenom
	 * @param prenom the prenom to set
	 */
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	/** Getter for dateNaiss
	 * @return the dateNaiss
	 */
	public LocalDate getDateNaiss() {
		return dateNaiss;
	}
	/** Setter for dateNaiss
	 * @param dateNaiss the dateNaiss to set
	 */
	public void setDateNaiss(LocalDate dateNaiss) {
		this.dateNaiss = dateNaiss;
	}
	/** Getter for adresse
	 * @return the adresse
	 */
	public String getAdresse() {
		return adresse;
	}
	/** Setter for adresse
	 * @param adresse the adresse to set
	 */
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	/** Getter for numSecuSoc
	 * @return the numSecuSoc
	 */
	public String getNumSecuSoc() {
		return numSecuSoc;
	}
	/** Setter for numSecuSoc
	 * @param numSecuSoc the numSecuSoc to set
	 */
	public void setNumSecuSoc(String numSecuSoc) {
		this.numSecuSoc = numSecuSoc;
	}
	/** Getter for emailPro
	 * @return the emailPro
	 */
	public String getEmailPro(String nom, String prenom) {
		this.nom=nom;
		this.prenom=prenom;
		emailPro = nom.toLowerCase()+"."+prenom.toLowerCase()+"@"+ResourceBundle.getBundle("contact").getString("society");
		return emailPro;
	}
	
	public String getEmailPro(){
		return this.emailPro;
	}
	/** Setter for emailPro
	 * @param emailPro the emailPro to set
	 */
	public void setEmailPro(String emailPro) {
		this.emailPro = emailPro;
	}
	/** Getter for photo
	 * @return the photo
	 */
	public String getPhoto() {
		return photo;
	}
	/** Setter for photo
	 * @param photo the photo to set
	 */
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	/** Getter for dateHeureCreation
	 * @return the dateHeureCreation
	 */
	public ZonedDateTime getDateHeureCreation() {
		return dateHeureCreation;
	}
	/** Setter for dateHeureCreation
	 * @param dateHeureCreation the dateHeureCreation to set
	 */
	public void setDateHeureCreation(ZonedDateTime dateHeureCreation) {
		this.dateHeureCreation = dateHeureCreation;
	}
	/** Getter for actif
	 * @return the actif
	 */
	public Boolean getActif() {
		return actif;
	}
	/** Setter for actif
	 * @param actif the actif to set
	 */
	public void setActif(Boolean actif) {
		this.actif = actif;
	}
	/** Getter for id
	 * @return the id
	 */
	public Integer getId() {
		return id;
	}
	/** Setter for id
	 * @param id the id to set
	 */
	public void setId(Integer id) {
		this.id = id;
	}
	/**
	 * @return the tel
	 */
	public String getTel() {
		return tel;
	}
	/**
	 * @param tel the tel to set
	 */
	public void setTel(String tel) {
		this.tel = tel;
	}
}
