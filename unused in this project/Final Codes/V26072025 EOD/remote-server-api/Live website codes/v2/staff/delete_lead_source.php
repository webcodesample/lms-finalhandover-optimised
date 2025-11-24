<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['lead_source_id'], ];

deleteData("lead_sources_list",$where_con_array,$con);

header("Location:portal_settings.php?tab=lead_sources");
?>