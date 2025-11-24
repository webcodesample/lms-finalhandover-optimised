<?php
include_once("common_include.php");

$rowdata = [];

$query = "SELECT * FROM popular_search ORDER BY description ASC LIMIT 10";
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