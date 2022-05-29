import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;


//import org.apache.pdfbox.Loader;
import org.apache.pdfbox.pdmodel.PDDocument;
//import org.apache.pdfbox.pdmodel.PDDocument;

public class FilesReader {
	
	// Task 1

	//private List<BufferedImage> jpegFiles = new ArrayList<BufferedImage>();
	//private List<PDDocument> pdfFiles = new ArrayList<PDDocument>();
	//private Map<String, BufferedImage> jpegFiles = new HashMap<String, BufferedImage>();
	private Map<String, String> jpegFiles = new HashMap<String, String>();
	//private Map<String, PDDocument> pdfFiles = new HashMap<String, PDDocument>();
	private Map<String, String> pdfFiles = new HashMap<String, String>();
	
	public FilesReader() {
		super();
		
	}	
	
	public Map<String, String> getJpegFiles() {
		return jpegFiles;
	}

	public void setJpegFiles(Map<String, String> jpegFiles) {
		this.jpegFiles = jpegFiles;
	}

	public Map<String, String> getPdfFiles() {
		return pdfFiles;
	}

	public void setPdfFiles(Map<String, String> pdfFiles) {
		this.pdfFiles = pdfFiles;
	}
	
	
	/*public Map<String, BufferedImage> getJpegFiles() {
		return jpegFiles;
	}

	public Map<String, PDDocument> getPdfFiles() {
		return pdfFiles;
	}*/

	
	public void readFolder (String pathToFolder) {
		
		File pathToDir = new File(pathToFolder);
		
		File files[] = pathToDir.listFiles();
		
		for(File file : files) {
			if (file.isDirectory()) {
				//System.out.println("directory name: " + file.getName());
				
				readSubFolder(pathToFolder + "/" + file.getName());
			} else {
				//System.out.println(file.getName());
				if (file.getName().endsWith(".jpg")) {
					jpegFiles.put(file.getName(), pathToFolder + "/" + file.getName());
					//jpegFiles.put(file.getName(), ImageIO.read(file));
					//jpegFiles.add(ImageIO.read(file));
				} else if (file.getName().endsWith(".pdf")) {
					try {
						PDDocument doc = PDDocument.load(file);
						pdfFiles.put(file.getName(), pathToFolder + "/" + file.getName());
						doc.close();
						//pdfFiles.put(file.getName(), doc);
						//pdfFiles.add(doc);
					} catch (IOException e) {
					
						e.printStackTrace();
					}
				}
			}
		}
		
		/*for (int i=0; i<jpegFiles.size(); i++) {
			System.out.println(jpegFiles.get(i));
		}
		
		for (int i=0; i<pdfFiles.size(); i++) {
			System.out.println(pdfFiles.get(i));
		}*/
		
	}
	
	

	public void readSubFolder (String pathToSubFolder) {
		
		
		File pathToSubDir = new File(pathToSubFolder);
		
		File files[] = pathToSubDir.listFiles();
		
		for(File file : files) {
		
			//System.out.println(file.getName());
			
			if (file.getName().endsWith(".jpg")) {
				jpegFiles.put(file.getName(), pathToSubFolder + "/" + file.getName());
				//jpegFiles.put(file.getName(), ImageIO.read(file));
				//jpegFiles.add(ImageIO.read(file));
			} else if (file.getName().endsWith(".pdf")) {
				try {
					PDDocument doc = PDDocument.load(file);
					pdfFiles.put(file.getName(), pathToSubFolder + "/" + file.getName());
					doc.close();
					//pdfFiles.put(file.getName(), doc);
					//PDDocument doc = Loader.loadPDF(file);
					//pdfFiles.add(doc);
				} catch (IOException e) {
				
					e.printStackTrace();
				}
			}
			
		}
		
	}
	

	
}
