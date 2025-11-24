<?php
include_once("common_include.php");

$menu_item_data = [
					'description' => $_REQUEST['description'],
					'href_link' => $_REQUEST['href_link'],
					'parent_menu_item_id' => $_REQUEST['parent_menu_item_id'],
					];
insertData('submenu_items',$menu_item_data,$con);

header("Location:submenu_items.php");
?>