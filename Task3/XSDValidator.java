package Task3;
import java.io.File;
import java.io.IOException;

import javax.xml.XMLConstants;
import javax.xml.transform.stream.StreamSource;

import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;

import org.xml.sax.SAXException;

// taken from https://www.tutorialspoint.com/xsd/xsd_validation.html
// how to use : command : java XSDValidator.java <filename>.xsd <filename>.xml
public class XSDValidator {
	
	   public static void main(String[] args) {
		   
	 
         boolean isValid = validateXMLSchema(args[0],args[1]);
         
         if(isValid){
            System.out.println(args[1] + " is valid against " + args[0]);
         } else {
            System.out.println(args[1] + " is not valid against " + args[0]);
         }
	      
	   }
	   
	   public static boolean validateXMLSchema(String xsdFile, String xmlFile){
		   
	      try {
	    	  
	         SchemaFactory factory = SchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI);
	         
	         Schema schema = factory.newSchema(new File(xsdFile));
	         
             Validator validator = schema.newValidator();
             
             validator.validate(new StreamSource(new File(xmlFile)));
             
	      } catch (IOException e){
	         System.out.println("Exception: "+ e.getMessage());
	         return false;
	      }catch(SAXException e1){
	         System.out.println("SAX Exception: "+ e1.getMessage());
	         return false;
	      }
			
	      return true;
		
	   }
	   
	}