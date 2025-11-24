<?php
include_once("common_include.php");

$where_con_array  = [ 'id' => $_REQUEST['menu_id'] ];

$menu = mysqli_fetch_assoc(getRowsDataCon('menu_list',$where_con_array,$con));

include_once("content_layout.php");
?>