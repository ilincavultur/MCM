<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="DateTime">
        <arrivalDate><xsl:value-of select="substring-before(/availableFlights/flight/tripInfo/arrivalDateTime, 'T')"/></arrivalDate>
        <arrivalTime><xsl:value-of 
            select="substring-before(substring-after(/availableFlights/flight/tripInfo/arrivalDateTime, 'T'), '-')"/></arrivalTime>
    </xsl:template>
    <xsl:template match="DateTime">
        <departureDate><xsl:value-of select="substring-before(/availableFlights/flight/tripInfo/departureDateTime, 'T')"/></departureDate>
        <departureTime><xsl:value-of 
            select="substring-before(substring-after(/availableFlights/flight/tripInfo/departureDateTime, 'T'), '-')"/></departureTime>
    </xsl:template>
    <xsl:template match="/">
        
        <airlineCompanyDataProvider>
            
            <xsl:attribute name="Name">
                <xsl:value-of select="'Lufthansa'"/>
            </xsl:attribute>
            <xsl:for-each select="/availableFlights/flight">
                <flight>
                    
                    <from>
                        <country>
                            <xsl:value-of select="./tripInfo/departureLocation/@country"/>
                        </country>
                        <city>
                            <xsl:value-of select="./tripInfo/departureLocation/@city"/>
                        </city>
                        
                    </from>
                    
                    <to>
                        <country>
                            <xsl:value-of select="./tripInfo/destination/@country"/>
                        </country>
                        <city>
                            <xsl:value-of select="./tripInfo/destination/@city"/>
                        </city>
                        
                    </to>
                    
                    <duration>
                        <xsl:value-of select="'P1Y1M3DT1H20M0S'"/>
                    </duration>
                    
                    <fare>
                        
                        <xsl:for-each select="./ticket">           
                            <ticketType>         
                                <economy>
                                    <availabilityStatus>
                                        
                                        <xsl:value-of select="/availableFlights/flight/aircraft/numberOfSeats/economy"/>
                                        
                                    </availabilityStatus>
                                    <info>
                                        <price>
                                            <xsl:attribute name="currency" select="'euro'"></xsl:attribute>
                                            <xsl:variable name="price" select="./euroPrice"/>   
                                            <xsl:value-of select="floor($price)"/>
                                        </price> 
                                        <numberOfRemainingSeats>
                                            <xsl:value-of select="/availableFlights/flight/aircraft/numberOfSeats/economy"/>
                                        </numberOfRemainingSeats>
                                        
                                        <services>
                                            <baggage>
                                                <handLuggage>
                                                    <weightLimit><xsl:value-of select="./baggage/handLuggage/weightLimit"/>  </weightLimit>
                                                    <numberLimit><xsl:value-of select="./baggage/handLuggage/numberLimit"/></numberLimit>
                                                </handLuggage>
                                                <checked>
                                                    <weightLimit>0</weightLimit>
                                                    <numberLimit>0</numberLimit>
                                                </checked>
                                            </baggage>
                                            <food>
                                                <snackBeverages><xsl:value-of select="./food/snackBeverages"/></snackBeverages>
                                                <meal><xsl:value-of select="./food/meal"/></meal>
                                            </food>
                                            <rebooking>
                                                <xsl:value-of select="./services/rebooking"/>
                                            </rebooking>
                                            <refund>
                                                <xsl:value-of select="./services/refund"/>
                                            </refund>
                                            <option>
                                                <xsl:choose>
                                                    <xsl:when test="boolean(./services/option)">
                                                        <xsl:value-of select="./services/option"/>  
                                                    </xsl:when>
                                                    <xsl:otherwise>no option</xsl:otherwise>
                                                </xsl:choose>
                                            </option>
                                            
                                        </services>   
                                    </info>
                                    <seatType>
                                        <economy><xsl:value-of select="/availableFlights/flight/aircraft/numberOfSeats/economy"/></economy>
                                    </seatType>
                                </economy>
            
                            </ticketType>                    
                        </xsl:for-each>
                        
                    </fare>
                    
                    <totalTraveltime>
                        <xsl:value-of select="'P1Y1M3DT1H20M0S'"/>
                    </totalTraveltime>
                    
                    <flightType>
                        <nonStop>
                            <flightDetails>
                                <xsl:variable
                                    name="flightNumber" select="./aircraft/flightNumber"/>
                                <xsl:attribute name="flightNumber">
                                    <xsl:value-of select="$flightNumber"/>
                                </xsl:attribute>
                                
                                <departure>
                                    <departureAirport>
                                        <xsl:variable
                                            name="departureIATAairportCode" select="''"/>
                                        <xsl:attribute name="departureIATAairportCode">
                                            <xsl:value-of select="$departureIATAairportCode"/>
                                        </xsl:attribute>
                                        
                                        
                                        <departureAirportName>
                                            <xsl:value-of select="'departureAirportName'"/>
                                        </departureAirportName>
                                    </departureAirport>
                                    <departureTerminal>
                                        <xsl:value-of select="./tripInfo/departureTerminal"/>
                                    </departureTerminal>
                                    
                                    <departureGate>
                                        <xsl:value-of select="./tripInfo/departureGate"/>
                                    </departureGate>
                                    
                                    <departureDate>
                                        <xsl:value-of select="substring-before(./tripInfo/departureDateTime, 'T')"/>
                                    </departureDate>
                                    
                                    <departureTime>
                                        <xsl:value-of select="substring-after(./tripInfo/departureDateTime, 'T')"/>
                                    </departureTime>
                                    
                                    <localDepartureTime>
                                        <xsl:value-of select="substring-after(./tripInfo/departureDateTime, 'T')"/>
                                    </localDepartureTime>
                                    
                                </departure>
                                
                                <arrival>
                                    <arrivalAirport>
                                        <arrivalAirportName>
                                            <xsl:value-of select="'arrivalAirportName'"/>
                                        </arrivalAirportName>
                                    </arrivalAirport>
                                    
                                    <arrivalTerminal>
                                        <xsl:value-of select="./tripInfo/arrivalTerminal"/>
                                    </arrivalTerminal>
                                    
                                    <arrivalGate>
                                        <xsl:value-of select="./tripInfo/arrivalGate"/>
                                    </arrivalGate>
                                    
                                    <arrivalDate>
                                        <xsl:value-of select="substring-before(./tripInfo/arrivalDateTime, 'T')"/>
                                    </arrivalDate>
                                    
                                    <arrivalTime>
                                        <xsl:value-of select="substring-after(./tripInfo/arrivalDateTime, 'T')"/>
                                    </arrivalTime>
                                    
                                    <localArrivalTime>
                                        <xsl:value-of select="substring-after(./tripInfo/arrivalDateTime, 'T')"/>
                                    </localArrivalTime>
                                    
                                </arrival>
                                
                                <Airline>
                                    <carrier>
                                        <xsl:value-of select="./tripInfo/airline/carrier"/>
                                    </carrier>
                                    
                                    <operatedBy>
                                        <xsl:value-of select="./tripInfo/airline/operatedBy"/>
                                    </operatedBy>
                                    <AirCraft>
                                        <flightNumber>
                                            <xsl:value-of select="./aircraft/flightNumber"/>
                                        </flightNumber>
                                    </AirCraft>
                                </Airline>
                                
                                <timeSchedule>
                                    <TravelTime>
                                        
                                        <xsl:value-of select="'P1Y2M3DT1H15M0S'"/>
                                    </TravelTime>
                                </timeSchedule>
                                
                            </flightDetails>
                        </nonStop>
                    </flightType>
                    
                    
                    
                    
                    
                    
                </flight>
            </xsl:for-each>
            
        </airlineCompanyDataProvider>
    </xsl:template>
</xsl:stylesheet>