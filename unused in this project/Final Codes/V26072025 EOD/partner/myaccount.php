<?php
include_once("common_include.php");

$active_link_prfile = "";
$active_link_bank = "";
$active_link_settings = "";

if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'settings')
{
	$active_link_settings = "active";
	$requested_tab = $_REQUEST['tab'];
}
else if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'bank')
{
	$active_link_bank = "active";
	$requested_tab = $_REQUEST['tab'];
}
else
{
	$active_link_prfile = "active";
	$requested_tab = "profile";
}

$where_con_array = [
					'id' => $_SESSION['userid'],
					];
$user = mysqli_fetch_assoc(getRowsDataCon($_SESSION['user_table'],$where_con_array,$con));

include_once("content_layout.php");
?>