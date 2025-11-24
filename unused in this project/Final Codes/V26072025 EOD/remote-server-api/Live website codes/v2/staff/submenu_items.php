<?php
include_once("common_include.php");

if(isset($_REQUEST['parent_menu']))
{
	$goBackOption = 1;
	$where_con_array = ['parent_menu_item_id' => $_REQUEST['parent_menu'], ];
	$submenu_item_list = getRowsDataCon('submenu_items',$where_con_array,$con);
}
else
{
	$goBackOption = 0;
	$submenu_item_list = getRowsdata('submenu_items',$con);
}

include_once("content_layout.php");
?>