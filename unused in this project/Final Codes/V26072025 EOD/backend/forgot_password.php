<?php
include_once("../pub/common_include.php");

$msg = "&nbsp;";

if(isset($_REQUEST['action_perform']))
{
	$msg = "Please check your mail to reset password.";
	/*if(getRowCount('email',$_REQUEST['email'],'staff_list',$con))
	{
		$msg = "<h6 class='text-success mt-3'>Mail Sent</h6>";
	}
	else
	{
		$msg = "<h6 class='text-danger mt-3'>Invalid Access</h6>";
	}*/
}

include_once("forgot_password_form.php");
?>