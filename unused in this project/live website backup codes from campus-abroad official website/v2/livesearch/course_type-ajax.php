<?php	
include_once("con_ajax.php");

$search_term = $_REQUEST['term'];
$query 	= "SELECT DISTINCT type FROM course_list WHERE type LIKE '%$search_term%'";
$result = mysqli_query($con,$query);
while($row = mysqli_fetch_assoc($result))
{
	$val[] = $row['type'];
}
echo json_encode($val);
?>