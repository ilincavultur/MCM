<ul>
{
for $x in doc("Merged.xml")/airlineCompanyDataProvider/flight/flightType/connecting/numberOfStops
where $x>2
order by $x
return <li>{data($x/@flightNumber)}</li>
}
</ul>