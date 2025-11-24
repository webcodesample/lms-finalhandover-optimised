<?php
include_once("common_include.php");

$msg="";

if(checkIsRequested('action_perform'))
{
	if($_REQUEST['agent_type'] == 1)
	{
		$where_con = [
					'mobile' => $_REQUEST['mobile'],
					'whatsapp' => $_REQUEST['whatsapp'],
					'email' => $_REQUEST['email'],
					'company_website' => $_REQUEST['company_website'],
				];
	}
	else
	{
		$where_con = [
					'mobile' => $_REQUEST['mobile'],
					'whatsapp' => $_REQUEST['whatsapp'],
					'email' => $_REQUEST['email'],
				];
	}	

	//check agent data already exist or not
	if(getRowCountMultiCol(setWhereClauseOR($where_con),'agent_list',$con) == 0)
	{
		$agent_data = [
						'type' => $_REQUEST['type'],
						'name' => $_REQUEST['name'],
						'mobile' => $_REQUEST['mobile'],
						'whatsapp' => $_REQUEST['whatsapp'],
						'email' => $_REQUEST['email'],
						'company_name' => $_REQUEST['company_name'],
						'company_address' => $_REQUEST['company_address'],
						'company_website' => $_REQUEST['company_website'],
						];
		
		$current_inserted_agent_id = insertData('agent_list',$agent_data,$con);

		$login_create_data = [
								'ref_id' => 'SA'.$current_inserted_agent_id,
								'username' => $_REQUEST['email'],
								'password' => '123456',
								'login_type' => 4,
								'status' => 1,
							];

		insertData('login_detail', $login_create_data,$con);

		$msg .= "<h5 class='text-success gtext-center'>Thanks for ur interest.<br>We will connect you soon.</h5>";
	}
	else
	{
		$msg .= "<h5 class='text-danger text-center'>Details Already Exist.<br>Please try with other details.</h5>";
	}
}

include_once("../common/head.php");
?>


<div class="row vh-100 m-0">

<div class="col-6 bg-info-subtle">
</div>


<div class="col-6">

<div class="d-flex justify-content-center mt-3" style="height:40px;">
<?=$msg?>
</div>

<?php include_once("partner_registration_form.php"); ?>

</div>
</div>
<?php
include_once("../common/footer_copyright.php");
include_once("../admin/footer_crm.php");
?>
