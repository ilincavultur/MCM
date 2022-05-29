import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;


//import org.apache.pdfbox.Loader;
import org.apache.pdfbox.pdmodel.PDDocument;
//import org.apache.pdfbox.pdmodel.PDDocument;

public class FilesReader {
	
	// Task 1

	private List<BufferedImage> jpegFiles = new ArrayList<BufferedImage>();
	private List<PDDocument> pdfFiles = new ArrayList<PDDocument>();

	public FilesReader() {
		super();
		
	}

	
	public void readFolder (String pathToFolder) {
		
		File pathToDir = new File(pathToFolder);
		
		File files[] = pathToDir.listFiles();
		
		for(File file : files) {
			if (file.isDirectory()) {
				System.out.println("directory name: " + file.getName());
				
				readSubFolder(pathToFolder + "/" + file.getName());
			} else {
				System.out.println(file.getName());
				if (file.getName().endsWith(".jpg")) {
					try {
						jpegFiles.add(ImageIO.read(file));
					} catch (IOException e) {
						
						e.printStackTrace();
					}
				} else if (file.getName().endsWith(".pdf")) {
					try {
						PDDocument doc = PDDocument.load(file);
						pdfFiles.add(doc);
					} catch (IOException e) {
					
						e.printStackTrace();
					}
				}
			}
		}
		
		for (int i=0; i<jpegFiles.size(); i++) {
			System.out.println(jpegFiles.get(i));
		}
		
		for (int i=0; i<pdfFiles.size(); i++) {
			System.out.println(pdfFiles.get(i));
		}
		
	}
	
	public void readSubFolder (String pathToSubFolder) {
		
		
		File pathToSubDir = new File(pathToSubFolder);
		
		File files[] = pathToSubDir.listFiles();
		
		for(File file : files) {
		
			System.out.println(file.getName());
			
			if (file.getName().endsWith(".jpg")) {
				try {
					jpegFiles.add(ImageIO.read(file));
				} catch (IOException e) {
					
					e.printStackTrace();
				}
			} else if (file.getName().endsWith(".pdf")) {
				try {
					PDDocument doc = PDDocument.load(file);
					//PDDocument doc = Loader.loadPDF(file);
					pdfFiles.add(doc);
				} catch (IOException e) {
				
					e.printStackTrace();
				}
			}
			
		}
		
	}
	

	
}
