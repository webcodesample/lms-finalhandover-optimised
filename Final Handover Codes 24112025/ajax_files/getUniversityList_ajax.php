<?php
include_once("../livesearch/con_ajax.php");

$where_clause = '';

if($_REQUEST['country'] != '')
$where_clause .= "WHERE country_id = ".$_REQUEST['country'];

$query = "SELECT * FROM university_list ".$where_clause." ORDER BY name ASC";
$result = mysqli_query($con,$query);

$options = "<option value=''>University</option>";

while($university = mysqli_fetch_assoc($result))
{
	$options .= "<option value='".$university['id']."'>".strtoupper($university['name'])."</option>";
}

echo $options;
?>