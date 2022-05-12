<ul>
{
for $x in doc("Merged.xml")/airlineCompanyDataProvider/flight
where $x/fare/status="Not available"
order by $x
return <li>{data($x/flightType/nonStop/flightDetails/@flightNumber)}</li>
}
</ul>