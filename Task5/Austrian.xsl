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
                            <xsl:value-of select="./from"/>
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
                                    <xsl:if test="boolean(./fare/type/businessFlex)">
                                        <businessFlex>     
                                            <availabilityStatus>
                                            <xsl:if test="boolean(./fare/type/businessFlex/availabilityStatus)">
                                              <xsl:choose>
                                                  <xsl:when test="boolean(./fare/type/businessFlex/info/numberOfRemainingSeats)">
                                                      <xsl:value-of select="./fare/type/businessFlex/info/numberOfRemainingSeats"/>      
                                                      
                                                  </xsl:when>
                                                  <xsl:otherwise>0</xsl:otherwise>
                                              </xsl:choose>
                                                
                                            
                                            </xsl:if>
                                            </availabilityStatus>
                                            <info>   
                                            
                                            
                                                
                                                <price>
                                                    <xsl:attribute name="currency" select="./fare/type/businessFlex/info/price/@currency"></xsl:attribute>
                                                    <xsl:choose>
                                                        <xsl:when test="boolean(./fare/type/businessFlex/info/price)">
                                                            <xsl:value-of select="./fare/type/businessFlex/info/price"/>  
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            0
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                 
                                                </price>
                                                
                                                
                                                <numberOfRemainingSeats>          
                                                    
                                                        <xsl:choose>
                                                            <xsl:when test="boolean(./fare/type/businessFlex/info/numberOfRemainingSeats)">
                                                                <xsl:value-of select="./fare/type/businessFlex/info/numberOfRemainingSeats"/>      
                                                                
                                                            </xsl:when>
                                                            <xsl:otherwise>0</xsl:otherwise>
                                                        </xsl:choose>
                                                    
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
                                                        <xsl:choose>
                                                            <xsl:when test="boolean(./fare/type/businessFlex/info/services)">
                                                                <xsl:value-of select="./fare/type/businessFlex/info/services"/>        
                                                            </xsl:when>
                                                            <xsl:otherwise>no option</xsl:otherwise>
                                                        </xsl:choose>
                                                
                                                    </option>
                                                    
                                                </services>                                         
                                                                                 
                                            
                                            </info>
                                            <seatType></seatType>
                                        </businessFlex>
                                        
                                    </xsl:if>
                                    
                                    <xsl:if test="boolean(./fare/type/economyBasic)">
                                        <economyBasic>     
                                            
                                            <availabilityStatus>  
                                                <xsl:if test="boolean(./fare/type/economyBasic/availabilityStatus)">
                                                    <xsl:choose>
                                                        <xsl:when test="boolean(./fare/type/economyBasic/info/numberOfRemainingSeats)">
                                                            <xsl:value-of select="./fare/type/economyBasic/info/numberOfRemainingSeats"/>      
                                                            
                                                        </xsl:when>
                                                        <xsl:otherwise>0</xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:if>
                                            </availabilityStatus>
                                            
                                            
                                            <info>   
                                                    
                                                <price> 
                                                    <xsl:attribute name="currency" select="./fare/type/economyBasic/info/price/@currency"></xsl:attribute>
                                                    <xsl:choose>
                                                        <xsl:when test="boolean(./fare/type/economyBasic/info/price)">
                                                            <xsl:value-of select="./fare/type/economyBasic/info/price"/>  
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            0
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                    
                                                </price>
                                                
                                                
                                                <numberOfRemainingSeats>      
                                                    
                                                        <xsl:choose>
                                                            <xsl:when test="boolean(./fare/type/economyBasic/info/numberOfRemainingSeats)">
                                                                <xsl:value-of select="./fare/type/economyBasic/info/numberOfRemainingSeats"/>      
                                                                
                                                            </xsl:when>
                                                            <xsl:otherwise>0</xsl:otherwise>
                                                        </xsl:choose>
                                                    
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
                                                        <xsl:choose>
                                                            <xsl:when test="boolean(./fare/type/economyBasic/info/services)">
                                                                <xsl:value-of select="./fare/type/economyBasic/info/services"/>        
                                                            </xsl:when>
                                                            <xsl:otherwise>no option</xsl:otherwise>
                                                        </xsl:choose>
                                                    </option>
                                                    
                                                </services>     
                                                
                                            </info>                                     
                                            
                                            <seatType></seatType>
                                        </economyBasic>
                                        
                                    </xsl:if>
                                    
                                    <xsl:if test="boolean(./fare/type/premiumEconomyFlex)">
                                        <premiumEconomyFlex>     
                                            
                                            <availabilityStatus>  
                                                <xsl:if test="boolean(./fare/type/premiumEconomyFlex/availabilityStatus)">
                                                    <xsl:choose>
                                                        <xsl:when test="boolean(./fare/type/premiumEconomyFlex/info/numberOfRemainingSeats)">
                                                            <xsl:value-of select="./fare/type/premiumEconomyFlex/info/numberOfRemainingSeats"/>      
                                                            
                                                        </xsl:when>
                                                        <xsl:otherwise>0</xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:if>
                                            </availabilityStatus>
                                            
                                            
                                            <info>   
                                                
                                                <price> 
                                                    <xsl:attribute name="currency" select="./fare/type/premiumEconomyFlex/info/price/@currency"></xsl:attribute>
                                                    <xsl:choose>
                                                        <xsl:when test="boolean(./fare/type/premiumEconomyFlex/info/price)">
                                                            <xsl:value-of select="./fare/type/premiumEconomyFlex/info/price"/>  
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            0
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </price>
                                                
                                                
                                                <numberOfRemainingSeats>        
                                                      
                                                        <xsl:choose>
                                                            <xsl:when test="boolean(./fare/type/premiumEconomyFlex/info/numberOfRemainingSeats)">
                                                                <xsl:value-of select="./fare/type/premiumEconomyFlex/info/numberOfRemainingSeats"/>      
                                                                
                                                            </xsl:when>
                                                            <xsl:otherwise>0</xsl:otherwise>
                                                        </xsl:choose>  
                                                    
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
                                                        <xsl:choose>
                                                            <xsl:when test="boolean(./fare/type/premiumEconomyFlex/info/services)">
                                                                <xsl:value-of select="./fare/type/premiumEconomyFlex/info/services"/>        
                                                            </xsl:when>
                                                            <xsl:otherwise>no option</xsl:otherwise>
                                                        </xsl:choose>
                                                    </option>
                                                    
                                                </services>       
                                                
                                            </info>                                     
                                            
                                            <seatType></seatType>
                                        </premiumEconomyFlex>
                                        
                                    </xsl:if>
                                    
                                    
                                    
                                    
                                    
                                    
                                </ticketType>
                                
                                
                                
                            </xsl:otherwise>
                            
                        </xsl:choose>
                        
                        
                    </fare>
                    <totalTraveltime>
                        <xsl:value-of select="./totalTraveltime"/>
                    </totalTraveltime>
                    <flightType>
                        <xsl:choose>
                            <xsl:when test="boolean(./flightType/nonStop)">
                                <nonStop>
                                    <flightDetails>
                                        <xsl:variable
                                            name="flightNumber" select="./flightType/nonStop/flightDetails/@flightNumber"/>
                                        <xsl:attribute name="flightNumber">
                                            <xsl:value-of select="$flightNumber"/>
                                        </xsl:attribute>
                                        
                                        <departure>
                                            <departureAirport>
                                        
                                                
                                                <departureAirportName>
                                                    <xsl:value-of select="./flightType/nonStop/flightDetails/departure/departureAirport/departureAirportName"/>
                                                </departureAirportName>
                                                
                                            </departureAirport>
                                            <departureTerminal>
                                                <xsl:value-of select="'departureTerminal'"/>
                                            </departureTerminal>
                                            <departureGate>
                                                <xsl:value-of select="'departureGate'"/>
                                            </departureGate>
                                            <departureDate>
                                                <xsl:value-of select="./flightType/nonStop/flightDetails/departure/departureDate"/>
                                            </departureDate>
                                            <departureTime>
                                                <xsl:value-of select="./flightType/nonStop/flightDetails/departure/localDepartureTime"/>
                                            </departureTime>
                                            
                                            <localDepartureTime>
                                                <xsl:value-of select="./flightType/nonStop/flightDetails/departure/localDepartureTime"/>
                                            </localDepartureTime>
                         
                                        </departure>
                                        
                                        <arrival>
                                            <arrivalAirport>
                                                <arrivalAirportName>
                                                    <xsl:value-of select="./flightType/nonStop/flightDetails/arrival/arrivalAirport/arrivalAirportName"/>
                                                </arrivalAirportName>
                                            </arrivalAirport>
                                            <arrivalTerminal>
                                                <xsl:value-of select="'arrivalTerminal'"/>
                                            </arrivalTerminal>
                                            <arrivalGate>
                                                <xsl:value-of select="'arrivalGate'"/>
                                            </arrivalGate>
                                            <arrivalDate>
                                                <xsl:value-of select="./flightType/nonStop/flightDetails/arrival/arrivalDate"/>
                                            </arrivalDate>
                                            <arrivalTime>
                                                <xsl:value-of select="./flightType/nonStop/flightDetails/arrival/localArrivalTime"/>
                                            </arrivalTime>
                                            <localArrivalTime>
                                                <xsl:value-of select="./flightType/nonStop/flightDetails/arrival/localArrivalTime"/>
                                            </localArrivalTime>
                                            
                                            
                                            
                                            
                                            
                                        </arrival>
                                        
                                        <Airline>
                                            <carrier>
                                                <xsl:value-of select="'carrier'"/>
                                            </carrier>
                                            
                                            <operatedBy>
                                                <xsl:value-of select="./flightType/nonStop/flightDetails/operatedBy"/>
                                            </operatedBy>
                                            
                                            <AirCraft>
                                                <brand></brand>
                                                <model>
                                                    <xsl:value-of select="./flightType/nonStop/flightDetails/Aircraft/."/>
                                                </model>
                                                <flightNumber>
                                                    <xsl:value-of select="./flightType/nonStop/flightDetails/@flightNumber"/>
                                                </flightNumber>
                                                
                                            </AirCraft>
                                            
                                        </Airline>
                                        
                                        <timeSchedule>
                                            <TravelTime>
                                                <xsl:choose>
                                                    <xsl:when test="boolean(./flightType/nonStop/flightDetails/travelInfo/travelTime)">
                                                        <xsl:value-of select="./flightType/nonStop/flightDetails/travelInfo/travelTime/."/>          
                                                    </xsl:when>
                                                    <xsl:otherwise>P1Y2M3DT1H15M0S</xsl:otherwise>
                                                </xsl:choose>
                                                  
                                            </TravelTime>
                                            
                                        </timeSchedule>
                                        
                                        
                                        
                                        
                                    </flightDetails>
                                </nonStop>
                                
                            </xsl:when>
                        
                        <xsl:otherwise>
                            
                            <connecting>
                                <numberOfStops><xsl:value-of select="./flightType/connecting/numberOfStops"/></numberOfStops>
                                
                                    <flightDetails>
                                        <xsl:variable
                                            name="flightNumber" select="./flightType/connecting/flightDetails/@flightNumber"/>
                                        <xsl:attribute name="flightNumber">
                                            <xsl:value-of select="$flightNumber"/>
                                        </xsl:attribute>
                                        
                                        <departure>
                                            <departureAirport>
                                          
                                                
                                                <departureAirportName>
                                                    <xsl:value-of select="./flightType/connecting/flightDetails/departure/departureAirport/departureAirportName"/>
                                                </departureAirportName>
                                                
                                            </departureAirport>
                                            <departureTerminal>
                                                <xsl:value-of select="'departureTerminal'"/>
                                            </departureTerminal>
                                            <departureGate>
                                                <xsl:value-of select="'departureGate'"/>
                                            </departureGate>
                                            <departureDate>
                                                <xsl:value-of select="./flightType/connecting/flightDetails/departure/departureDate"/>
                                            </departureDate>
                                            <departureTime>
                                                <xsl:value-of select="./flightType/connecting/flightDetails/departure/localDepartureTime"/>
                                            </departureTime>
                                            
                                            <localDepartureTime>
                                                <xsl:value-of select="./flightType/connecting/flightDetails/departure/localDepartureTime"/>
                                            </localDepartureTime>
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                            
                                        </departure>
                                        
                                        <arrival>
                                            <arrivalAirport>
                                                <arrivalAirportName>
                                                    <xsl:value-of select="./flightType/connecting/flightDetails/arrival/arrivalAirport/arrivalAirportName"/>
                                                </arrivalAirportName>
                                            </arrivalAirport>
                                            <arrivalTerminal>
                                                <xsl:value-of select="'arrivalTerminal'"/>
                                            </arrivalTerminal>
                                            <arrivalGate>
                                                <xsl:value-of select="'arrivalGate'"/>
                                            </arrivalGate>
                                            <arrivalDate>
                                                <xsl:value-of select="./flightType/connecting/flightDetails/arrival/arrivalDate"/>
                                            </arrivalDate>
                                            <arrivalTime>
                                                <xsl:value-of select="./flightType/connecting/flightDetails/arrival/localArrivalTime"/>
                                            </arrivalTime>
                                            <localArrivalTime>
                                                <xsl:value-of select="./flightType/connecting/flightDetails/arrival/localArrivalTime"/>
                                            </localArrivalTime>
                                            
                                            
                                            
                                            
                                            
                                        </arrival>
                                        
                                        <Airline>
                                            <carrier>
                                                <xsl:value-of select="'carrier'"/>
                                            </carrier>
                                            
                                            <operatedBy>
                                                <xsl:value-of select="./flightType/connecting/flightDetails/operatedBy"/>
                                            </operatedBy>
                                            
                                            <AirCraft>
                                                <brand></brand>
                                                <model>
                                                    <xsl:value-of select="./flightType/connecting/flightDetails/Aircraft/."/>
                                                </model>
                                                <flightNumber>
                                                    <xsl:value-of select="./flightType/connecting/flightDetails/@flightNumber"/>
                                                </flightNumber>
                                                
                                            </AirCraft>
                                            
                                        </Airline>
                                        
                                        <timeSchedule>
                                            <TravelTime>
                                                <xsl:choose>
                                                    <xsl:when test="boolean(./flightType/connecting/flightDetails/travelInfo/travelTime)">
                                                        <xsl:value-of select="./flightType/connecting/flightDetails/travelInfo/travelTime/."/>          
                                                    </xsl:when>
                                                    <xsl:otherwise>P1Y2M3DT1H15M0S</xsl:otherwise>
                                                </xsl:choose>
                                            </TravelTime>
                                            
                                        </timeSchedule>
                                        
                                        
                                        
                                        
                                    </flightDetails>
                                    
                                    
                                    
                                
                                
                                
                                
                                
                               
                            </connecting>
                            
                            
                            
                        </xsl:otherwise>
                        
                        </xsl:choose>
                    </flightType>
                    
                </flight>
                
            </xsl:for-each>
        </airlineCompanyDataProvider>
    </xsl:template>
</xsl:stylesheet>