<?php
include_once("common_include.php");

$email_duplicay_flag = 0;

$where_con_array = [ 'id' => $_REQUEST['temp_lead_id']];
$temp_lead = mysqli_fetch_assoc(getRowsDataCon('temp_leads',$where_con_array,$con));

if(getRowCount('username',$temp_lead['email'],'login_detail',$con) > 0)
$email_duplicay_flag = 1;

include_once("content_layout.php");
?>