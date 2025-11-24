<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

if(isset($_REQUEST['tab']))
$requested_tab = $_REQUEST['tab'];
else
$requested_tab = 'basic_details';

$where_con_array =['id' => $_REQUEST['crn']];
$crn = mysqli_fetch_assoc(getRowsDataCon('customers_list',$where_con_array,$con));

if($crn['cust_type'] == 2)
$tabs_array = ['basic_details','guarantor_list','documents','company_details','bank_accounts','lrn_list'];
else
$tabs_array = ['basic_details','guarantor_list','documents','bank_accounts','lrn_list'];

$crn_bank_account_count = getRowCount('crn',$_REQUEST['crn'],'bank_accounts_list',$con);
$crn_guarantor_count = getRowCount('crn',$_REQUEST['crn'],'guarantor_list',$con);
$crn_company_count = getRowCount('crn',$_REQUEST['crn'],'crn_company_details',$con);

//get active lrn for crn, but client doesnot want this contraint
$where_clause = " WHERE find_in_set(status_id,'1,2,9,5') AND crn = ".$_REQUEST['crn'];
$crn_active_lrn_count = getRowCountMultiCol($where_clause,'lrn_list',$con);

$applyBtn_display_flag = 0;

if($crn_bank_account_count > 0 && $crn_guarantor_count > 0 && ($crn['cust_type'] == 1 || ($crn['cust_type'] == 2 && $crn_company_count > 0)))
$applyBtn_display_flag = 1;

function displayApplyBtn($displayFlag)
{
	if($displayFlag)
	return "<a href='../lrn_management/create_lrn.php?crn=".$_REQUEST['crn']."' class='btn btn-sm btn-subtle-success me-2' onClick='return confirm(&quot;Are you sure to apply?&quot;)'>Apply</a>";
}

include_once("content_layout.php");
?>