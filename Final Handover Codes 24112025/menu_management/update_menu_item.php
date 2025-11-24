<?php
include_once("common_include.php");

$where_con_array = ['id' => $_REQUEST['menu_item_id'],];

$menu_item_data = [
					'description' => $_REQUEST['description'],
					'submenu_id_name' => $_REQUEST['submenu_id_name'],
					'icon_name' => $_REQUEST['icon_name'],
					];
updateData('menu_items',$menu_item_data,$where_con_array,$con);

header("Location:menu_items.php");
?>