SOURCES I used:


Comments for checking my assignment:

I used the Oxygen Editor for this assignment. The project is called Assignment2.xpr

Task1
No comments

Task2
No comments

Task3
To validate the XML instances against the corresponding XSDs, please open a terminal in the project:

For the American Airlines XML: 
java XSDValidator.java AmericanAirlines.xsd AmericanAirlinesInstance.xml 

For the Austrian Airlines XML: 
java XSDValidator.java AustrianAirlines.xsd AustrianAirlinesInstance.xml 

For the Lufthansa XML: 
java XSDValidator.java Lufthansa.xsd LufthansaInstance.xml 

Task4
Again, to validate each XML instance against the generic Task4.xsd schema, please open a terminal in the project:

Type:
java XSDValidator.java Task4.xsd AmericanAirlinesInstance.xml 
java XSDValidator.java Task4.xsd AustrianAirlinesInstance.xml 
java XSDValidator.java Task4.xsd LufthansaInstance.xml 

Task5
For the American Airlines XML: 
To apply the American.xsl transform on the AmericanAirlinesInstance.xml please right click on AmericanAirlinesInstance.xml -> Transform -> Transform with -> American (scenario)
I saved the output in newAmerican.xml file

For the Austrian Airlines XML: 
To apply the Austrian.xsl transform on the AustrianAirlinesInstance.xml please right click on AustrianAirlinesInstance.xml -> Transform -> Transform with -> Austrian (scenario)
I saved the output in newAustrian.xml file

For the Lufthansa XML: 
To apply the Lufthansa.xsl transform on the LufthansaInstance.xml please right click on LufthansaInstance.xml -> Transform -> Transform with -> Lufthansa (scenario)
I saved the output in newLufthansa.xml file

Task6
As stated in Task5, I saved all output files as: newAmerican.xml, newAustrian.xml, newLufthansa.xml

For task 6 I had to create a new separate project called Task6Merge.xpr which only contains merge.xsl + new scenario called merge + the transformed files from task5 newAmerican.xml, newAustrian.xml, newLufthansa.xml

This is due to the fact that otherwise the scenario merge merges all xml files found in the project and this produces an error and is also not correct as I only want to merge the 3 instances.

To apply the merge transformation, select one of the three newAmerican.xml, newAustrian.xml, newLufthansa.xml and right click (only on one of them) -> Transform -> Transform with -> merge (scenario)

This produces the output that I saved in merged.xml.
In order to validate it against the general Task4.xsd, please add the attribute Name="" in the airlineCompanyDataProvider element in file merged.xml. Then, as before, you can type in terminal:

java XSDValidator.java Task4.xsd Merged.xml

Task7
On the previously created merged.xml file, apply transformations "first", "third", "sixth", "seventh", "eighth" to get the outputs for the Xqueries, which I also saved in the files: first.xml, third.xml, etc.

Task8
Validation with right click on file -> Validate

