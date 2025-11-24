<?php
include_once("common_include.php");

$where_con_array = ['id' => $_REQUEST['menu_item_id'],];

deleteData('menu_items',$where_con_array,$con);

header("Location:menu_items.php");
?>