<?php
include_once("common_include.php");

function getSourceArray($con, $description)
{
	$sql = "SELECT id FROM lead_sources_list WHERE description LIKE '%".$description."%'";
	$result = mysqli_query($con,$sql);

	$rowdata = [];
	$i = 0;

	while($row = mysqli_fetch_assoc($result))
	{
		$i++;
		$rowdata[] = $row['id'];
	}
	return $rowdata;
}
?>