<?php
include_once("common_include.php");

$lan = getLatestUpdateRow('lan',$_REQUEST['lan'],'lan_audit_history',$con);

if(updateCreditLimit($lan['lrn'],$_REQUEST['new_credit_limit'],$con))
{
	unset($lan['id'],$lan['updation_remark'],$lan['updated_columns']);
	$lan['credit_limit'] = $_REQUEST['new_credit_limit'];
	$lan['updated_columns'] = 'credit_limit';
	$lan['updation_remark'] = 'Credit Limit Updated';
	$lan['datentime'] = strtotime('now');
	
	insertData('lan_audit_history',$lan,$con);

	//insert lan_activity_history
	$lan_activty_info_array = [
								'lan' => $lan['lan'],
								'lrn' => $lan['lrn'],
								'comment' => 'Credit Limit Updated',
								'activity_by' => $_SESSION['user_ref_id'],
								'datentime' => strtotime('now'),
								];
	insertData('lan_activity_history',$lan_activty_info_array,$con);
}

header("Location: manage_lan.php?lan=".$_REQUEST['lan']."&tab=ledger");
?>