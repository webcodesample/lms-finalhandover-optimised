<?php
include_once("common_include.php");
//session_start();

$where_con_array = ['user_ref_id' => $_SESSION['user_ref_id'],];
deleteData('logged_user_list',$where_con_array,$con);

session_unset();
session_destroy();

header("Location:../backend");
?>