<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['callback_id'],];

$callback_data = [
					'status' => 1,
					'call_remark' => $_REQUEST['call_remark'],
					'updated_by' => $_SESSION['user_ref_id'],
					'updation_datentime' => strtotime('now'),
				];
updateData('callback_list',$callback_data,$where_con_array,$con);

header("Location:callback_list.php?tab=today");
?>