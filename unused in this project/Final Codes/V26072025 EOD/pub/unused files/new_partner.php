<?php
include_once("common_include.php");

$msg="";

if(isset($_REQUEST['msg']))
{
	if($_REQUEST['msg'] == 'success')
	{
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

<div class="col-6 bg-secondary">
</div>


<div class="col-6">

<div class="d-flex justify-content-center mt-3" style="height:40px;">
<?=$msg?>
</div>

<div class="d-flex justify-content-center mt-3">
<form action="register_agent.php" method="post">
<div class="card" style="width:300px;">
<div class="card-body">
<h5 class="ps-1">Agent Type</h5>
<div class="d-flex">
<input type="radio" class="form-check-input m-1" name="agent_type" value="0" onClick="setAgentType(this.value)">Individual
<input type="radio" class="form-check-input m-1" name="agent_type" value="1" onClick="setAgentType(this.value)" checked>Company
</div>
</div>
</div>

<div class="card mt-3" id="company_detail" style="width:300px;">
<div class="card-body">
<h5 class="ps-1">Personal Detail</h5>
<input type="text" name="name" class="form-control m-1" placeholder="Full Name" required style="width:250px;">
<input type="text" name="mobile" class="form-control m-1" placeholder="Mobile Number" required style="width:250px;">
<input type="text" name="whatsapp" class="form-control m-1" placeholder="WhatsApp Number" required style="width:250px;">
<input type="email" name="email" class="form-control m-1" placeholder="Email" required style="width:250px;">
</div>
</div>

<div class="card mt-3" id="company_detail" style="width:300px;">
<div class="card-body">
<h5 class="ps-1">Company Detail</h5>
<input type="text" name="company_name" id="company_name" class="form-control m-1" placeholder="Company Name" required style="width:250px;">
<input type="text" name="company_address" id="company_address" class="form-control m-1" placeholder="Company Address" required style="width:250px;">
<input type="text" name="company_website" id="company_website" class="form-control m-1" placeholder="Company Website" required style="width:250px;">
</div>
</div>

<div class="d-flex justify-content-center" style="width:300px;">
<input type="submit" name="action_perform" value="Partner With US" class="btn btn-lg btn-subtle-primary m-3">
</div>

</form>
</div>

</div>
</div>
<?php
include_once("../common/footer_copyright.php");
include_once("../admin/footer_crm.php");
?>
