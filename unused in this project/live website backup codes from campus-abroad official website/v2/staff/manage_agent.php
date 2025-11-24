<?php
include_once("common_include.php");

$profile = "";
$bank = "";
$ledger = "";
$performance = "";
$withdrawl_request = "";

$tab_content_page = "agent_profile.php";

//get details of requested agent id
$where_con_array = [ 'id' => $_REQUEST['agent_id'], ];
$agent = mysqli_fetch_assoc(getRowsDataCon('agent_list',$where_con_array,$con));

//get wallet id of requested agent id with type agent
$agent_where_con_array = [
						'holder_id' => $_REQUEST['agent_id'],
						'holder_type' => 4,
						];

$wallet_id = getFieldValueMultiCon('id',setWhereClause($agent_where_con_array),'wallet_list',$con);


if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'ledger')
{
	$ledger = "active";
	$tab_content_page = "agent_ledger.php";
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'performance')
{
	$performance = "active";
	$tab_content_page = "agent_performance.php";
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'withdrawl_request')
{
	$withdrawl_request = "active";
	$tab_content_page = "agent_withdrawl_request.php";
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'bank')
{
	$bank = "active";
	$tab_content_page = "agent_bank_detail.php";
}
else 
{
	$profile ="active";
}

if($agent['type'])
{
	$company_section_display = "";
	$company_input_required = "required";
	$company_section_input = "";
}
else
{
	$company_section_display = "none";
	$company_section_input = "disabled";
	$company_input_required = "";
}

include_once("content_layout.php");
?>