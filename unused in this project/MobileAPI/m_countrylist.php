<?php
include_once("common_include.php");

$query = "SELECT * FROM country_list ORDER BY name ASC";
$result = mysqli_query($con, $query);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($result))
{
	$i++;
	$row['rowindex'] = $i;
	$row['logo'] = "http://campus-abroad.co.in/v3/country-flags/".$row['name']."-sm.png";
	$rowdata[] = $row;
}

echo json_encode($rowdata);
?>