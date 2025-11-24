<div class="d-flex justify-content-end">
<button class="btn btn-sm btn-subtle-danger me-2" onClick="printData()">
<span data-feather="printer" style="height: 20px; width: 20px;"></span>
</button>
<?php setGoBack("leads.php"); ?>
</div>

<div id="myPrintableDiv" class="mt-5">
<center>
<span class="text-danger fw-bold">URN Application Form</span>
<table class="table table-sm table-borderless fs-9 w-auto mt-3">
  
<tr>
<td class="pe-2 align-middle">URN</td>
<td>
<input type="text" class="form-control form-control-sm fw-bold text-danger" value="CA<?=$urn?>" readonly>
</td>
<td class="pe-2 ps-5 align-middle">Date</td>
<td>
<input type="text" class="form-control form-control-sm fw-bold text-danger" value="<?=date('d-M-Y',$lead_created_on_datentime)?>" readonly>
</td>
</tr>

<tr>
<th colspan="4" class="align-middle fs-8" height="40px">Personal Detail</th>
</tr>

<tr>
<td class="pe-2 align-middle">Name</td>
<td>
<input type="text" class="form-control form-control-sm" name="student_name" value="<?=$urn_info['student_name']?>" readonly>
</td>
<td>&nbsp;</td>
<td rowspan="5" class="align-middle">
	<div class="card">
		<div class="card-body fw-bolder" style="height:200px;">
			<?php
			if(getRowCount('lead_id',$_REQUEST['lead_id'],'urn_document_upload_history',$con) > 0)
			{
				$query = "SELECT file_name FROM urn_document_upload_history WHERE file_name LIKE '%student_photo%' AND lead_id = ".$_REQUEST['lead_id']." ORDER BY datentime DESC";
				$result = mysqli_query($con, $query);
				$uploded_file = mysqli_fetch_assoc($result);
			?>
				<img src="../urn/ca<?=$urn?>/<?=$uploded_file['file_name']?>" style="height:150px; width:150px;">
			<?php
			}
			else
			{
				echo "<img src='../profile_pics/default.png' style='height:150px; width:150px;'>";
			}
			?>
		</div>
	</card>
</td>
</tr>

<tr>
<td class="pe-2 align-middle">Date of Birth</td>
<td>
<input type="text" class="form-control form-control-sm" name="student_dob" value="<?=date('d-m-Y',$urn_info['student_dob'])?>" readonly>
</td>
</tr>

<tr>
<td class="pe-2 align-middle">Email</td>
<td>
<input type="email" class="form-control form-control-sm" name="student_email" value="<?=$urn_info['student_email']?>" readonly>
</td>
</tr>

<tr>
<td class="pe-2 align-middle">Mobile</td>
<td>
<input type="text" class="form-control form-control-sm" name="student_mobile" value="<?=$urn_info['student_mobile']?>" readonly>
</td>
</tr>

<tr>
<td class="pe-2 align-middle">Mobile (Alt)</td>
<td>
<input type="text" class="form-control form-control-sm" name="student_mobile_alt" value="<?=$urn_info['student_mobile_alt']?>" readonly>
</td>
</tr>

<tr>
<td class="pe-2">Address</td>
<td colspan="3">
<textarea class="form-control form-control-sm" style="height:100px;" readonly><?=$urn_info['student_address']?></textarea>
</td>
</tr>

<tr>
<th colspan="4" class="align-middle fs-8" height="40px">Passport Detail</th>
</tr>

<tr>
<td class="pe-2 align-middle">Number</td>
<td class="d-flex">
<input type="text" class="form-control form-control-sm" value="<?=$urn_info['passport_number']?>" readonly>
</td>  
<td class="pe-2 ps-5 align-middle">Place of Issue</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$urn_info['passport_place_of_issue']?>" readonly>
</td>  
</tr>

<tr>
<td class="pe-2 align-middle">Date of Issue</td>
<td class="d-flex">
<input type="text" class="form-control form-control-sm" value="<?=date('d-m-Y',$urn_info['passport_issued_on'])?>" readonly>
</td>  
<td class="pe-2 ps-5 align-middle">Valid Till</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=date('d-m-Y',$urn_info['passport_valid_till'])?>" readonly>
</td>  
</tr>

<tr>
<td class="pe-2 align-middle">Holder Name</td>
<td class="d-flex">
<input type="text" class="form-control form-control-sm" value="<?=$urn_info['passport_holder_name']?>" readonly>
</td>  
<td class="pe-2 ps-5 align-middle">Holder Surname</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$urn_info['passport_holder_surname']?>" readonly>
</td>  
</tr>

<tr>
<th colspan="4" class="align-middle fs-8" height="40px">Academic Detail</th>
</tr>

<tr>
<th colspan="4" class="align-middle fs-9" height="30px">Highest Education Detail</th>
</tr>

<tr>
<td class="pe-2 align-middle">Name</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$urn_info['highest_education_name']?>" readonly>
</td>  
<td class="pe-2 ps-5 align-middle">Session</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$urn_info['highest_education_from_year'].'-'.$urn_info['highest_education_to_year']?>" readonly>
</td>
</tr>

<tr>
<td class="pe-2 align-middle">University/Board</td>
<td colspan="3">
<input type="text" class="form-control form-control-sm" value="<?=$urn_info['highest_education_institution']?>" readonly>
</td>  
</tr>

<tr>
<td class="pe-2 align-middle">City</td>
<td class="d-flex">
<input type="text" class="form-control form-control-sm" value="<?=$urn_info['highest_education_institution_city']?>" readonly>
</td>  
<td class="pe-2 ps-5 align-middle">Country</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$urn_info['highest_education_institution_country']?>" readonly>
</td>  
</tr>

<tr>
<th colspan="4" class="align-middle fs-9" height="30px">Additional Test Detail</th>
</tr>

<tr>
<td colspan="4" class="pe-2 align-top" style="height:200px;">
<ul class="d-flex flex-wrap" style="width:650px; list-style-type: none;">
<?php
if($urn_info['test_name'] != '' && $urn_info['other_test_name'] != '')
$all_test_names = explode(',',$urn_info['test_name'].','.$urn_info['other_test_name']);
else if($urn_info['test_name'] == '' && $urn_info['other_test_name'] != '')
$all_test_names = explode(',',$urn_info['other_test_name']);
else if($urn_info['test_name'] != '' && $urn_info['other_test_name'] == '')
$all_test_names = explode(',',$urn_info['test_name']);
else
$all_test_names = [];

if(count($all_test_names)>0)
{
	foreach($all_test_names as $test_name)
	{
		echo "<li class='m-1'><span class='text-success m-1' data-feather='check-square' style='height: 15px; width: 15px;'></span>".$test_name."</li>";
	}
}
else
{
	echo "<span class='text-danger fw-bold'>Test taken detail not added By applicant</span>";
}

?>
</ul>
</td>  
</tr>

<tr>
<th colspan="4" class="align-middle fs-8" height="40px">Selected Course Detail</th>
</tr>

<tr>
<td class="pe-2 align-middle">Name</td>
<td class="d-flex">
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('name','id',$urn_info['course_id'],'course_list',$con)?>" readonly>
</td>  
<td class="pe-2 ps-5 align-middle">Type</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('type','id',$urn_info['course_id'],'course_list',$con)?>" readonly>
</td>  
</tr>

<tr>
<td class="pe-2 align-middle">Intake</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('intake','id',$urn_info['course_id'],'course_list',$con)?>" readonly>
</td>
<td class="pe-2 ps-5 align-middle">Duration</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('duration','id',$urn_info['course_id'],'course_list',$con)?>" readonly>
</td>
</tr>

<tr>
<td class="pe-2 align-middle">University</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$university?>" readonly>
</td>

<td class="pe-2 ps-5 align-middle">Country</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=strtoupper(getFieldValue('name','id',$country_id,'country_list',$con))?>" readonly>
</td>
</tr>

<tr>
<td class="pe-2 align-middle">Fee</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('fee','id',$urn_info['course_id'],'course_list',$con)?>" readonly>
</td>
<td class="pe-2 ps-5 align-middle">Currency</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=strtoupper(getFieldValue('currency','id',$country_id,'country_list',$con))?>" readonly>
</td>
</tr>

<tr>
<td class="pe-2">Eligibility</td>
<td colspan="3">
<textarea class="form-control form-control-sm" style="height:100px;" readonly><?=getFieldValue('eligibility','id',$urn_info['course_id'],'course_list',$con)?></textarea>
</td>
</tr>
  
<tr>
<td class="pe-2">Brief Note</td>
<td colspan="3">
<textarea class="form-control form-control-sm" style="height:100px;" readonly><?=$urn_info['student_brief_note']?></textarea>
</td>
</tr>

<tr>
<th colspan="4" class="align-middle fs-8" height="40px">Additional Detail</th>
</tr>

<tr>
<td colspan="4" class="ps-2">
<?php
if($urn_info['immigration_applied'])
{
	$immigration_applied_no = "<span class='text-danger m-1' data-feather='x-square' style='height: 15px; width: 15px;'></span>";
	$immigration_applied_yes = "<span class='text-success m-1' data-feather='check-square' style='height: 15px; width: 15px;'></span>";
	$immigration_ditail_display = "";
}
else 
{
	$immigration_applied_yes = "<span class='text-danger m-1' data-feather='x-square' style='height: 15px; width: 15px;'></span>";
	$immigration_applied_no = "<span class='text-success m-1' data-feather='check-square' style='height: 15px; width: 15px;'></span>";
	$immigration_ditail_display = "d-none";
}

?>
Has the applicant applied for any type of immigration into any country? Yes <?=$immigration_applied_yes?> No <?=$immigration_applied_no?>
</td>
</tr>

<tr class="<?=$immigration_ditail_display?>">
<td colspan="4">
<textarea class="form-control form-control-sm" style="height:100px;" readonly><?=$urn_info['immigration_detail']?></textarea>
</td>
</tr>

<tr>
<td colspan="4" class="ps-2">
<?php
if($urn_info['past_visa_refusal_status'])
{
	$past_visa_refusal_status_no = "<span class='text-danger m-1' data-feather='x-square' style='height: 15px; width: 15px;'></span>";
	$past_visa_refusal_status_yes = "<span class='text-success m-1' data-feather='check-square' style='height: 15px; width: 15px;'></span>";
	$pass_visa_refusal_detail_display = "";
}
else 
{
	$past_visa_refusal_status_yes = "<span class='text-danger m-1' data-feather='x-square' style='height: 15px; width: 15px;'></span>";
	$past_visa_refusal_status_no = "<span class='text-success m-1' data-feather='check-square' style='height: 15px; width: 15px;'></span>";
	$pass_visa_refusal_detail_display = "d-none";
}

?>
Has the applicant ever had their visa refused for any country? Yes <?=$past_visa_refusal_status_yes?> No <?=$past_visa_refusal_status_no?>
</td>
</tr>

<tr class="<?=$pass_visa_refusal_detail_display?>">
<td colspan="4">
<textarea class="form-control form-control-sm" style="height:100px;" readonly><?=$urn_info['past_visa_refusal_detail']?></textarea>
</td>
</tr>

<tr>
<td colspan="4" class="ps-2">
<?php
if($urn_info['serious_medical_status'])
{
	$serious_medical_status_no = "<span class='text-danger m-1' data-feather='x-square' style='height: 15px; width: 15px;'></span>";
	$serious_medical_status_yes = "<span class='text-success m-1' data-feather='check-square' style='height: 15px; width: 15px;'></span>";
	$serious_medical_detail_display = "";
}
else 
{
	$serious_medical_status_yes = "<span class='text-danger m-1' data-feather='x-square' style='height: 15px; width: 15px;'></span>";
	$serious_medical_status_no = "<span class='text-success m-1' data-feather='check-square' style='height: 15px; width: 15px;'></span>";
	$serious_medical_detail_display = "d-none";
}

?>
Does the applicant suffer from a serious medical condition? Yes <?=$serious_medical_status_yes?> No <?=$serious_medical_status_no?>
</td>
</tr>

<tr class="<?=$serious_medical_detail_display?>">
<td colspan="4">
<textarea class="form-control form-control-sm" style="height:100px;" readonly><?=$urn_info['medical_condition_detail']?></textarea>
</td>
</tr>

<tr>
<td colspan="4" class="ps-2">
<?php
if($urn_info['criminal_offence_status'])
{
	$criminal_offence_status_no = "<span class='text-danger m-1' data-feather='x-square' style='height: 15px; width: 15px;'></span>";
	$criminal_offence_status_yes = "<span class='text-success m-1' data-feather='check-square' style='height: 15px; width: 15px;'></span>";
	$criminal_offence_detail_display = "";
}
else 
{
	$criminal_offence_status_yes = "<span class='text-danger m-1' data-feather='x-square' style='height: 15px; width: 15px;'></span>";
	$criminal_offence_status_no = "<span class='text-success m-1' data-feather='check-square' style='height: 15px; width: 15px;'></span>";
	$criminal_offence_detail_display = "d-none";
}

?>
Has the applicant ever been convicted of a criminal offence? Yes <?=$criminal_offence_status_yes?> No <?=$criminal_offence_status_no?>
</td>
</tr>

<tr class="<?=$criminal_offence_detail_display?>">
<td colspan="4">
<textarea class="form-control form-control-sm" style="height:100px;" readonly><?=$urn_info['criminal_offence_detail']?></textarea>
</td>
</tr>

</table>

</center>
</div>

<?php include_once("footer_copyright.php"); ?>