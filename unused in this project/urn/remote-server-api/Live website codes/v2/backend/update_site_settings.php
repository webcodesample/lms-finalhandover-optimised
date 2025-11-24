<?php
include_once("common_include.php");

$where_con_array = [ 'id' => 1];

$site_data = [
				'site_title' => $_REQUEST['site_title'],
				'wsp_name' => $_REQUEST['wsp_name'],
				'wsp_url' => $_REQUEST['wsp_url'],
				'crm_version' => $_REQUEST['crm_version'],
			];

updateData('site_settings',$site_data,$where_con_array,$con);

header("Location:site_settings.php");
?>