<?php
date_default_timezone_set("Asia/Calcutta");
include_once("../common/validate_installation.php");
include_once("../common/validate_session.php");
include_once("../globals/designVars.php");

if($_SESSION['login_type'] == 5)
{
	include_once("../common/set_con.php");
	include_once("../common/function.php");
	include_once("../common/new_functions.php");
	include_once("../common/advance_functions.php");
	include_once("../common/pagination_settings.php");
	include_once("../common/site_info.php");
	$action_perform_msg = "";
	$lrn_using_by_me = getLRNCurrentUser($con);
	$lan_using_by_me = getLANCurrentUser($con);
}
else
{
	include('../error/access_denied.php');
    exit();
}
?>