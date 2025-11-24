<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['ap_id'], ];
$application_point = mysqli_fetch_assoc(getRowsDataCon('application_point_list',$where_con_array,$con));

include_once("content_layout.php");
?>