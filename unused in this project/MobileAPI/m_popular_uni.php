<?php
include_once("common_include.php");

$rowdata = [];

$query = "SELECT * FROM countrywise_top10_university WHERE show_in_popular = 1";
$result = mysqli_query($con, $query);

$i = 0;

while($row = mysqli_fetch_assoc($result))
{
	$i++;
	$row['rowindex'] = $i;
	$row['uni_name'] = getFieldValue('name','id',$row['uni_id'],'university_list',$con);
	$row['uni_logo'] = getFieldValue('logo','id',$row['uni_id'],'university_list',$con);
	$row['country'] = getFieldValue('name','id',$row['country_id'],'country_list',$con);
	$rowdata[] = $row;
}

echo json_encode($rowdata);
?>