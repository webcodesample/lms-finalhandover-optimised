<?php
include_once("../pub/common_include.php");

$msg = "";

if(isset($_REQUEST['action_perform']))
{
	if(getRowCount('email',$_REQUEST['email'],'staff_list',$con))
	{
		$msg .= "<h6 class='text-danger'>Mail Sent</h6>";
	}
	else
	{
		$msg .= "<h6 class='text-danger'>Invalid Access</h6>";
	}
}

include_once("forgot_password_form.php");
?>