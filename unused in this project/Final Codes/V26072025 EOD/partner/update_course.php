<?php
include_once("common_include.php");

$intake = implode(',', $_REQUEST['course_intake']);

$where_con_array = [ 'id' => $_REQUEST['course_id'] ];

$data_array = [
			'type' => $_REQUEST['course_type'],
			'intake' => $intake,
			'duration' => $_REQUEST['course_duration'],
			'eligibility' => $_REQUEST['course_eligibility'],
			'fee' => $_REQUEST['course_fee']
		];

updateData('course_list',$data_array,$where_con_array,$con);

header("Location:edit_course.php?course_id=".$_REQUEST['course_id']);
?>