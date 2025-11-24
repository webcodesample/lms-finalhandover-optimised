<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['country_id'], ];

deleteData("country_list",$where_con_array,$con);

header("Location:portal_settings.php?tab=country");
?>