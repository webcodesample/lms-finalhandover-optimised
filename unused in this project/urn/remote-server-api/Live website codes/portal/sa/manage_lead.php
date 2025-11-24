<?php
include_once("common_include.php");

if(checkIsRequested('action_perform'))
{
	if(getLatestUpdate('status_id','lead_id',$_REQUEST['lead_id'],'leads_activity_history',$con) != 7)
	{
		//check requested lead previously assigned any staff or not
		if(getRowCount('lead_id',$_REQUEST['lead_id'],'lead_staff_relation',$con) > 0)
		$staff_alocation_flag = 1;
		else
		$staff_alocation_flag = 0;

		//check requested(get/post) staff_id already assigned to requested(get/post) lead_id or not
		if($staff_alocation_flag == 1 && (getLatestUpdate('staff_id','lead_id',$_REQUEST['lead_id'],'lead_staff_relation',$con) == $_REQUEST['staff_id']))
		{
			$updation_msg = "<h6 class='text-success'>Requested Staff assigned already.</h6>";
		}
		else
		{
			$current_status_id = getLatestUpdate('status_id','lead_id',$_REQUEST['lead_id'],'leads_activity_history',$con);
			$staff_name = getFieldValue('name','id',$_REQUEST['staff_id'],'staff_list',$con);
			$lead_data = [
						'lead_id' => $_REQUEST['lead_id'],
						'status_id' => $current_status_id,
						'comment' => 'assigned to '.$staff_name,
						'activity_by' => 'admin',
						'datentime' => strtotime('now')
						];

			$query_update_lead = "INSERT INTO leads_activity_history SET ".setCRUDData($lead_data);
			$result_update_lead = mysqli_query($con, $query_update_lead);

			$ls_relation_data = [
									'lead_id' => $_REQUEST['lead_id'],
									'staff_id' => $_REQUEST['staff_id'],
									'datentime' => strtotime('now'),
								];

			//insert into lead_staff_relation table
			$query_insert_ls_relation = "INSERT INTO lead_staff_relation SET ".setCRUDData($ls_relation_data);
			mysqli_query($con, $query_insert_ls_relation);

			$updation_msg = "<h6 class='text-success'>Staff assigned successfuly.</h6>";
		}
	}
	else
	{
		$updation_msg = "<h6 class='text-danger'>Lead has been already closed.</h6>";
	}
}

include_once("manage_lead_content.php");

?>