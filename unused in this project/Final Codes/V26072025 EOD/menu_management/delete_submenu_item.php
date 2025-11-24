<?php
include_once("common_include.php");

$where_con_array = ['id' => $_REQUEST['submenu_item_id'],];

deleteData('submenu_items',$where_con_array,$con);

header("Location:submenu_items.php");
?>