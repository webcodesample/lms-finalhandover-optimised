<?php
include_once("set_fileurl.php");

$str = fgets(fopen(set_fileurl(),"r"));

$str_arr = explode(",",$str);

$host = $str_arr[0];
$user = $str_arr[1];
$pass = $str_arr[2];
$dbname = $str_arr[3];

$con = mysqli_connect($host, $user, $pass, $dbname);
?>