<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['country_id'], ];

$country_data = [
				'name' => $_REQUEST['country_name'],
				'currency' => $_REQUEST['currency_name'],
				];

updateData("country_list",$country_data,$where_con_array,$con);

header("Location:portal_settings.php?tab=country");
?>