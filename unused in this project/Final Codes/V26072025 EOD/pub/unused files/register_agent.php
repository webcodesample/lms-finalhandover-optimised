<?php
include_once("common_include.php");

if($_REQUEST['agent_type'] == 1)
{
	$where_con = [
				'mobile' => $_REQUEST['mobile'],
				'whatsapp' => $_REQUEST['whatsapp'],
				'email' => $_REQUEST['email'],
				'company_website' => $_REQUEST['company_website'],
			];
}
else
{
	$where_con = [
				'mobile' => $_REQUEST['mobile'],
				'whatsapp' => $_REQUEST['whatsapp'],
				'email' => $_REQUEST['email'],
			];
}	

//check agent data already exist or not
if(getRowCountMultiCol(setWhereClauseOR($where_con),'agent_list',$con) == 0)
{
	$agent_data = [
					'type' => $_REQUEST['agent_type'],
					'name' => $_REQUEST['name'],
					'mobile' => $_REQUEST['mobile'],
					'whatsapp' => $_REQUEST['whatsapp'],
					'email' => $_REQUEST['email'],
					'company_name' => $_REQUEST['company_name'],
					'company_address' => $_REQUEST['company_address'],
					'company_website' => $_REQUEST['company_website'],
					];
		
	$current_inserted_agent_id = insertData('agent_list',$agent_data,$con);

	$login_create_data = [
							'ref_id' => 'SA'.$current_inserted_agent_id,
							'username' => $_REQUEST['email'],
							'password' => '123456',
							'login_type' => 4,
							'status' => 1,
						];

	insertData('login_detail', $login_create_data,$con);

	header("Location:new_partner.php?msg=success");
}
else {
	header("Location:new_partner.php?msg=error");
}

?>
