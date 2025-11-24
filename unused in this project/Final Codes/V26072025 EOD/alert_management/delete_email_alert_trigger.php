<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['trigger_id'], ];

deleteData('email_alerts_setup',$where_con_array,$con);

header("Location:email_alerts_settings.php");

?>