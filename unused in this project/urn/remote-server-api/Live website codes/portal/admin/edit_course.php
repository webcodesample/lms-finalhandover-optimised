<?php
include_once("common_include.php");

if(isset($_REQUEST['action_perfom']))
{
	$data = [
				'type' => $_REQUEST['course_type'],
				'intake' => $_REQUEST['course_intake'],
				'duration' => $_REQUEST['course_duration'],
				'eligibility' => $_REQUEST['course_eligibility'],
				'fee' => $_REQUEST['course_fee']
			];

	$update_query = "UPDATE course_list SET ".setCRUDData($data)." WHERE id = ".$_REQUEST['course_id'];
	$update_result = mysqli_query($con,$update_query);
	$msg = "<center><div class='text-success fw-bold mt-1'>Course Updated Succesfuly</div></center>";
	echo $msg;
}

$where_con = [
			'id' => $_REQUEST['course_id'],
			];

$query_view_course = "SELECT * FROM course_list".setWhereClause($where_con);
$result_view_course = mysqli_query($con, $query_view_course);
$course = mysqli_fetch_assoc($result_view_course);

include_once("content_layout.php");
?>