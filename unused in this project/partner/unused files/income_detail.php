<?php
include_once("common_include.php");

$where_con_array = [ 'lead_id' => $_REQUEST['lead_id'] ];

$income_list = getRowsDataCon('income_history',$where_con_array,$con);

include_once("content_layout.php");
?>