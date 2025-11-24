<?php
include_once("common_include.php");

$updated_columns = ['status_id'];

$current_status_step_order = getFieldValue('step_order','id',$_REQUEST['current_status_id'],'lead_status_list',$con);
$next_step_order = $current_status_step_order + 1;
$next_status_id = getFieldValue('id','step_order',$next_step_order,'lead_status_list',$con);
$next_status_description = getFieldValue('description','step_order',$next_step_order,'lead_status_list',$con);
$_REQUEST['status_id'] = $next_status_id;

//update lrn status in lrn_list tbl
$where_con = ['lrn' => $_REQUEST['lrn'],];
$lrn_data = ['status_id' => $next_status_id,];
updateData('lrn_list',$lrn_data,$where_con,$con);

recordLRNAuditHistory($updated_columns,$con);
recordLRNActivityHistory($con);

if($next_status_description == 'Approved')
{
	$lrn = getLatestUpdateRow('lrn',$_REQUEST['lrn'],'lrn_audit_history',$con);
	unset($lrn['id'],$lrn['updation_remark'],$lrn['updated_columns']);
	$lan = $_REQUEST['lrn'].strtotime('now');

	$dispatch_list_data = [
							'lan' => $lan,
							'lrn' => $_REQUEST['lrn'],
							'requested_amount' => $lrn['required_loan_amount'],
							'approved_loan_amount' => $lrn['approved_loan_amount'],
							'approval_datentime' => strtotime('now'),
							'approval_date' => strtotime('today'),
							];
	insertData('dispatch_list',$dispatch_list_data,$con);

	//set customer credt limit
	setCreditLimit($_REQUEST['lrn'],$lrn['approved_loan_amount'],$con);

	//insert lan_audit_history
	$lan_data = $lrn;
	$lan_data['lan'] = $lan;
	$lan_data['credit_limit'] = getCreditLimit($_REQUEST['lrn'],$con);
	$lan_data['datentime'] = strtotime('now');
	$lan_data['updation_remark'] = 'LAN Generated';

	insertData('lan_audit_history',$lan_data,$con);

	//insert lan_activity_history
	$lan_activty_info_array = [
								'lan' => $lan,
								'lrn' => $_REQUEST['lrn'],
								'comment' => 'LAN Generated',
								'activity_by' => $_SESSION['user_ref_id'],
								'datentime' => strtotime('now'),
								];
	insertData('lan_activity_history',$lan_activty_info_array,$con);
}

//create email history
lrnupdationEmailHistory('LRN Status Updated',$_REQUEST['lrn'],$con);

header("Location:manage_lrn.php?lrn=".$_REQUEST['lrn']);
?>