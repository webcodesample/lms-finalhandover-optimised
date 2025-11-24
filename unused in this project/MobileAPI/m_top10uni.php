<?php
include_once("common_include.php");

$rowdata = [];

$query = "SELECT * FROM countrywise_top10_university AS CTU JOIN university_list AS UL ON CTU.uni_id = UL.id WHERE CTU.country_id = ".$_REQUEST['country']." ORDER BY CTU.rank ASC";
$result = mysqli_query($con, $query);

$i = 0;

while($row = mysqli_fetch_assoc($result))
{
	$i++;
	$row['rowindex'] = $i;
	$rowdata[] = $row;
}

echo json_encode($rowdata);
?>