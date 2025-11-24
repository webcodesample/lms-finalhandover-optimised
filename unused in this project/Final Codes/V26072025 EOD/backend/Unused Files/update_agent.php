<?php
print_r($_REQUEST);
?>

<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['agent_id'], ];

$data_array = [
				'type' => $_REQUEST['type'],
				'name' => $_REQUEST['name'],
				'email' => $_REQUEST['email'],
				'mobile' => $_REQUEST['mobile'],
				'whatsapp' => $_REQUEST['whatsapp'],
				'company_name' => $_REQUEST['company_name'],
				'company_address' => $_REQUEST['company_address'],
				'company_website' => $_REQUEST['company_website'],
				'comission' => $_REQUEST['comission_percent'],
				'status' => $_REQUEST['status'],
			];

updateData('agent_list',$data_array,$where_con_array,$con);

$where_con_array_login_detail = [ 'ref_id' => 'SA'.$_REQUEST['agent_id'], ];

$data_array_login_detail = [ 'status' => $_REQUEST['status'], ];

updateData('login_detail',$data_array_login_detail,$where_con_array_login_detail,$con);

header("Location:manage_agent.php?agent_id=".$_REQUEST['agent_id']);

?>