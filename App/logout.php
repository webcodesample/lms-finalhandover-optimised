<?php
include_once("../pub/common_include.php");
session_start();

//delete entry in logged user list
$logged_user_data = [ 'user_ref_id' => $_SESSION['user_ref_id']];
deleteData('logged_user_list',$logged_user_data,$con);

session_unset();
session_destroy();

header("Location: ../App");
?>