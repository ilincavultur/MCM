import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.drew.imaging.ImageMetadataReader;
import com.drew.imaging.ImageProcessingException;
import com.drew.imaging.jpeg.JpegMetadataReader;
import com.drew.metadata.Directory;
import com.drew.metadata.Metadata;
import com.drew.metadata.Tag;
//import com.drew.metadata.exif.ExifDirectory;
import org.apache.pdfbox.pdmodel.PDDocument;

public class MetadataReader {
	
	/*private Map<String, BufferedImage> jpegFiles = new HashMap<String, BufferedImage>();
	private Map<String, PDDocument> pdfFiles = new HashMap<String, PDDocument>();

	public void setJpegFiles(Map<String, BufferedImage> jpegFiles) {
		this.jpegFiles = jpegFiles;
	}

	public void setPdfFiles(Map<String, PDDocument> pdfFiles) {
		this.pdfFiles = pdfFiles;
	}
*/
	
	private Map<String, String> exifData = new HashMap<String, String>();
	private Map<String, String> iptcData = new HashMap<String, String>();
	private Map<String, Map<String, String>> image = new HashMap<String, Map<String, String>>();
	
	public MetadataReader() {
		super();
	}
	
	public void readJpegMetadata (Map<String, String> jpegFiles) {
		
		for (Map.Entry<String, String> entry : jpegFiles.entrySet()) {
			
			exifData = new HashMap<String, String>();
			try {
				Metadata data = ImageMetadataReader.readMetadata(new File(entry.getValue()));
				
				for (Directory dir : data.getDirectories()) {
					if (dir.getName().contains("Exif")) {
						for (Tag exifTag : dir.getTags()) {
							exifData.put(exifTag.getTagName(), exifTag.getDescription());
						}
					}
				}
				
				image.put(entry.getKey(), exifData);
			} catch (ImageProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public void printJpegMetadata () {
		
		for (Map.Entry<String, Map<String, String>> entry : image.entrySet()) {
			
			System.out.println("file name : " + entry.getKey());
			
			for (Map.Entry<String, String> exifEntry : entry.getValue().entrySet()) {
				System.out.println("	tag: " + exifEntry.getKey() + " " + " value: " + exifEntry.getValue());	
			}
			
		}
		
	}
	

}
