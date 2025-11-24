<?php
include_once("common_include.php");

$where_con_array = ['id' => $_REQUEST['menu_id'],];

$menu_data = [
					'description' => $_REQUEST['description'],
					];
updateData('menu_list',$menu_data,$where_con_array,$con);

header("Location:menu_list.php");
?>