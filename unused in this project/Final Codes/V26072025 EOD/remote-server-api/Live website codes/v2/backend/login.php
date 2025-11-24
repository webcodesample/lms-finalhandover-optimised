<?php
include_once("../pub/common_include.php");

$msg = "";

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

		if($_SESSION['login_type'] == 1 || $_SESSION['login_type'] == 3 || $_SESSION['login_type'] == 8 || $_SESSION['login_type'] == 7)
			header("Location:../staff/dashboard.php");
		else if($_SESSION['login_type'] == 4 || $_SESSION['login_type'] == 6)
			header("Location:../partner/dashboard.php");
		else if($_SESSION['login_type'] == 5)
			header("Location:../student/course_finder.php");
	}
	else
	{
		$msg .= "<h6 class='text-danger'>Invalid Access</h6>";
	}
}
else
{
	$msg .= "<h6 class='text-success'>Enter Valid Credential</h6>";
}

include_once("login_form.php");
?>