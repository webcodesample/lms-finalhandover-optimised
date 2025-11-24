<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['lead_source_id'], ];

$lead_source_data = [
					'description' => $_REQUEST['description'],
					];

updateData("lead_sources_list",$lead_source_data,$where_con_array,$con);

header("Location:portal_settings.php?tab=lead_sources");
?>