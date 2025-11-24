<?php
include_once("common_include.php");

$where_con_array = [ 'crn' => $_SESSION['userid']];

$lrn_list = getRowsDataCon('lrn_list',$where_con_array,$con);

include_once("content_layout.php");
?>