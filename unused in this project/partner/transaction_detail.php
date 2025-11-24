<?php
include_once("common_include.php");

$where_con_array = [ 'transaction_id' => $_REQUEST['transaction_id'] ];

$transaction_list = getRowsDataCon('withdrawl_request_list',$where_con_array,$con);

include_once("content_layout.php");
?>