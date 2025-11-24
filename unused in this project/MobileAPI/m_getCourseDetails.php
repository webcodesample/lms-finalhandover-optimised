<?php
include_once("common_include.php");

$query = "SELECT *, ul.name AS university_name, cl.name AS course_name, cl.id AS course_id FROM course_list AS cl join university_list AS ul ON cl.university_id = ul.id WHERE cl.id = ".$_REQUEST['course_id'];
$result = mysqli_query($con, $query);

$rowdata = [];

while($row = mysqli_fetch_assoc($result))
{
	$rowdata[] = $row;
}

echo json_encode($rowdata);
?>