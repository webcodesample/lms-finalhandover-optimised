<?php
include_once("common_include.php");

$application_point_list = getRowsData('application_point_list', $con,'name','ASC');

include_once("content_layout.php");
?>