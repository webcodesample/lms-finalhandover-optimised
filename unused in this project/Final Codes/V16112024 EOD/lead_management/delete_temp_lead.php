<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['id'] ];

if(isset($_REQUEST['action_perform']))
{
	$temp_lead_data = [
						'status' => 2,
						'remark' => $_REQUEST['remark'],
						'hidden' => 1,
						];

	updateData('temp_leads',$temp_lead_data,$where_con_array,$con);

	header("Location:temp_leads.php");
}
else
{
	$temp_lead = mysqli_fetch_assoc(getRowsDataCon('temp_leads',$where_con_array,$con));
	include_once("content_layout.php");
}
?>