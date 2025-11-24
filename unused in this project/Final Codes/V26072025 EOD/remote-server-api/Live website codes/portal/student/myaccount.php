<?php
include_once("common_include.php");

$btn_class_profile = "btn-outline";
$btn_class_settings = "btn-outline";

if(isset($_REQUEST['tab']) && $_REQUEST['tab'] == 'settings')
{
	$btn_class_settings = 'btn';
	$requested_tab = $_REQUEST['tab'];
}
else
{
	$btn_class_profile = "btn";
	$requested_tab = "profile";
}

include_once("head.php");
include_once("body_layout.php");
?>