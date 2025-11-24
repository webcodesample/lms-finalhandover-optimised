<?php
include_once("common_include.php");

$tabs_array = ['summary','documents','audit_history','ledger','repayment_schedule'];

if(isset($_REQUEST['tab']))
$requested_tab = $_REQUEST['tab'];
else
$requested_tab = 'summary';

if($lan_using_by_me)
$editMode = "";
else
$editMode = "disabled";

/*//get lrn call back already exist for future or not
$callback_search_query = "SELECT * FROM callback_list WHERE lrn = ".$_REQUEST['lrn']." AND callback_datentime > ".strtotime('now');
$callback_search_result = mysqli_query($con,$callback_search_query);
if(mysqli_num_rows($callback_search_result) > 0)
    $callback_exist_flag = 1;
else*/
    $callback_exist_flag = 0;

include_once("content_layout.php");
?>
