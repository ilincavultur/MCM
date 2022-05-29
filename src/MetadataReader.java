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
import org.apache.tika.Tika;

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
	private Map<String, String> xmpData = new HashMap<String, String>();
	private Map<String, String> dcData = new HashMap<String, String>();
	private Map<String, Map<String, String>> imageExif = new HashMap<String, Map<String, String>>();
	private Map<String, Map<String, String>> imageIptc = new HashMap<String, Map<String, String>>();
	private Map<String, Map<String, String>> pdfXmp = new HashMap<String, Map<String, String>>();
	private Map<String, Map<String, String>> pdfDc = new HashMap<String, Map<String, String>>();
	
	public MetadataReader() {
		super();
	}
	
	public void readJpegMetadata (Map<String, String> jpegFiles) {
		
		for (Map.Entry<String, String> entry : jpegFiles.entrySet()) {
			
			exifData = new HashMap<String, String>();
			iptcData = new HashMap<String, String>();
			
			try {
				Metadata data = ImageMetadataReader.readMetadata(new File(entry.getValue()));
				
				for (Directory dir : data.getDirectories()) {
					if (dir.getName().contains("Exif")) {
						for (Tag exifTag : dir.getTags()) {
							exifData.put(exifTag.getTagName(), exifTag.getDescription());
						}
					}
					if (dir.getName().contains("IPTC")) {
						for (Tag iptcTag : dir.getTags()) {
							iptcData.put(iptcTag.getTagName(), iptcTag.getDescription());
						}
					}
				}
				
				imageExif.put(entry.getKey(), exifData);
				imageIptc.put(entry.getKey(), iptcData);
				
			} catch (ImageProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public void readPDFMetadata (Map<String, String> pdfFiles) {
		
		for (Map.Entry<String, String> entry : pdfFiles.entrySet()) {
			
			xmpData = new HashMap<String, String>();
			dcData = new HashMap<String, String>();
			
			try {
				Tika parser = new Tika();
				org.apache.tika.metadata.Metadata data = new org.apache.tika.metadata.Metadata();
				parser.parse(new File(entry.getValue()), data);
				//		ImageMetadataReader.readMetadata(new File(entry.getValue()));
				
				for (String tag : data.names()) {
					for (String val : data.getValues(tag)) {
						//System.out.println("tag : " + tag + " " + "xmp data : " + val);
						xmpData.put(tag, val);
						/*if (tag.contains("xmp")) {
							//for (Tag exifTag : dir.getTags()) {
								xmpData.put(tag, val);
								//System.out.println("xmp data : " + xmpData.get(tag));
							//}
						}
						
						if (tag.contains("dc")) {
							//for (Tag iptcTag : dir.getTags()) {
								dcData.put(tag, val);
								//System.out.println("dc data : " + dcData.get(tag));
							//}
						}*/
					}
					
					//System.out.println("tag : " + tag + " " + data.get(tag));
					
					
				}
				
				pdfXmp.put(entry.getKey(), xmpData);
				pdfDc.put(entry.getKey(), dcData);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	public void printJpegExifMetadata () {
		
		System.out.println("EXIF");
		
		for (Map.Entry<String, Map<String, String>> entry : imageExif.entrySet()) {
			
			System.out.println("file name : " + entry.getKey());
			
			for (Map.Entry<String, String> exifEntry : entry.getValue().entrySet()) {
				System.out.println("	tag: " + exifEntry.getKey() + " " + " value: " + exifEntry.getValue());	
			}
			
		}
		
	}
	
	public void printJpegIptcMetadata () {
		
		System.out.println("IPTC");
		
		for (Map.Entry<String, Map<String, String>> entry : imageIptc.entrySet()) {
			
			System.out.println("file name : " + entry.getKey());
			
			for (Map.Entry<String, String> exifEntry : entry.getValue().entrySet()) {
				System.out.println("	tag: " + exifEntry.getKey() + " " + " value: " + exifEntry.getValue());	
			}
			
		}
		
	}
	
	public void printPdfXmpMetadata () {
		
		System.out.println("XMP");
		
		for (Map.Entry<String, Map<String, String>> entry : pdfXmp.entrySet()) {
			
			System.out.println("file name : " + entry.getKey());
			
			for (Map.Entry<String, String> xmpEntry : entry.getValue().entrySet()) {
				System.out.println("	tag: " + xmpEntry.getKey() + " " + " value: " + xmpEntry.getValue());	
			}
			
		}
		
	}
	
	public void printPdfDcMetadata () {
		
		System.out.println("DC");
		
		for (Map.Entry<String, Map<String, String>> entry : pdfDc.entrySet()) {
			
			System.out.println("file name : " + entry.getKey());
			
			for (Map.Entry<String, String> dcEntry : entry.getValue().entrySet()) {
				System.out.println("	tag: " + dcEntry.getKey() + " " + " value: " + dcEntry.getValue());	
			}
			
		}
		
	}
	

}
