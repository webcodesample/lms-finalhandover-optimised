<?php
include_once("../livesearch/con_ajax.php");

$where_clause = '';

if($_REQUEST['university'] != '')
$where_clause .= "WHERE university_id = ".$_REQUEST['university'];

$query = "SELECT * FROM course_list ".$where_clause." ORDER BY name ASC";
$result = mysqli_query($con,$query);

$options = "<option value=''>Course</option>";

while($course = mysqli_fetch_assoc($result))
{
	$options .= "<option value='".$course['name']."'>".strtoupper($course['name'])."</option>";
}

echo $options;
?>