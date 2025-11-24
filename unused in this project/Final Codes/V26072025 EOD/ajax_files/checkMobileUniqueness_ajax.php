<?php
include_once("../livesearch/con_ajax.php");
include_once("../common/function.php");

$where_con_suffix = "";

if($_REQUEST['ref_id'] == '')
{
	$staff_mobile_count = getRowCount('mobile',$_REQUEST['number'],'staff_list',$con);
	$agent_mobile_count = getRowCount('mobile',$_REQUEST['number'],'agent_list',$con);
	$sales_person_mobile_count = getRowCount('mobile',$_REQUEST['number'],'sales_person_list',$con);
	$agent_whatsapp_count = getRowCount('whatsapp',$_REQUEST['number'],'agent_list',$con);
	$sales_person_whatsapp_count = getRowCount('whatsapp',$_REQUEST['number'],'sales_person_list',$con);

	$total_count = $staff_mobile_count + $agent_mobile_count + $agent_whatsapp_count + $sales_person_mobile_count + $sales_person_whatsapp_count;
}
else
{
	$where_con_suffix_staff = "";
	$where_con_suffix_agent = "";
	$where_con_suffix_sales_person = "";

	if(substr($_REQUEST['ref_id'],0,2) == "BS")
	$where_con_suffix_staff .= " AND id != ".substr($_REQUEST['ref_id'],2);
	else if(substr($_REQUEST['ref_id'],0,2) == "SA")
	$where_con_suffix_agent .= " AND id != ".substr($_REQUEST['ref_id'],2);
	else if(substr($_REQUEST['ref_id'],0,2) == "SP")
	$where_con_suffix_sales_person .= " AND id != ".substr($_REQUEST['ref_id'],2);

	$staff_mobile_count_query = "SELECT * FROM staff_list WHERE mobile = '".$_REQUEST['number']."'".$where_con_suffix_staff;
	$staff_mobile_count = mysqli_num_rows(mysqli_query($con,$staff_mobile_count_query));

	$agent_mobile_count_query = "SELECT * FROM agent_list WHERE mobile = '".$_REQUEST['number']."'".$where_con_suffix_agent;
	$agent_mobile_count = mysqli_num_rows(mysqli_query($con,$agent_mobile_count_query));

	$agent_whatsapp_count_query = "SELECT * FROM agent_list WHERE whatsapp = '".$_REQUEST['number']."'".$where_con_suffix_agent;
	$agent_whatsapp_count = mysqli_num_rows(mysqli_query($con,$agent_whatsapp_count_query));

	$sp_mobile_count_query = "SELECT * FROM sales_person_list WHERE mobile = '".$_REQUEST['number']."'".$where_con_suffix_sales_person;
	$sp_mobile_count = mysqli_num_rows(mysqli_query($con,$sp_mobile_count_query));

	$sp_whatsapp_count_query = "SELECT * FROM sales_person_list WHERE whatsapp = '".$_REQUEST['number']."'".$where_con_suffix_sales_person;
	$sp_whatsapp_count = mysqli_num_rows(mysqli_query($con,$sp_whatsapp_count_query));

	$total_count = $staff_mobile_count + $agent_mobile_count + $agent_whatsapp_count + $sp_mobile_count + $sp_whatsapp_count;

}
echo $total_count;
?>