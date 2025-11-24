<?php
include_once("common_include.php");

if(isset($_REQUEST['action_perfom']))
{
	$university_arr = explode(' - ',$_REQUEST['university']);
	$intake = implode(',', $_REQUEST['course_intake']);

	$data = [
				'type' => $_REQUEST['course_type'],
				'name' => $_REQUEST['course_name'],
				'intake' => $intake,
				'duration' => $_REQUEST['course_duration'],
				'eligibility' => $_REQUEST['course_eligibility'],
				'university_id' => $university_arr[0],
				'fee' => $_REQUEST['course_fee']
			];

	$where_con = [
				'name' => $_REQUEST['course_name'],
				'university_id' => $university_arr[0],
			];

	if(getRowCountMultiCol(setWhereClause($where_con),'course_list',$con))
	{
		$msg = "<center><div class='text-danger fw-bold mt-1'>Course Already Exist</div></center>";
	}
	else
	{
		$insert_query = "INSERT INTO course_list SET ".setCRUDData($data);
		$insert_result = mysqli_query($con,$insert_query);
		$msg = "<center><div class='text-success fw-bold mt-1'>Course Added Succesfuly</div></center>";
	}

	echo $msg;
}

include_once("head_crm.php");
include_once("content_layout.php");
?>