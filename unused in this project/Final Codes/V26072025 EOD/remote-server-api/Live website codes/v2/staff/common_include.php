<?php
date_default_timezone_set("Asia/Calcutta");
include_once("../common/validate_installation.php");
include_once("../common/validate_session.php");

//if($_SESSION['login_type'] == 1 || $_SESSION['login_type'] == 3 || $_SESSION['login_type'] == 8)
if($_SESSION['login_type'] != 5)
{
	include_once("../common/set_con.php");
	include_once("../common/function.php");
	include_once("../common/advance_functions.php");
	include_once("../common/pagination_settings.php");
	include_once("../common/site_info.php");
	$action_perform_msg = "";
	$urn_using_by_me = getURNCurrentUser($con);
}
else
{
	header("Location:../error");
}
?>