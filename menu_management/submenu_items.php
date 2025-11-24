<?php
include_once("common_include.php");

$where_con_array = [];

if(isset($_REQUEST['parent_menu']) && $_REQUEST['parent_menu'] != '')
{
	$goBackOption = 1;
	$where_con_array = array_merge($where_con_array,array('parent_menu_id' => $_REQUEST['parent_menu']));
}
else
{
	$goBackOption = 0;
}

$submenu_item_list = getRowsDataCon('submenu_items',$where_con_array,$con);

include_once("content_layout.php");
?>