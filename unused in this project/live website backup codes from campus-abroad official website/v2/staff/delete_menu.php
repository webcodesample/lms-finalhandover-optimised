<?php
include_once("common_include.php");

$where_con_array = ['id' => $_REQUEST['menu_id'],];

deleteData('menu_list',$where_con_array,$con);

header("Location:menu_list.php");
?>