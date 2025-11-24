<?php
include_once("common_include.php");

insertData('application_point_list',$_REQUEST,$con);

header("Location:application_point_list.php");
?>