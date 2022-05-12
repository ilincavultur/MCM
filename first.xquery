<ul>
{
for $x in doc("Merged.xml")/airlineCompanyDataProvider/flight/flightType/nonStop/flightDetails
order by $x
return <li>{data($x/@flightNumber)}</li>
}
</ul>