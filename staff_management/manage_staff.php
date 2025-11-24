<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

$where_con =['id' => $_REQUEST['staff_id']];

if(checkIsRequested('action_perform'))
{
	$duplicacy_check_con = [
							'name' => $_REQUEST['name'],
							'mobile' => $_REQUEST['mobile'],
							'email' => $_REQUEST['email'],
							];
	//check staff data duplicacy except with requested(get/post) staff_id
	if(getFieldValueMultiCon('id',setWhereClause($duplicacy_check_con),'staff_list',$con))
	$staff_id_on_duplicacy_check = getFieldValueMultiCon('id',setWhereClause($duplicacy_check_con),'staff_list',$con);
	else
	$staff_id_on_duplicacy_check = $_REQUEST['staff_id'];

	if($staff_id_on_duplicacy_check == $_REQUEST['staff_id'])
	{
		$authorised_menu_options = implode(',',$_REQUEST['authorised_menu']);
		$authorised_submenu_options = implode(',',$_REQUEST['authorised_submenu']);
		$staff_data = [
						'name' => $_REQUEST['name'],
						'mobile' => $_REQUEST['mobile'],
						'email' => $_REQUEST['email'],
						'designation' => $_REQUEST['designation'],
						'division' => $_REQUEST['division'],
						'authorised_menu_options' => $authorised_menu_options,
						'authorised_submenu_options' => $authorised_submenu_options,
					];

		$query_add_staff = "UPDATE staff_list SET ".setCRUDData($staff_data).setWhereClause($where_con);
		mysqli_query($con, $query_add_staff);

		$action_perform_msg .= "<h6 class='text-success'>Staff Updated Successfuly</h6>";
	}
	else
	{
		$action_perform_msg .= "<h6 class='text-danger'>Staff Data Duplicacy Error</h6>";
	}
}

$query_view_staff = "SELECT * FROM staff_list".setWhereClause($where_con);
$result_view_staff = mysqli_query($con, $query_view_staff);
$staff = mysqli_fetch_assoc($result_view_staff);

include_once("content_layout.php");
?>