<?php
include_once("common_include.php");

//print_r($_FILES); die();
$extension = pathinfo($_FILES['siteLogo']['name'], PATHINFO_EXTENSION);

$where_con_array = ['id' => 1];
$site_data = ['site_logo' => 'lms-logo.'.$extension];
updateData('site_settings',$site_data,$where_con_array,$con);

uploadFile($_FILES['siteLogo'],'lms-logo','../images/');
header("Location: site_settings.php");
?>