<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['id'], ];

$temp_lead = mysqli_fetch_assoc(getRowsDataCon('temp_leads',$where_con_array,$con));

include_once("content_layout.php");
?>