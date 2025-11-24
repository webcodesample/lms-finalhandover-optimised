<h5>Additional Details</h5>

<h6 class="text-primary mt-3 mb-2 ps-2">Passport Detail</h6>

<form action="update_additional_details.php" method="post" enctype="multipart/form-data">
<input type="hidden" name="lead_id" value="<?=$_REQUEST['lead_id']?>">
<input type="hidden" name="action_perform" value="update_additional_details">

<div class="d-flex">
<div class="mt-2 m-1 ps-2 fs-9" style="width:200px;">Passport Number</div>
<input type="text" name="passport_number" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Passport Number" required value="<?=$student['passport_number']?>">
<input type="hidden" name="passport_number_old" value="<?=$student['passport_number']?>">
</div>

<div class="d-flex">
<div class="mt-2 m-1 ps-2 fs-9" style="width:200px;">Passport Place of Issue</div>
<input type="text" name="passport_place_of_issue" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Place of Issue" required value="<?=$student['passport_place_of_issue']?>">
<input type="hidden" name="passport_place_of_issue_old" value="<?=$student['passport_place_of_issue']?>">
</div>

<div class="d-flex">
<div class="mt-2 m-1 ps-2 fs-9" style="width:200px;">Passport Issued On Date</div>
<input type="date" name="passport_issued_on" class="form-control form-control-sm m-1" style="width:200px;" value="<?=date('Y-m-d',$student['passport_issued_on'])?>" required>
<input type="hidden" name="passport_issued_on_old" value="<?=$student['passport_issued_on']?>">
</div>

<div class="d-flex">
<div class="mt-2 m-1 ps-2 fs-9" style="width:200px;">Passport Valid Till</div>
<input type="date" name="passport_valid_till" class="form-control form-control-sm m-1" style="width:200px;" value="<?=date('Y-m-d',$student['passport_valid_till'])?>" required>
<input type="hidden" name="passport_valid_till_old" value="<?=$student['passport_valid_till']?>">
</div>

<div class="d-flex">
<div class="mt-2 m-1 ps-2 fs-9" style="width:200px;">Passport Holder Name</div>
<input type="text" name="passport_holder_name" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Passport Holder Name" required value="<?=$student['passport_holder_name']?>">
<input type="hidden" name="passport_holder_name_old" value="<?=$student['passport_holder_name']?>">
</div>

<div class="d-flex">
<div class="mt-2 m-1 ps-2 fs-9" style="width:200px;">Passport Holder Surname</div>
<input type="text" name="passport_holder_surname" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Passport Holder Surname" required value="<?=$student['passport_holder_surname']?>">
<input type="hidden" name="passport_holder_surname_old" value="<?=$student['passport_holder_surname']?>">
</div>

<div class="d-flex">
<div class="mt-2 m-1 ps-2 fs-9" style="width:200px;">Passport (Image/PDF)</div>
<input type="file" name="passport" class="form-control form-control-sm m-1" style="width:200px;" accept=".jpg,.jpeg,.pdf">
</div>

<div class="d-flex mt-5" style="width:400px;">
<span class="px-2 fs-9 mt-1">Has the applicant applieid for any type of immigration into any country?</span>
<?php
if($student['immigration_applied'] == 1)
{
	$immigration_applied_no_flag = "";
	$immigration_applied_yes_flag = "checked";
	$immigration_detail_visibility = "";
}
else 
{
	$immigration_applied_no_flag = "checked";
	$immigration_applied_yes_flag = "";
	$immigration_detail_visibility = "disabled";
}
?>
<input type="radio" class="form-check-input form-check-input-sm m-1" name="immigration_applied" value="0" onClick="inputToggleDetailInfo(this.value,'immigration_detail')" <?=$immigration_applied_no_flag?>><span class="text-danger m-1 fs-9">NO</span>
<input type="radio" class="form-check-input form-check-input-sm m-1" name="immigration_applied" value="1" onClick="inputToggleDetailInfo(this.value,'immigration_detail')" <?=$immigration_applied_yes_flag?>><span class="text-success m-1 fs-9">YES</span>
<input type="hidden" name="immigration_applied_old" value="<?=$student['immigration_applied']?>">
</div>

<textarea class="form-control form-control-sm m-1 mt-3" name="immigration_detail" id="immigration_detail" placeholder="Immigration Detail If Any" required style="width:410px;height:100px;" <?=$immigration_detail_visibility?>><?=$student['immigration_detail']?></textarea>
<input type="hidden" name="immigration_detail_old" value="<?=$student['immigration_detail']?>">

<div class="d-flex mt-2" style="width:400px;">
<span class="px-2 fs-9 mt-1">Has the applicant ever had their visa refused for any country?</span>
<?php
if($student['past_visa_refusal_status'] == 1)
{
	$past_visa_refusal_no_flag = "";
	$past_visa_refusal_yes_flag = "checked";
	$past_visa_refusal_visibility = "";
}
else 
{
	$past_visa_refusal_no_flag = "checked";
	$past_visa_refusal_yes_flag = "";
	$past_visa_refusal_visibility = "disabled";
}
?>
<input type="radio" class="form-check-input form-check-input-sm m-1" name="past_visa_refusal_status" value="0" onClick="inputToggleDetailInfo(this.value,'past_visa_refusal_detail')" <?=$past_visa_refusal_no_flag?>><span class="text-danger m-1 fs-9">NO</span>
<input type="radio" class="form-check-input form-check-input-sm m-1" name="past_visa_refusal_status" value="1" onClick="inputToggleDetailInfo(this.value,'past_visa_refusal_detail')" <?=$past_visa_refusal_yes_flag?>><span class="text-success m-1 fs-9">YES</span>
<input type="hidden" name="past_visa_refusal_status_old" value="<?=$student['past_visa_refusal_status']?>">
</div>

<textarea class="form-control form-control-sm m-1 mt-3" name="past_visa_refusal_detail" id="past_visa_refusal_detail" placeholder="Visa Refusal Detail If Any" required style="width:410px;height:100px;" <?=$past_visa_refusal_visibility?>><?=$student['past_visa_refusal_detail']?></textarea>
<input type="hidden" name="past_visa_refusal_detail_old" value="<?=$student['past_visa_refusal_detail']?>">

<div class="d-flex mt-2" style="width:400px;">
<span class="px-2 fs-9 mt-1">Does the applicant suffer from a serious medical condition?</span>
<?php
if($student['serious_medical_status'] == 1)
{
	$serious_medical_status_no_flag = "";
	$serious_medical_status_yes_flag = "checked";
	$medical_condition_detail_visibility = "";
}
else 
{
	$serious_medical_status_no_flag = "checked";
	$serious_medical_status_yes_flag = "";
	$medical_condition_detail_visibility = "disabled";
}
?>
<input type="radio" class="form-check-input form-check-input-sm m-1" name="serious_medical_status" value="0" onClick="inputToggleDetailInfo(this.value,'medical_condition_detail')" <?=$serious_medical_status_no_flag?>><span class="text-danger m-1 fs-9">NO</span>
<input type="radio" class="form-check-input form-check-input-sm m-1" name="serious_medical_status" value="1" onClick="inputToggleDetailInfo(this.value,'medical_condition_detail')" <?=$serious_medical_status_yes_flag?>><span class="text-success m-1 fs-9">YES</span>
<input type="hidden" name="serious_medical_status_old" value="<?=$student['serious_medical_status']?>">
</div>

<textarea class="form-control form-control-sm m-1 mt-3" name="medical_condition_detail" id="medical_condition_detail" placeholder="Serious Medical Condition Detail If Any" required style="width:410px;height:100px;" <?=$medical_condition_detail_visibility?>><?=$student['medical_condition_detail']?></textarea>
<input type="hidden" name="medical_condition_detail_old" value="<?=$student['medical_condition_detail']?>">

<div class="d-flex mt-2" style="width:400px;">
<span class="px-2 fs-9 mt-1">Has the applicant ever been convicted of a criminal offence?</span>
<?php
if($student['criminal_offence_status'] == 1)
{
	$criminal_offence_no_flag = "";
	$criminal_offence_yes_flag = "checked";
	$criminal_offence_visibility = "";
}
else 
{
	$criminal_offence_no_flag = "checked";
	$criminal_offence_yes_flag = "";
	$criminal_offence_visibility = "disabled";
}
?>
<input type="radio" class="form-check-input form-check-input-sm m-1" name="criminal_offence_status" value="0" onClick="inputToggleDetailInfo(this.value,'criminal_offence_detail')" <?=$criminal_offence_no_flag?>><span class="text-danger m-1 fs-9">NO</span>
<input type="radio" class="form-check-input form-check-input-sm m-1" name="criminal_offence_status" value="1" onClick="inputToggleDetailInfo(this.value,'criminal_offence_detail')" <?=$criminal_offence_yes_flag?>><span class="text-success m-1 fs-9">YES</span>
<input type="hidden" name="criminal_offence_status_old" value="<?=$student['criminal_offence_status']?>">
</div>

<textarea class="form-control form-control-sm m-1 mt-3" name="criminal_offence_detail" id="criminal_offence_detail" placeholder="Criminal Offence Detail If Any" required style="width:410px;height:100px;" <?=$criminal_offence_visibility?>><?=$student['criminal_offence_detail']?></textarea>
<input type="hidden" name="criminal_offence_detail_old" value="<?=$student['criminal_offence_detail']?>">


<textarea class="form-control form-control-sm m-1 mt-3" name="updation_remark" placeholder="Additional Details Updation Remark" required style="width:410px;height:100px;"></textarea>

<div class="text-center mt-3" style="width:400px;">
<button type="submit" class="btn btn-sm btn-primary m-1 <?=$urn_visibility_class?>" <?=$field_visibility?>>Update Additional Details</button>
</div>
</form>

<script>
function inputToggleDetailInfo(conVal,inputFieldID)
{
	if(conVal == 1)
	$("#"+inputFieldID).attr("disabled",false);
	else
	$("#"+inputFieldID).attr("disabled",true);
}
</script>