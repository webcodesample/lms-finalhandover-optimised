<?php
include_once("common_include.php");

if(isset($_REQUEST['msg']))
{
	if($_REQUEST['msg'] == 'success')
		$action_perform_msg = "Agent Added Successfuly";
	else
	{
		$action_perform_msg = "Details Already Exist.<br>Please try with other details.";
		$alertbox_color_code = "warning";
		$alertbox_title = "Warning !";
	}
}
include_once("content_layout.php");
?>