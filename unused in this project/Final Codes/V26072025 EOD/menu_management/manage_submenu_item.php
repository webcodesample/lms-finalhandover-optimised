<?php
include_once("common_include.php");

$where_con_array = ['id' => $_REQUEST['submenu_item_id'],];

$submenu_item = mysqli_fetch_assoc(getRowsDataCon('submenu_items',$where_con_array,$con));

include_once("content_layout.php");
?>