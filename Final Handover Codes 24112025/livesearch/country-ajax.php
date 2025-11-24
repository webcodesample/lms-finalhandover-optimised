<?php	
include_once("con_ajax.php");

$search_term = $_REQUEST['term'];
$query 	= "SELECT * FROM country_list WHERE name LIKE '%$search_term%'";
$result = mysqli_query($con,$query);
while($row = mysqli_fetch_assoc($result))
{
	$val[] = $row['id'].' - '.$row['name'];
}
echo json_encode($val);
?>