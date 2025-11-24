<?php
include_once("../pub/common_include.php");

$msg = "<h5 class='alert alert-subtle-primary py-3'>Get Access Your Account</h5>";

if(isset($_REQUEST['action_perform']))
{
	$where_con_array = [
						'username' => $_REQUEST['userid'],
						'password' => $_REQUEST['password'],
						'status' => 1,
						'login_type' => 5,
						];

	session_start();
	if(getRowCountMultiCol(setWhereClause($where_con_array),'login_detail',$con))
	{
		$loged_user_ref_id = getFieldValueMultiCon('ref_id',setWhereClause($where_con_array),'login_detail',$con);
		$loged_user_where_con = [ 'id' => substr($loged_user_ref_id,2)];

		$_SESSION['user_ref_id'] = $loged_user_ref_id;
		$_SESSION['userid'] = substr($loged_user_ref_id,2);
		$_SESSION['login_type'] = 5;
		$_SESSION['user_table'] = "students";
		$_SESSION['menu_id'] = 3;

		$loged_user = mysqli_fetch_assoc(getRowsDataCon($_SESSION['user_table'],$loged_user_where_con,$con));

		$_SESSION['username'] = $loged_user['name'];
		$_SESSION['email'] = $loged_user['email'];
		$_SESSION['mobile'] = $loged_user['mobile'];

		header("Location:course_finder.php");
	}
	else
	{
		$msg = "<h5 class='alert alert-subtle-danger py-3'>Sorry! Invalid Access</h5>";
	}
}

include_once("login_form.php");
?>