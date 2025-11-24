<?php
include_once("common_include.php");

$query = "SELECT DISTINCT type FROM course_list ORDER BY type ASC";
$result = mysqli_query($con, $query);

$i = 0;
$rowdata = [];

while($row = mysqli_fetch_assoc($result))
{
	$i++;
	$row['rowindex'] = $i;
	$rowdata[] = $row;
}

echo json_encode($rowdata);
?>