<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['trigger_id'], ];
$email_alert = mysqli_fetch_assoc(getRowsDataCon('email_alerts_setup',$where_con_array,$con));

include_once("content_layout.php");
?>