<?php
include_once("common_include.php");

$msg="";

if(isset($_REQUEST['msg']))
{
	if($_REQUEST['msg'] == 'success')
	{
		$msg .= "<h5 class='text-success gtext-center'>Thanks for ur interest.<br>We will connect you soon.</h5>";
	}
	else
	{
		$msg .= "<h5 class='text-danger text-center'>Details Already Exist.<br>Please try with other details.</h5>";
	}
}


include_once("content_layout.php");
?>