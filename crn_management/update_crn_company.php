<?php
include_once("common_include.php");

print_r($_REQUEST);

$_REQUEST['doi'] = strtotime($_REQUEST['doi']);

if(getRowCount('crn',$_REQUEST['crn'],'crn_company_details',$con) > 0)
{
	$where_con_array =['crn' => $_REQUEST['crn']];
	updateData('crn_company_details',$_REQUEST,$where_con_array,$con);
}
else
insertData('crn_company_details',$_REQUEST,$con);

header("Location: manage_crn.php?crn=".$_REQUEST['crn']."&tab=company_details")
?>