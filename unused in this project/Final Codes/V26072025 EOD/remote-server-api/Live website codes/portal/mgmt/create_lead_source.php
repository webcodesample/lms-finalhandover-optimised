<?php
include_once("common_include.php");
$insert_flag = 0;

$total_new_sources = count($_REQUEST['description']);

for($i=0; $i<$total_new_sources; $i++)
{
	if(getRowCount('description',$_REQUEST['description'][$i],'lead_sources_list',$con) == 0)
	{
		$source_info = [
					'description' => $_REQUEST['description'][$i],
					'datentime' => strtotime('now'),
					];
		insertData('lead_sources_list',$source_info,$con);
		$insert_flag = 1;
	}	
}

header("Location:portal_settings.php?tab=lead_sources");
?>