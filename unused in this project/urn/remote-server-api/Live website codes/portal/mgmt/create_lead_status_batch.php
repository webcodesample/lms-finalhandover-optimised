<?php
include_once("common_include.php");

$description_array = array_merge($_REQUEST['description'],array('Deleted','URN Rejected','Visa Rejected'));
$step_order_array = array_merge($_REQUEST['step_order'], array(999,888,777));

$limit = count($description_array);

for($i=0;$i<$limit;$i++)
{
	$data_array = [
					'description' => $description_array[$i],
					'step_order' => $step_order_array[$i],
					'batch_id' => $_REQUEST['batch_id'],
					'datentime' => strtotime('now'),
					];
	insertData('lead_status_list', $data_array, $con);
}

header("Location:portal_settings.php");
?>