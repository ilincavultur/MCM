import org.apache.jena.query.Query;
import org.apache.jena.query.QueryExecution;
import org.apache.jena.query.QueryExecutionFactory;
import org.apache.jena.query.QueryFactory;
import org.apache.jena.query.QuerySolution;
import org.apache.jena.query.ResultSet;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.RDFNode;

public class SPARQLqueries {
	
	private Model model = null;
	
	public SPARQLqueries() {
		super();
	}
	
	public void setModel(Model model) {
		this.model = model;
	}


	public void startQuery() {

		String queryString = "PREFIX ex: <http://www.w3.org/2003/12/exif/ns/>"
				+ "SELECT ?DigitalZoomRatio WHERE { ?x ex:DigitalZoomRatio ?DigitalZoomRatio } ORDER BY ?DigitalZoomRatio DESC(?DigitalZoomRatio)";

		Query query = QueryFactory.create(queryString);
		
		
		QueryExecution qexec = QueryExecutionFactory.create(query, model);
		{
		
		
		try {
			ResultSet results = qexec.execSelect(); 
		for ( ; results.hasNext() ; )
			{
				QuerySolution soln = results.nextSolution() ;
				RDFNode x = soln.get("DigitalZoomRatio") ; // Get a result variable by name. Resource r = soln.getResource("VarR") ; // Get a result variable (resource) Literal l = soln.getLiteral("VarL") ; // Get a result variable (literal)
				System.out.println(x);
			}
		} finally { qexec.close() ; } }
	}
	

}
