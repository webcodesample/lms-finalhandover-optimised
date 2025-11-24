<?php	
include_once("con_ajax.php");

$search_term = $_REQUEST['term'];
$query 	= "SELECT * FROM product_list WHERE description LIKE '%$search_term%'";
$result = mysqli_query($con,$query);
while($row = mysqli_fetch_assoc($result))
{
	$val[] = $row['description'].' - '.$row['id'];
}
echo json_encode($val);
?>