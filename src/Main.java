import java.util.Scanner;

public class Main {

	static FilesReader reader = new FilesReader();
	static MetadataReader metadataReader = new MetadataReader();
	
	public static void main(String[] args) {
		// Task 1
		
		Scanner inputScanner = new Scanner(System.in);
		
		System.out.println("Please provide absolute path to desired folder :");
		
		String path = inputScanner.nextLine();
		
		System.out.println("Path to folder provided is: " + path);
		
		
		
		reader.readFolder(path);
		
		//metadataReader.setJpegFiles(reader.getJpegFiles());
		//metadataReader.setPdfFiles(reader.getPdfFiles());
		
		metadataReader.readJpegMetadata(reader.getJpegFiles());
		metadataReader.printJpegMetadata();
	}

}
