<ul>
{
for $x in doc("Merged.xml")/airlineCompanyDataProvider/flight/flightType/*
where $x/flightDetails/Airline/operatedBy="Austrian Airlines" 
order by $x
return <li>{data($x/flightDetails/@flightNumber)}</li>
}
</ul>