<?php
include_once("common_include.php");

$where_con_array = ['id' => $_REQUEST['menu_item_id'],];

$menu_item = mysqli_fetch_assoc(getRowsDataCon('menu_items',$where_con_array,$con));

include_once("content_layout.php");
?>