<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <airlineCompanyDataProvider>
            <xsl:variable
                name="name" select="/airlineCompanyDataProvider/@Name"/>
            <xsl:attribute name="Name">
                <xsl:value-of select="$name"/>
            </xsl:attribute>
            <xsl:for-each select="/airlineCompanyDataProvider/flight">
            <flight>
                <from>
                    <country>
                        <xsl:value-of select="''"/>
                    </country>
                    <city>
                        <xsl:value-of select="./depart"/>
                    </city>
                    
                </from>
                <to>
                    <country>
                        <xsl:value-of select="''"/>
                    </country>
                    <city>
                        <xsl:value-of select="./to"/>
                    </city>
                    
                </to>
                <duration>
                    <xsl:value-of select="./duration"/>
                </duration>
                <fare>
                    <xsl:choose>
                        <xsl:when test="boolean(./fare/status)">
                            <status>
                                <xsl:value-of select="./fare/status"/>
                            </status>
                            
                        </xsl:when>
                        <xsl:otherwise>
                            
                                
                                
                                <ticketType>
                                    
                                    
                                    <premiumEconomy>
                                        
                                        
                                        <availabilityStatus>
                                            <xsl:value-of select="./fare/type/premiumEconomy/info/numberOfRemainingSeats"/>
                                        </availabilityStatus>
                                        <info>
                                            
                                            
                                            <price>
                                                <xsl:attribute name="currency" select="./fare/type/premiumEconomy/info/price/@currency"></xsl:attribute>
                                      
                                                <xsl:value-of select="./fare/type/premiumEconomy/info/price"/>
                                                
                                                
                                                
                                            </price>
                                            
                                            <numberOfRemainingSeats>
                                                <xsl:value-of select="./fare/type/premiumEconomy/info/numberOfRemainingSeats"/>
                                            </numberOfRemainingSeats>
                                            <services>
                                                <baggage>
                                                    <handLuggage>
                                                        <weightLimit>0</weightLimit>
                                                        <numberLimit>0</numberLimit>
                                                    </handLuggage>
                                                    <checked>
                                                        <weightLimit>0</weightLimit>
                                                        <numberLimit>0</numberLimit>
                                                    </checked>
                                                </baggage>
                                                <food>
                                                    <snackBeverages>0</snackBeverages>
                                                    <meal>0</meal>
                                                </food>
                                                <rebooking>
                                                    0
                                                </rebooking>
                                                <refund>
                                                    0
                                                </refund>
                                                <option>
                                                    <xsl:value-of select="./fare/type/premiumEconomy/info/services"/>    
                                                </option>
                                                
                                            </services>
                                        </info>
                                        <seatType>
                                            
                                        </seatType>
                                        
                                    </premiumEconomy>
                                    
                                    
                                    <premiumEconomyFlex>     
                                    
                                        <availabilityStatus>  
                                            <xsl:value-of select="./fare/type/premiumEconomyFlexible/info/numberOfRemainingSeats"/>
                                        </availabilityStatus>
                                        <info>   
                                            
                                            <price> 
                                                
                                                
                                                <xsl:attribute name="currency" select="./fare/type/premiumEconomyFlexible/info/price/@currency"></xsl:attribute>    
                                                <xsl:value-of select="./fare/type/premiumEconomyFlexible/info/price"/>  
                                                
                                                
                                            </price>
                                            
                                            
                                            <numberOfRemainingSeats>                             
                                                <xsl:value-of select="./fare/type/premiumEconomyFlexible/info/numberOfRemainingSeats"/>    
                                            </numberOfRemainingSeats>                                         
                                            <services>
                                                <baggage>
                                                    <handLuggage>
                                                        <weightLimit>0</weightLimit>
                                                        <numberLimit>0</numberLimit>
                                                    </handLuggage>
                                                    <checked>
                                                        <weightLimit>0</weightLimit>
                                                        <numberLimit>0</numberLimit>
                                                    </checked>
                                                </baggage>
                                                <food>
                                                    <snackBeverages>0</snackBeverages>
                                                    <meal>0</meal>
                                                </food>
                                                <rebooking>
                                                    0
                                                </rebooking>
                                                <refund>
                                                    0
                                                </refund>
                                                <option>
                                                    <xsl:value-of select="./fare/type/premiumEconomyFlexible/info/services"/>    
                                                </option>
                                                
                                            </services>                                         
                                        </info>                                     
                                        
                                        <seatType></seatType>
                                    </premiumEconomyFlex>
                                    
                                    
                                </ticketType>
                            
                            
                            
                        </xsl:otherwise>
                       
                    </xsl:choose>
                    
                    
                </fare>
                <totalTraveltime>
                    <xsl:value-of select="./totalTraveltime"/>
                </totalTraveltime>
                <flightType>
                    <nonStop>
                        <flightDetails>
                            <xsl:variable
                                name="flightNumber" select="./flightCatergory/nonStop/flightDetails/@flightNumber"/>
                            <xsl:attribute name="flightNumber">
                                <xsl:value-of select="$flightNumber"/>
                            </xsl:attribute>
                            
                            <departure>
                                <departureAirport>
                                    <xsl:variable
                                        name="departureIATAairportCode" select="/airlineCompanyDataProvider/flight/flightCatergory/nonStop/flightDetails/departure/departureAirport/@departureIATAairportCode"/>
                                    <xsl:attribute name="departureIATAairportCode">
                                        <xsl:value-of select="$departureIATAairportCode"/>
                                    </xsl:attribute>
                                    
                                    <departureAirportName>
                                        <xsl:value-of select="./flightCatergory/nonStop/flightDetails/departure/departureAirport/departureAirportName"/>
                                    </departureAirportName>
                                    
                                </departureAirport>
                                <departureTerminal>
                                    <xsl:value-of select="'departureTerminal'"/>
                                </departureTerminal>
                                <departureGate>
                                    <xsl:value-of select="'departureGate'"/>
                                </departureGate>
                                <departureDate>
                                    <xsl:value-of select="./flightCatergory/nonStop/flightDetails/departure/departureDate"/>
                                </departureDate>
                                <departureTime>
                                    <xsl:value-of select="./flightCatergory/nonStop/flightDetails/departure/departureTime"/>
                                </departureTime>
                                
                                <localDepartureTime>
                                    <xsl:value-of select="./flightCatergory/nonStop/flightDetails/departure/departureTime"/>
                                </localDepartureTime>
                                
                                
                                
                                
                                
                                
                                
                                
                                
                            </departure>
                            
                            <arrival>
                                <arrivalAirport>
                                    <arrivalAirportName>
                                        <xsl:value-of select="./flightCatergory/nonStop/flightDetails/arrival/arrivalAirport/arrivalAirportName"/>
                                    </arrivalAirportName>
                                </arrivalAirport>
                                <arrivalTerminal>
                                    <xsl:value-of select="'arrivalTerminal'"/>
                                </arrivalTerminal>
                                <arrivalGate>
                                    <xsl:value-of select="'arrivalGate'"/>
                                </arrivalGate>
                                <arrivalDate>
                                    <xsl:value-of select="./flightCatergory/nonStop/flightDetails/arrival/arrivalDate"/>
                                </arrivalDate>
                                <arrivalTime>
                                    <xsl:value-of select="./flightCatergory/nonStop/flightDetails/arrival/arrivalTime"/>
                                </arrivalTime>
                                <localArrivalTime>
                                    <xsl:value-of select="./flightCatergory/nonStop/flightDetails/arrival/arrivalTime"/>
                                </localArrivalTime>
                                
                                
                                
                                
                                
                            </arrival>
                            
                            <Airline>
                                <carrier>
                                    <xsl:value-of select="'carrier'"/>
                                </carrier>
                                
                                <operatedBy>
                                    <xsl:value-of select="./flightCatergory/nonStop/flightDetails/operatedBy"/>
                                </operatedBy>
                                
                                <AirCraft>
                                    <brand></brand>
                                    <model>
                                        <xsl:value-of select="./flightCatergory/nonStop/flightDetails/Aircraft/."/>
                                    </model>
                                    <flightNumber>
                                        <xsl:value-of select="./flightCatergory/nonStop/flightDetails/@flightNumber"/>
                                    </flightNumber>
                                    
                                </AirCraft>
                                
                            </Airline>
                     
                            <timeSchedule>
                                <TravelTime>
                                    <xsl:value-of select="./flightCatergory/nonStop/flightDetails/travelInfo/travelTime/."/>    
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