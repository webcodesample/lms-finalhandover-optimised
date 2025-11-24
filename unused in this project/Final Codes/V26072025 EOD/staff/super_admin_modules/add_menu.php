<?php
include_once("common_include.php");

$menu_data = [ 'description' => $_REQUEST['description'],];

insertData('menu_list',$menu_data,$con);

header("Location:menu_list.php");
?>