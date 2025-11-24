<?php
include_once("common_include.php");

insertData('menu_items',$_REQUEST,$con);

header("Location:menu_items.php");
?>