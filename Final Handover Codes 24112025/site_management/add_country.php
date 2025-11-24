<?php
include_once("common_include.php");

$country_data = [
				'name' => $_REQUEST['country_name'],
				'currency' => $_REQUEST['currency_name'],
				];

insertData("country_list",$country_data,$con);

header("Location:portal_settings.php?tab=country");
?>