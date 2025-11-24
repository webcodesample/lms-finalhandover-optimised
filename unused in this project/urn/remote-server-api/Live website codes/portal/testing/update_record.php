<?php
include_once("common_include.php");

$feedback_data = [
				'report_id' => $_REQUEST['report_id'],
				'updation_remark' => $_REQUEST['update_remark'],
				'update_datentime' => strtotime('now'),
				'update_by' => $_SESSION['username'],
				];
insertData('testing_report_history',$feedback_data,$con);

$where_con_array = [ 'id' => $_REQUEST['report_id'],];

$report_data_update = [ 
						'status' => $_REQUEST['status'] , 
						'update_datentime' => strtotime('now'),
						'update_remark' => $_REQUEST['update_remark'],
						'updated_by' => $_SESSION['username'],
						];

updateData('testing_report_list',$report_data_update,$where_con_array,$con);

header("Location:test_report.php");
?>