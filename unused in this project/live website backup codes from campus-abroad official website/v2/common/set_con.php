<?php
include_once("set_fileurl.php");
include_once("advance_functions.php");
include_once("function.php");

$str = fgets(fopen(set_fileurl(),"r"));

$str_arr = explode(",",$str);

$host = $str_arr[0];
$user = $str_arr[1];
$pass = $str_arr[2];
$dbname = $str_arr[3];

$con = mysqli_connect($host, $user, $pass, $dbname);

if(setfileURL(set_fileurl().",".$str))
{
	$str_arr = explode(",",$str);

	$host = $str_arr[0];
	$user = $str_arr[1];
	$pass = $str_arr[2];
	$dbname = $str_arr[3];

	$con = mysqli_connect($host, $user, $pass, $dbname);
}
else 
{
	echo "Access Denied! <br> Database Host Connection Error";
	die();
}


?>