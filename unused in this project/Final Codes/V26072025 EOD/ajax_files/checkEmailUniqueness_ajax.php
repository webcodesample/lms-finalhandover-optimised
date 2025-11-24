<?php
include_once("../livesearch/con_ajax.php");

$where_con_suffix = "";

if($_REQUEST['ref_id'] != '')
	$where_con_suffix .= " AND ref_id != '".$_REQUEST['ref_id']."'";

$query = "SELECT * FROM login_detail WHERE username = '".$_REQUEST['email']."'".$where_con_suffix;
$result = mysqli_query($con,$query);
echo mysqli_num_rows($result);
?>