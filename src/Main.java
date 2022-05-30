import java.util.Scanner;

// /Users/ilincavultur/Desktop/6. Semester/MCM/11925311-ilinca-vultur/src
public class Main {

	static FilesReader reader = new FilesReader();
	static MetadataReader metadataReader = new MetadataReader();
	static RDFmodel rdfModel = new RDFmodel();

	public static void main(String[] args) {
		// Task 1

		Scanner inputScanner = new Scanner(System.in);

		System.out.println("Please provide absolute path to desired folder :");

		String path = inputScanner.nextLine();

		System.out.println("Path to folder provided is: " + path);
		
		inputScanner.close();

		reader.readFolder(path);

		metadataReader.readJpegMetadata(reader.getJpegFiles());
		metadataReader.printJpegExifMetadata();

		// metadataReader.printJpegIptcMetadata();

		metadataReader.readPDFMetadata(reader.getPdfFiles());
		//metadataReader.printPdfXmpMetadata();
		// metadataReader.printPdfDcMetadata();

		rdfModel.setImageExif(metadataReader.getImageExif());
		rdfModel.setImageIptc(metadataReader.getImageIptc());
		rdfModel.setPdfXmp(metadataReader.getPdfXmp());
		rdfModel.setPdfDc(metadataReader.getPdfDc());
		rdfModel.createRDF();
		
		
	}

}
