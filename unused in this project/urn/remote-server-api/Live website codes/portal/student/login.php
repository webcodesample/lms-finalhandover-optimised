<?php
include_once("../pub/common_include.php");

$msg = "";

if(isset($_REQUEST['action_perform']))
{
	$where_con_array = [
						'userid' => $_REQUEST['userid'],
						'password' => $_REQUEST['password'],
						];

	session_start();
	if(getRowCountMultiCol(setWhereClause($where_con_array),'students',$con))
	{
		$loged_user = mysqli_fetch_assoc(getRowsDataCon('students',$where_con_array,$con));
		$_SESSION['username'] = $loged_user['name'];
		$_SESSION['userid'] = $loged_user['id'];
		$_SESSION['student_ref_id'] = 'ST'.$loged_user['id'];
		$_SESSION['email'] = $loged_user['email'];
		$_SESSION['mobile'] = $loged_user['mobile'];
		$_SESSION['login_type'] = 5;
		header("Location:course_finder.php");
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