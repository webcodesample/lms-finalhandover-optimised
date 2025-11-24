<?php
include_once("common_include.php");

$active_link_prfile = "";
$active_link_settings = "";

if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'settings')
{
	$active_link_settings = "active";
	$requested_tab = $_REQUEST['tab'];
}
else
{
	$active_link_prfile = "active";
	$requested_tab = "profile";
}

include_once("content_layout.php");
?>