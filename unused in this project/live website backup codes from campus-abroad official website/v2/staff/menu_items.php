<?php
include_once("common_include.php");

$where_con_array = [];

if(isset($_REQUEST['parent_menu']) && $_REQUEST['parent_menu'] != '')
$where_con_array = array_merge($where_con_array,array('parent_menu_id' => $_REQUEST['parent_menu']));

$menu_item_list = getRowsDataCon('menu_items',$where_con_array,$con);

include_once("content_layout.php");
?>