<ul>
{
for $x in doc("Merged.xml")/airlineCompanyDataProvider/flight/flightType/*/flightDetails
where time($x/arrival/arrivalTime)>=time("00:01:00.000") or time($x/arrival/arrivalTime)<=time("08:00:00.000") or time($x/departure/departureTime) >=time("00:01:00.000") or time($x/departure/departureTime)<=time("08:00:00.000")
order by $x
return <li>{count($x/flightDetails/@flightNumber)}</li>
}
</ul>
