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
$report_id = insertData('testing_report_list_v2',$feedback_data,$con);

$feedback_data = [
				'report_id' => $report_id,
				'updation_remark' => $_REQUEST['test_remark'],
				'update_datentime' => strtotime('now'),
				'update_by' => $_SESSION['username'],
				];
insertData('testing_report_history_v2',$feedback_data,$con);


header("Location:test_report.php");
?>