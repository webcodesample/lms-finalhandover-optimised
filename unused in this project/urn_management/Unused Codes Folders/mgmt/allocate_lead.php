<?php
include_once("common_include.php");

if(isset($_REQUEST['sales_person_id']))
$requested_allocation_id = $_REQUEST['sales_person_id'];

if(isset($_REQUEST['agent_id']))
$requested_allocation_id = $_REQUEST['agent_id'];

$lead_status_id_latest = getLatestUpdate('status_id','lead_id',$_REQUEST['lead_id'],'leads_activity_history',$con);

if(getFieldValue('description','id',$lead_status_id_latest,'lead_status_list',$con) != 'complete')
{
	//check requested lead previously assigned any agent/sales person or not
	if(getRowCount('lead_id',$_REQUEST['lead_id'],'lead_allocation_list',$con) > 0)
		$alocation_flag = 1;
	else
		$alocation_flag = 0;

	//check requested(get/post) staff_id already assigned to requested(get/post) lead_id or not
	if($alocation_flag == 1 && (getLatestUpdate('allocated_id','lead_id',$_REQUEST['lead_id'],'lead_allocation_list',$con) == $requested_allocation_id))
	{
		$updation_msg = "<h6 class='text-success'>Requested Staff assigned already.</h6>";
	}
	else
	{
		$lead_data = [
						'allocated_id' => $requested_allocation_id
					];
		$where_con_array = [ 'id' => $_REQUEST['lead_id'],];

		updateData('leads_details',$lead_data,$where_con_array,$con);

		$lead_activity_data = [
					'lead_id' => $_REQUEST['lead_id'],
					'status_id' => $lead_status_id_latest,
					'comment' => 'assigned to '.substr($requested_allocation_id,0,2).(100+substr($requested_allocation_id,2)),
					'activity_by' => 'admin',
					'datentime' => strtotime('now')
					];
			
		insertData('leads_activity_history',$lead_activity_data,$con);

		$ls_relation_data = [
								'lead_id' => $_REQUEST['lead_id'],
								'allocated_id' => $requested_allocation_id,
								'datentime' => strtotime('now'),
							];

		//insert into lead_allocation_list table
		insertData('lead_allocation_list',$ls_relation_data,$con);

		$updation_msg = "<h6 class='text-success'>Staff assigned successfuly.</h6>";
	}
}
else
{
	$updation_msg = "<h6 class='text-danger'>Lead has been already closed.</h6>";
}

header("Location:urn_history.php?lead_id=".$_REQUEST['lead_id']);
?>