<?php
include_once("../pub/common_include.php");

$msg = "";

if(isset($_REQUEST['action_perform']))
{
	//print_r($_REQUEST);
	
	$where_con_array = [
						'username' => $_REQUEST['userid'],
						'password' => $_REQUEST['password'],
						'login_type' => 3,
						'status' => 1,
						];

	session_start();
	if(getRowCountMultiCol(setWhereClause($where_con_array),'login_detail',$con))
	{
		$loged_user_ref_id = getFieldValueMultiCon('ref_id',setWhereClause($where_con_array),'login_detail',$con);
		$loged_user_where_con = [ 'id' => substr($loged_user_ref_id,2)];
		$loged_user = mysqli_fetch_assoc(getRowsDataCon('staff_list',$loged_user_where_con,$con));
		$_SESSION['username'] = $loged_user['name'];
		$_SESSION['userid'] = substr($loged_user_ref_id,2);
		$_SESSION['staff_ref_id'] = $loged_user_ref_id;
		$_SESSION['email'] = $loged_user['email'];
		$_SESSION['mobile'] = $loged_user['mobile'];
		$_SESSION['login_type'] = $loged_user['role_type'];

		header("Location:dashboard.php");
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