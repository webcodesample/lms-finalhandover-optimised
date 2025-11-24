<?php
include_once("common_include.php");

$call_history_data = [
						'lead_id' => $_REQUEST['lead_id'],
						'type' => $_REQUEST['call_type'],
						'remark' => $_REQUEST['call_remark'],
						'remark_by' =>	$_SESSION['user_ref_id'],
						'datentime' => strtotime($_REQUEST['date'].' '.$_REQUEST['time']),
						'dataentry_datentime' => strtotime("now"),
						];

insertData('call_history',$call_history_data,$con);

header("Location: urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=communication");
?>