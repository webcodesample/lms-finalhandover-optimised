<?php
include_once("common_include.php");

//print_r($_REQUEST); print_r($_FILES); die();

$set_primary_bank_flag = 0;

if(($_REQUEST['is_primary'] == 1) || (getRowCount('crn',$_REQUEST['crn'],'bank_accounts_list',$con) == 0))
{
	$set_primary_bank_flag = 1;
}

$crn_bank_detail = $_REQUEST;
unset($crn_bank_detail['is_primary']);

$bank_id = insertData('bank_accounts_list',$crn_bank_detail,$con);

if($set_primary_bank_flag)
{
	$where_con_array =['id' => $_REQUEST['crn']];
	$customer_data = ['primary_bank' => $bank_id];
	updateData('customers_list',$customer_data,$where_con_array,$con);
}

uploadFile($_FILES['bank_proof'],'bankproof_'.$bank_id,'../bank_proofs/');

header("Location:../crn_management/manage_crn.php?crn=".$_REQUEST['crn']."&tab=bank_accounts");
?>