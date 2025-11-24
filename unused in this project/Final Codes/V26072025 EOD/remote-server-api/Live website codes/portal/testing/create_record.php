<?php
include_once("common_include.php");

$feedback_data = [
				'type' => $_REQUEST['report_type'],
				'testing_comment' => $_REQUEST['test_remark'],
				'datentime' => strtotime('now'),
				'status' => 0,
				'submit_by' => $_SESSION['username'],
				'update_datentime' => strtotime('now'),
				];
insertData('testing_report_list',$feedback_data,$con);

header("Location:test_report.php");
?>