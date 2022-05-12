<ul>
{
for $x in doc("Merged.xml")/airlineCompanyDataProvider/flight
where $x/from/city="Boston"
and $x/to/city="Chicago"
order by $x
return <li>{$x/totalTraveltime}</li>
}
</ul>