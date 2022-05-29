import java.io.File;

public class FilesReader {
	
	// Task 1
	
	private String path = null;
	
	public FilesReader(String path) {
		this.path = path;
	}

	public FilesReader() {
		super();
		
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
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
			}
		}
		
	}
	
	public void readSubFolder (String pathToSubFolder) {
		
		
		File pathToSubDir = new File(pathToSubFolder);
		
		File files[] = pathToSubDir.listFiles();
		
		for(File file : files) {
		
			System.out.println(file.getName());
			
		}
		
	}
	

	
}
