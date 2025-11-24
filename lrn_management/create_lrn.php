<?php
include_once("common_include.php");

//retrive crn details
$crn_con = ['id' => $_REQUEST['crn']];
$crn = mysqli_fetch_assoc(getRowsDataCon('customers_list',$crn_con,$con));
$lrn_source_id = $crn['lead_source_id'];
$crn['bank_account'] = $crn['primary_bank'];
unset($crn['id'],$crn['lead_source_id'],$crn['primary_bank']);

//get crn company details
if($crn['cust_type'] == 2)
{
	$crn_company_con = ['crn' => $_REQUEST['crn']];
	$crn_company = mysqli_fetch_assoc(getRowsDataCon('crn_company_details',$crn_company_con,$con));
	$crn_company['turnover'] = $crn_company['annual_turnover'];
	unset($crn_company['id'],$crn_company['crn'],$crn_company['annual_turnover']);

	foreach($crn_company AS $key => $value)
	{
		$crn['company_'.$key] = $value;
	}
}

//step 1 : create new lrn
$lrn = createUniqueLRN($con);
$latest_status_batch_id = getMaxBatchId($con);
$where_con_array = [
					'batch_id' => $latest_status_batch_id,
					'step_order' => 1,
					];
$new_lrn_status_id = getFieldValueMultiCon('id',setWhereClause($where_con_array),'lead_status_list',$con);

$lrn_data_array = [
					'lrn' => $lrn,
					'status_id' => $new_lrn_status_id,
					'crn' => $_REQUEST['crn'],
					'source_id' => $lrn_source_id,
					'datentime' => strtotime('now'),
					'created_by' => $_SESSION['user_ref_id'],
				];
	
insertData('lrn_list', $lrn_data_array, $con);

//Step 2 : copy crn documents to lrn
copyCRNDocsToLRN($_REQUEST['crn'],$lrn,$con);

//step 3 : insert new record in lrn_activity_history
$lrn_activty_info_array = [
					'lrn' => $lrn,
					'status_id' => $new_lrn_status_id,
					'comment' => 'LRN Created',
					'activity_by' => $_SESSION['user_ref_id'],
					'datentime' => strtotime('now'),
					];

insertData('lrn_activity_history', $lrn_activty_info_array, $con);

//step 4 : insert lrn_audit_history
$lrn_audit_history_array = [
					'lrn' => $lrn,
					'status_id' => $new_lrn_status_id,
					'updation_remark' => 'Created By Admin',
					'datentime' => strtotime('now'),
					];
unset($crn['credit_limit']);
$lrn_audit_history_array = array_merge($lrn_audit_history_array,$crn);	
insertData('lrn_audit_history', $lrn_audit_history_array, $con);

header("Location:../lrn_management/manage_lrn.php?lrn=".$lrn."&tab=documents");
?>