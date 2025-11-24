<?php
include_once("common_include.php");

$menu_item_data = [
					'description' => $_REQUEST['description'],
					'submenu_id_name' => $_REQUEST['submenu_id_name'],
					'icon_name' => $_REQUEST['icon_name'],
					'parent_menu_id' => $_REQUEST['parent_menu_id'],
					];
insertData('menu_items',$menu_item_data,$con);

header("Location:menu_items.php");
?>