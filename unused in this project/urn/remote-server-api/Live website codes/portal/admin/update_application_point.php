<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['ap_id'], ];

$application_point_data = [
							'name' => $_REQUEST['name'],
							'type' => $_REQUEST['type'],
							'address' => $_REQUEST['address'],
							'contact_person_name' => $_REQUEST['contact_person_name'],
							'mobile' => $_REQUEST['mobile'],
							'email' => $_REQUEST['email'],
							'comission_percentage' => $_REQUEST['comission_percentage'],
							];

updateData('application_point_list',$application_point_data,$where_con_array,$con);

header("Location:application_point_list.php");

?>