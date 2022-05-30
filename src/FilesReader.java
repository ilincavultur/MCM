import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import org.apache.pdfbox.pdmodel.PDDocument;


public class FilesReader {

	private Map<String, String> jpegFiles = new HashMap<String, String>();
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

	public void readFolder (String pathToFolder) {
		
		File pathToDir = new File(pathToFolder);
		
		File files[] = pathToDir.listFiles();
		
		for(File file : files) {
			
			if (file.isDirectory()) {
				
				readSubFolder(pathToFolder + "/" + file.getName());
				
			} else {
			
				if (file.getName().endsWith(".jpg")) {
					
					jpegFiles.put(file.getName(), pathToFolder + "/" + file.getName());

				} else if (file.getName().endsWith(".pdf")) {
					
					try {
						
						PDDocument doc = PDDocument.load(file);
						pdfFiles.put(file.getName(), pathToFolder + "/" + file.getName());
						doc.close();

					} catch (IOException e) {
					
						e.printStackTrace();
					}
				}
			}
		}
		
	}
	
	

	public void readSubFolder (String pathToSubFolder) {
		
		
		File pathToSubDir = new File(pathToSubFolder);
		
		File files[] = pathToSubDir.listFiles();
		
		for(File file : files) {
	
			if (file.getName().endsWith(".jpg")) {
				
				jpegFiles.put(file.getName(), pathToSubFolder + "/" + file.getName());
	
			} else if (file.getName().endsWith(".pdf")) {
				try {
					
					PDDocument doc = PDDocument.load(file);
					pdfFiles.put(file.getName(), pathToSubFolder + "/" + file.getName());
					doc.close();
		
				} catch (IOException e) {
				
					e.printStackTrace();
				}
			}
			
		}
		
	}
	

	
}
