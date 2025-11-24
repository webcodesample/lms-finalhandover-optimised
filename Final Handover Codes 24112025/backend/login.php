<?php
include_once("../pub/common_include.php");

$msg = "<h5 class='alert alert-subtle-primary py-3'>Get Access Your Account</h5>";

if(isset($_REQUEST['action_perform']))
{
	$where_con_array = [
						'username' => $_REQUEST['userid'],
						'password' => $_REQUEST['password'],
						'status' => 1,
						];

	session_start();
	if(getRowCountMultiCol(setWhereClause($where_con_array),'login_detail',$con))
	{
		$loged_user_ref_id = getFieldValueMultiCon('ref_id',setWhereClause($where_con_array),'login_detail',$con);
		$loged_user_where_con = [ 'id' => substr($loged_user_ref_id,2)];

		$_SESSION['user_ref_id'] = $loged_user_ref_id;
		$_SESSION['userid'] = substr($loged_user_ref_id,2);

		if(substr($loged_user_ref_id,0,2) == 'BS')
		{
			$_SESSION['login_type'] = getFieldValue('login_type','ref_id',$loged_user_ref_id,'login_detail',$con);
			$_SESSION['user_table'] = "staff_list";
			$_SESSION['menu_id'] = 1;
		}
		else if(substr($loged_user_ref_id,0,2) == 'SA')
		{
			$_SESSION['login_type'] = 4;
			$_SESSION['user_table'] = "agent_list";
			$_SESSION['menu_id'] = 2;
		}
		else if(substr($loged_user_ref_id,0,2) == 'SP')
		{
			$_SESSION['login_type'] = 6;
			$_SESSION['user_table'] = "sales_person_list";
			$_SESSION['menu_id'] = 2;
		}
		else if(substr($loged_user_ref_id,0,2) == 'ST')
		{
			$_SESSION['login_type'] = 5;
			$_SESSION['user_table'] = "students";
			$_SESSION['menu_id'] = 3;
		}
		$loged_user = mysqli_fetch_assoc(getRowsDataCon($_SESSION['user_table'],$loged_user_where_con,$con));

		$_SESSION['username'] = $loged_user['name'];
		$_SESSION['email'] = $loged_user['email'];
		$_SESSION['mobile'] = $loged_user['mobile'];

		//create entry in logged user list
		$logged_user_data = [ 'user_ref_id' => $_SESSION['user_ref_id']];
		insertData('logged_user_list',$logged_user_data,$con);

		if(in_array($_SESSION['login_type'],array(1,2,3,4,5,6,7,8)))
			header("Location:../mydashboard/dashboard.php");
	}
	else
	{
		$msg = "<h5 class='alert alert-subtle-danger py-3'>Sorry! Invalid Access</h5>";
	}
}

include_once("login_page.php");
?>