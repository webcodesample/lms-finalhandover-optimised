<?php
include_once("common_include.php");

if(checkIsRequested('action_perform'))
{
	$duplicacy_check_con = [
							'name' => $_REQUEST['name'],
							'mobile' => $_REQUEST['mobile'],
							'email' => $_REQUEST['email'],
							];
	//check staff data duplicacy
	if(getRowCountMultiCol(setWhereClause($duplicacy_check_con),'staff_list',$con) == 0)
	{
		$authorised_menu_options = implode(',',$_REQUEST['authorised_menu']);
		$authorised_submenu_options = implode(',',$_REQUEST['authorised_submenu']);
		$staff_data = [
						'name' => $_REQUEST['name'],
						'mobile' => $_REQUEST['mobile'],
						'email' => $_REQUEST['email'],
						'designation' => $_REQUEST['designation'],
						'division' => $_REQUEST['division'],
						'role_type' => $_REQUEST['role_type'],
						'authorised_menu_options' => $authorised_menu_options,
						'authorised_submenu_options' => $authorised_submenu_options,
						];

		$current_inserted_staff_id = insertData('staff_list',$staff_data,$con);

		//create staff login
		$login_create_data = [
								'ref_id' => 'BS'.$current_inserted_staff_id,
								'username' => $_REQUEST['email'],
								'password' => '123456',
								'login_type' => $_REQUEST['role_type'],
								'status' => 1,
							];

		insertData('login_detail', $login_create_data,$con);

		//create email history
		if($_REQUEST['role_type'] == 3)
		signupEmailHistory('Backend Staff Signup',$_REQUEST['email'],$_REQUEST['name'],$con);
		else if($_REQUEST['role_type'] == 8)
		signupEmailHistory('Management Staff Signup',$_REQUEST['email'],$_REQUEST['name'],$con);

		$action_perform_msg .= "<h6 class='text-success'>Staff Added Successfuly</h6>";
	}
	else
	{
		$action_perform_msg .= "<h6 class='text-danger'>Staff Data Alreday Exist</h6>";
	}
}

include_once("content_layout.php");
?>