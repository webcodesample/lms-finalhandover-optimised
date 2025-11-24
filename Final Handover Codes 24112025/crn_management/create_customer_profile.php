<?php
include_once("common_include.php");

//print_r($_REQUEST); print_r($_FILES); print_r($_REQUEST['customer']); die();

if(($_REQUEST['customer']['document_title'] !== '') && ($_FILES['document']['name'] !== ''))
echo $document_upload_flag = 1;
else
echo $document_upload_flag = 0;

if(getRowCount('username',$_REQUEST['customer']['email'],'login_detail',$con) > 0)
{
	echo "<center><h3 style='color:red;'>Sorry! Email <span class='text-primary'>".$_REQUEST['customer']['email']." Already Exist</h3></center><script>setTimeout(function(){window.history.back();},1000);</script>";
	die();
}

//step 1 :create customer profile
$customer_data = $_REQUEST['customer'];
unset($customer_data['document_title']);

if(isset($_REQUEST['lead_source_id']))
$customer_data['lead_source_id'] = $_REQUEST['lead_source_id'];
else
$customer_data['lead_source_id'] = 5;

if(getRowCountWC('customers_list',$con) == 0)
$customer_data['id'] = 1001;

$cust_id = insertData('customers_list',$customer_data,$con);

//step 1 A :create customer login details & insert data in login_detail table
$customer_login_detail_data = [
								'ref_id' => 'CR'.$cust_id,
								'username' => $customer_data['email'],
								'password' => '123456',
								'login_type' => 5,
								'status' => 1,
								];
insertData('login_detail', $customer_login_detail_data,$con);

//Step 2 : update status of requested temp lead from temp_leads
if(isset($_REQUEST['temp_lead_id']))
{
	$where_con_array = [ 'id' => $_REQUEST['temp_lead_id'], ];

	$temp_lead_updation_data = [
								'status' => 1,
								'remark' => 'CRN Created',
								'hidden' => 1,
								];
	updateData('temp_leads',$temp_lead_updation_data,$where_con_array,$con);
}

//Step 3 : Upload crn document
if($document_upload_flag)
uploadFile($_FILES['document'],$_REQUEST['customer']['document_title'],'../crn_documents/'.$cust_id.'/');

header("Location: manage_crn.php?crn=".$cust_id);

?>