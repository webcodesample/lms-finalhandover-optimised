<?php
include_once("common_include.php");

$profile = "";
$ledger = "";
$performance = "";
$withdrawl_request = "";

$tab_content_page = "sales_person_profile.php";

//get details of requested sales person id
$where_con_array = [ 'id' => $_REQUEST['sales_person_id'], ];
$sales_person = mysqli_fetch_assoc(getRowsDataCon('sales_person_list',$where_con_array,$con));

//get wallet id of requested sales person id with type sale person
$sp_where_con_array = [
						'holder_id' => $_REQUEST['sales_person_id'],
						'holder_type' => 6,
						];

$wallet_id = getFieldValueMultiCon('id',setWhereClause($sp_where_con_array),'wallet_list',$con);


if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'ledger')
{
	$ledger = "active";
	$tab_content_page = "sales_person_ledger.php";
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'performance')
{
	$performance = "active";
	$tab_content_page = "sales_person_performance.php";
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'withdrawl_request')
{
	$withdrawl_request = "active";
	$tab_content_page = "sales_person_withdrawl_request.php";
}
else 
{
	$profile ="active";
}

include_once("content_layout.php");
?>