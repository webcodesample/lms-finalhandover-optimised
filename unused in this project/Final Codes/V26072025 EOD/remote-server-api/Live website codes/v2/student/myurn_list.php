<?php
include_once("common_include.php");

$where_con_array = [ 'student_id' => $_SESSION['userid']];

$urn_list = getRowsDataCon('leads_details',$where_con_array,$con);

include_once("content_layout.php");
?>