import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;
import org.apache.jena.rdf.model.Model;
import org.apache.jena.rdf.model.ModelFactory;
import org.apache.jena.rdf.model.Resource;
import org.apache.jena.riot.Lang;
import org.apache.jena.riot.RDFDataMgr;
import org.apache.jena.rdf.model.Property;

public class RDFmodel {
	
	private String URI = "http://somewhere/";
	private String exifURI = "http://www.w3.org/2003/12/exif/ns/";
	private String iptcURI = "http://cv.iptc.org/newscodes/subjectcode/"; 
	private String xmpURI =  "http://ns.adobe.com/xap/";
	private String dcURI = "http://purl.org/dc/elements/1.1/";
	
	Map<String, Map<String, String>> imageExif = new HashMap<String, Map<String, String>>();
	Map<String, Map<String, String>> imageIptc = new HashMap<String, Map<String, String>>();
	Map<String, Map<String, String>> pdfXmp = new HashMap<String, Map<String, String>>();
	Map<String, Map<String, String>> pdfDc = new HashMap<String, Map<String, String>>();

	public RDFmodel() {
		super();
	}
	
	public void setImageExif(Map<String, Map<String, String>> imageExif) {
		this.imageExif = imageExif;
	}


	public void setImageIptc(Map<String, Map<String, String>> imageIptc) {
		this.imageIptc = imageIptc;
	}

	public void setPdfXmp(Map<String, Map<String, String>> pdfXmp) {
		this.pdfXmp = pdfXmp;
	}

	public void setPdfDc(Map<String, Map<String, String>> pdfDc) {
		this.pdfDc = pdfDc;
	}

	public Model createRDF() {

		Model rdfModel = ModelFactory.createDefaultModel();
		
		rdfModel.setNsPrefix("ex", exifURI);
		rdfModel.setNsPrefix("ip", iptcURI);
		rdfModel.setNsPrefix("xmp", xmpURI);
		rdfModel.setNsPrefix("dc", dcURI);

		for (Map.Entry<String, Map<String, String>> entry : imageExif.entrySet()) {
			
			
			Resource img = rdfModel.createResource(URI + entry.getKey());
			
			Property analyzedBy = rdfModel.createProperty(URI + "AnalyzedBy");
			rdfModel.add(img, analyzedBy, "11925311");
		
			//img.addProperty(RDF.type, "analyzedBy: 11925311");
		
			for (Map.Entry<String, String> exifEntry : entry.getValue().entrySet()) {
				if (!exifEntry.getKey().toString().replaceAll("\\s+","").contains("Unknowntag")) {
					Property exifProperty = rdfModel.createProperty(exifURI + exifEntry.getKey().toString().replaceAll("\\s+",""));	
					rdfModel.add(img, exifProperty, exifEntry.getValue());
				}
				
			}
				
		}
		
		for (Map.Entry<String, Map<String, String>> entry : imageIptc.entrySet()) {
				
			Resource img = rdfModel.createResource(URI + entry.getKey());
			Property analyzedBy = rdfModel.createProperty(URI + "AnalyzedBy");
			rdfModel.add(img, analyzedBy, "11925311");
			
			for (Map.Entry<String, String> iptcEntry : entry.getValue().entrySet()) {
				
				Property iptcProperty = rdfModel.createProperty(iptcURI + iptcEntry.getKey().toString().replaceAll("\\s+",""));
				rdfModel.add(img, iptcProperty, iptcEntry.getValue());

			}

		}
		
		for (Map.Entry<String, Map<String, String>> entry : pdfXmp.entrySet()) {
			
			
			Resource pdf = rdfModel.createResource(URI + entry.getKey());
			Property analyzedBy = rdfModel.createProperty(URI + "AnalyzedBy");
			rdfModel.add(pdf, analyzedBy, "11925311");
			
			for (Map.Entry<String, String> xmpEntry : entry.getValue().entrySet()) {
				
				Property xmpProperty = rdfModel.createProperty(xmpURI + xmpEntry.getKey().toString().replaceAll("\\s+",""));
				rdfModel.add(pdf, xmpProperty, xmpEntry.getValue());

			}
			
			
			
		}
		
		for (Map.Entry<String, Map<String, String>> entry : pdfDc.entrySet()) {
			
			Resource pdf = rdfModel.createResource(URI + entry.getKey());
			Property analyzedBy = rdfModel.createProperty(URI + "AnalyzedBy");
			rdfModel.add(pdf, analyzedBy, "11925311");
			
			for (Map.Entry<String, String> dcEntry : entry.getValue().entrySet()) {
				
				Property dcProperty = rdfModel.createProperty(dcURI + dcEntry.getKey().toString().replaceAll("\\s+",""));
				rdfModel.add(pdf, dcProperty, dcEntry.getValue());
	
			}
			
			
			
		}
		System.out.println("RDF");
		PrintStream fileStream;
		try {
			fileStream = new PrintStream("src/result.rdf");
			System.setOut(fileStream);
			RDFDataMgr.write(System.out, rdfModel, Lang.RDFXML);
		} catch (FileNotFoundException e) {
		
			e.printStackTrace();
		}
		
		
		//rdfModel.write(System.out);
		
		return rdfModel;
		
	}

}
