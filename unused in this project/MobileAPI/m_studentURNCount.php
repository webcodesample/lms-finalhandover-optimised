<?php
include_once("common_include.php");

$query = "select count(*) AS urn_count from leads_details where student_id = ".$_REQUEST['student_id'];
$count = mysqli_fetch_assoc(mysqli_query($con,$query));


echo json_encode($count);
?>
