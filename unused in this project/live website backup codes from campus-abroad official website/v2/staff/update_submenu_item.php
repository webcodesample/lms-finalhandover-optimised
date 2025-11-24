<?php
include_once("common_include.php");

$where_con_array = ['id' => $_REQUEST['submenu_item_id'],];

$menu_item_data = [
					'description' => $_REQUEST['description'],
					'href_link' => $_REQUEST['href_link'],
					'parent_menu_item_id' => $_REQUEST['parent_menu_item_id'],
					];
updateData('submenu_items',$menu_item_data,$where_con_array,$con);

header("Location:submenu_items.php");
?>