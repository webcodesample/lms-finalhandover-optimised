<?php
include_once("common_include.php");

$data_array = [
				'description' => $_REQUEST['action_description'],
			];

insertData('action_perform_list',$data_array,$con);

header("Location:portal_settings.php?tab=predefined_actions");
?>