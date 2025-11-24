<?php
include_once("common_include.php");

$where_con_array = [
					'creator_type' => $_SESSION['login_type'],
					'creator_id' => $_SESSION['userid']
					];

$temp_leads_list = getRowsDataCon('temp_leads',$where_con_array,$con);

include_once("content_layout.php");
?>