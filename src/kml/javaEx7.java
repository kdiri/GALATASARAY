package kml;

import java.sql.*;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.StringTokenizer;
import java.io.File;
import com.hp.hpl.jena.sparql.expr.*;
import com.hp.hpl.jena.sparql.pfunction.library.str;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Writer;

import com.hp.hpl.jena.ontology.OntModel;
import com.hp.hpl.jena.ontology.OntModelSpec;
import com.hp.hpl.jena.ontology.ProfileRegistry;
import com.hp.hpl.jena.sparql.*;
import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryParseException;
import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.query.ResultSetFormatter;
import com.hp.hpl.jena.rdf.model.Literal;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import com.hp.hpl.jena.rdf.model.RDFWriter;
import com.hp.hpl.jena.util.FileManager;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.log4j.*;

public class javaEx7 {

	public void function() throws IOException, ClassNotFoundException,
			SQLException, InterruptedException {

		org.apache.log4j.BasicConfigurator.configure();

		String NS = "http://localhost/owl/ontologies/university/#";
		// String NS = "http://localhost:8080/";
		String xmlbase = NS;
		// String file_name;
		/*
		 * Il faut créer un modèle dehors de la boucle. Les autres qui sert à
		 * manipuler les fichiers, vont etre crée dans la boucle
		 */
		OntModel m = ModelFactory.createOntologyModel(ProfileRegistry.OWL_LANG);

		RDFWriter rdfw = m.getWriter("RDF/XML-ABBREV");
		rdfw.setProperty("xmlbase", xmlbase);
		rdfw.setProperty("relativeURIs", "");

		/*
		 * Normalement, JSP et Java doivent communiquer directement, mais ici,
		 * nous écrivons dans le fichier que nous avons defini le path. Ils
		 * ecrivent les données et puis les données sont supprimée par le JSP
		 * ou Java. Donc ce path doit etre modifiée pour les autres
		 * ordinateurs.
		 */

		FileInputStream fisTargetFile = new FileInputStream(new File(
				"C:/Users/user/Desktop/eclipse JEE/file__2/pass.txt"));
		String targetFileStr = IOUtils.toString(fisTargetFile, "UTF-8");

		/* Notre table de Hachage est pour trier les resultats */
		Hashtable<String, Integer> table = new Hashtable();
		String mot = targetFileStr;
		int nbOcc = 0;
		int counter = 0; // Pour calculer le nombre du fichier qui a le
							// résultat

		/*
		 * Ici, nous definissons le path où nous faisons le recherche. Donc
		 * tous les fichiers RDF se trouvent dans ce path
		 */
		File folder = new File(
				"C:/Users/user/Desktop/eclipse JEE/file project/");
		File[] listOfFiles = folder.listFiles();

		/*
		 * Notre requete pour comparer le mot recherchée, Ici nous disons que
		 * le mot recherchée peut etre un sujet ou un predicat ou bien un
		 * objet. D'après ces criteres nous avons ecri ce requete.
		 */
		String sparqlQuery = "PREFIX dc: <http://purl.org/dc/elements/1.1/> \n"
				+ "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> \n"
				+ "PREFIX owl: <http://www.w3.org/2002/07/owl#> \n"
				+ "PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> \n"
				+ "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> \n"
				+ "SELECT  * \n" + "{" + "{" + "SELECT  * \n"
				+ "WHERE { ?s ?p ?o . \n" + " FILTER (regex(str(?s), \""
				+ targetFileStr
				+ "\")) \n"
				+ "}"
				+ "}"
				+ "UNION"
				+ "{"
				+ "SELECT  * \n"
				+ "WHERE { ?s ?p ?o . \n"
				+ " FILTER (regex(str(?p), \""
				+ targetFileStr
				+ "\")) \n"
				+ "}"
				+ "}"
				+ "UNION"
				+ "{"
				+ "SELECT  * \n"
				+ "WHERE { ?s ?p ?o . \n"
				+ " FILTER (regex(str(?o), \""
				+ targetFileStr + "\")) \n" + "}" + "}" +

				"}";

		/* Ici, nous comptons le nombre d'occurrence d'un mot recherchée */
		String sparqlQ = "PREFIX dc: <http://purl.org/dc/elements/1.1/> \n"
				+ "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#> \n"
				+ "PREFIX owl: <http://www.w3.org/2002/07/owl#> \n"
				+ "PREFIX xsd: <http://www.w3.org/2001/XMLSchema#> \n"
				+ "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> \n"
				+ "SELECT  (count(DISTINCT *) AS ?C) \n" + "{" + "{"
				+ "SELECT  * \n" + "WHERE { ?s ?p ?o . \n"
				+ " FILTER (regex(str(?s), \""
				+ targetFileStr
				+ "\")) \n"
				+ "}"
				+ "}"
				+ "UNION"
				+ "{"
				+ "SELECT  * \n"
				+ "WHERE { ?s ?p ?o . \n"
				+ " FILTER (regex(str(?p), \""
				+ targetFileStr
				+ "\")) \n"
				+ "}"
				+ "}"
				+ "UNION"
				+ "{"
				+ "SELECT  * \n"
				+ "WHERE { ?s ?p ?o . \n"
				+ " FILTER (regex(str(?o), \""
				+ targetFileStr + "\")) \n" + "}" + "}" +

				"}";

		/*
		 * Pour chaque fichier, nous le lisons, et en executant les fonctions
		 * query, nous appliquons les requetes. Si le résultat est trouvé,
		 * nous ajoutons au table de hachage avec le nom de fichier et le nombre
		 * d'occurrence.
		 */
		for (int i = 0; i < listOfFiles.length; i++) {
			// if (file.isFile()){ Il peut y avoir des dossiers dans le path

			try {

				String ls = "C:/Users/user/Desktop/eclipse JEE/file project/"
						+ listOfFiles[i].getName();
				File file1 = new File(ls);
				FileReader reader = new FileReader(ls);
				OntModel model = ModelFactory.createOntologyModel(
						OntModelSpec.OWL_DL_MEM, null);
				model.read(reader, null);

				Query query = QueryFactory.create(sparqlQuery);
				QueryExecution qe = QueryExecutionFactory.create(query, model);
				ResultSet results = qe.execSelect();

				Query queryQ = QueryFactory.create(sparqlQ);
				QueryExecution qeQ = QueryExecutionFactory
						.create(queryQ, model);
				ResultSet resultsQ = qeQ.execSelect();

				if (results.hasNext() && resultsQ.hasNext()) {

					counter++;
					QuerySolution row = resultsQ.next();
					nbOcc = row.getLiteral("C").getInt();

					// totalCount=countResult.next().get("count").toString()
					//System.out.print(listOfFiles[i].getName());
					//ResultSetFormatter.out(System.out, results, query);
					//ResultSetFormatter.out(System.out, resultsQ, queryQ);

					System.out.println("1111111\n" + nbOcc + "11111\n11"
							+ nbOcc + "111111\n11" + nbOcc
							+ "11111\n111111111\n\n" + nbOcc);

					table.put(listOfFiles[i].getName(), new Integer(nbOcc));

					qe.close();
					qeQ.close();
				}

			} catch (Exception e) {
				e.printStackTrace();
			}

		}// for
		int min;
		String[] rankS = new String[table.size()];
		int[] rank = new int[table.size()]; // sayfa rankingi yapmak için

		Enumeration lesMots = table.keys();

		int h = 0;
		while (lesMots.hasMoreElements()) {

			rankS[h] = (String) lesMots.nextElement();
			rank[h] = ((Integer) table.get(rankS[h])).intValue();
			h++;
		}

		// sorting pour le ranking
		for (int k = 0; k < counter; k++) {
			min = k;
			for (int j = k + 1; j < table.size(); j++) {
				if (rank[j] < rank[min]) {
					min = j;
				}
			}

			int temp = rank[k];
			rank[k] = rank[min];
			rank[min] = temp;

			String tempo = rankS[k];
			rankS[k] = rankS[min];
			rankS[min] = tempo;

		}
		PrintWriter out2 = new PrintWriter(
				new BufferedWriter(
						new FileWriter(
								"C:/Users/user/Desktop/eclipse JEE/file__2/pass3.txt",
								false)));
		for (int l = (counter - 1); l >= 0; l--) {
			try (PrintWriter out = new PrintWriter(
					new BufferedWriter(
							new FileWriter(
									"C:/Users/user/Desktop/eclipse JEE/file__2/pass2.txt",
									true)))) {
				out.println("Le mot " + mot + " a �t� trouv� dans le fichier "
						+ rankS[l] + " : " + rank[l] + " fois");
				out2.println(mot+"/"+rankS[l]+"/"+rank[l]);
				
				
				
			} catch (IOException e) {
				// exception handling left as an exercise for the reader
			}
		}
		out2.close();
      
		while (lesMots.hasMoreElements()) {
			mot = (String) lesMots.nextElement();
			nbOcc = ((Integer) table.get(mot)).intValue();
			System.out.println("Le mot recherch� a �t� trouv� dans le fichier - " + mot + " - " + nbOcc
					+ " fois");
		}

		/*
		 * try(PrintWriter out = new PrintWriter(new BufferedWriter(new
		 * FileWriter("/home/kdiri/Desktop/TEZ/kemal/pass2.txt", true)))) {
		 * out.println(file.getName()); }catch (IOException e) { //exception
		 * handling left as an exercise for the reader }
		 */

		// }//while
	}

}