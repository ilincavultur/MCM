import java.util.Scanner;

import org.apache.jena.rdf.model.Model;

public class Main {

	static FilesReader reader = new FilesReader();
	static MetadataReader metadataReader = new MetadataReader();
	static RDFmodel rdfModel = new RDFmodel();
	static SPARQLqueries query = new SPARQLqueries();

	public static void main(String[] args) {

		Scanner inputScanner = new Scanner(System.in);

		System.out.println("Please provide absolute path to desired folder :");

		String path = inputScanner.nextLine();

		System.out.println("Path to folder provided is: " + path);
		
		inputScanner.close();

		reader.readFolder(path);

		// read jpeg files
		metadataReader.readJpegMetadata(reader.getJpegFiles());
		
		// print jpeg data
		metadataReader.printJpegExifMetadata();
		metadataReader.printJpegIptcMetadata();

		// read pdf files
		metadataReader.readPDFMetadata(reader.getPdfFiles());
		
		// print pdf data
		metadataReader.printPdfXmpMetadata();
		metadataReader.printPdfDcMetadata();

		// utils
		rdfModel.setImageExif(metadataReader.getImageExif());
		rdfModel.setImageIptc(metadataReader.getImageIptc());
		rdfModel.setPdfXmp(metadataReader.getPdfXmp());
		rdfModel.setPdfDc(metadataReader.getPdfDc());
		
		// get the model & save it to file
		Model model = rdfModel.createRDF();
		
		// utils 
		query.setModel(model);
		query.startQuery();
		
	}

}
