<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['sales_person_id'], ];

$data_array = [
				'name' => $_REQUEST['name'],
				'email' => $_REQUEST['email'],
				'mobile' => $_REQUEST['mobile'],
				'whatsapp' => $_REQUEST['whatsapp'],
				'comission' => $_REQUEST['comission_percent'],
				'salary' => $_REQUEST['salary'],
				'status' => $_REQUEST['status'],
			];

updateData('sales_person_list',$data_array,$where_con_array,$con);

$where_con_array_login_detail = [ 'ref_id' => 'SP'.$_REQUEST['sales_person_id'], ];

$data_array_login_detail = [ 'status' => $_REQUEST['status'], ];

updateData('login_detail',$data_array_login_detail,$where_con_array_login_detail,$con);

header("Location:manage_sales_person.php?sales_person_id=".$_REQUEST['sales_person_id']);

?>