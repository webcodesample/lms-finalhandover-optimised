<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['id'] ];

deleteData('temp_leads',$where_con_array,$con);

header("Location:temp_leads.php");
?>