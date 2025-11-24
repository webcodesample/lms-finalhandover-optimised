<div class="d-flex justify-content-end">
<button class="btn btn-sm btn-subtle-danger me-2" onClick="printURN()">
<span data-feather="printer" style="height: 20px; width: 20px;"></span>
</button>
<?php setGoBack("leads.php"); ?>
</div>

<div id="myPrintableDiv" class="mt-5">
<center>
<table class="table table-sm table-borderless fs-9 w-auto mt-5">
  
<tr>
<td class="pe-2">URN</td>
<td>
<input type="text" class="form-control form-control-sm fw-bold text-danger" value="CA<?=$urn?>" readonly>
</td>
</tr>

<tr>
<th class="align-middle fs-8" height="50px">Personal Detail</th>
</tr>

<tr>
<td class="pe-2">Name</td>
<td>
<input type="text" class="form-control form-control-sm" name="student_name" value="<?=$urn_info['student_name']?>" readonly>
</td>
<td>&nbsp;</td>
<td rowspan="5" class="align-middle">
	<div class="card">
		<div class="card-body fw-bolder" style="height:200px; padding-top:90px; padding-left:40%;">
			Photo
		</div>
	</card>
</td>
</tr>

<tr>
<td class="pe-2">Date of Birth</td>
<td>
<input type="text" class="form-control form-control-sm" name="student_dob" value="<?=date('d-m-Y',$urn_info['student_dob'])?>" readonly>
</td>
</tr>

<tr>
<td class="pe-2">Email</td>
<td>
<input type="email" class="form-control form-control-sm" name="student_email" value="<?=$urn_info['student_email']?>" readonly>
</td>
</tr>

<tr>
<td class="pe-2">Mobile</td>
<td>
<input type="text" class="form-control form-control-sm" name="student_mobile" value="<?=$urn_info['student_mobile']?>" readonly>
</td>
</tr>

<tr>
<td class="pe-2">Mobile (Alt)</td>
<td>
<input type="text" class="form-control form-control-sm" name="student_mobile_alt" value="<?=$urn_info['student_mobile_alt']?>" readonly>
</td>
</tr>

<tr>
<th class="align-middle fs-8" height="50px">Course Detail</th>
</tr>

<tr>
<td class="pe-2">Name</td>
<td class="d-flex">
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('name','id',$urn_info['course_id'],'course_list',$con)?>" readonly>
</td>  
<td class="pe-2 ps-5">Type</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('type','id',$urn_info['course_id'],'course_list',$con)?>" readonly>
</td>  
</tr>

<tr>
<td class="pe-2">Intake</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('intake','id',$urn_info['course_id'],'course_list',$con)?>" readonly>
</td>
<td class="pe-2 ps-5">Duration</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('duration','id',$urn_info['course_id'],'course_list',$con)?>" readonly>
</td>
</tr>

<tr>
<td class="pe-2">University</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$university?>" readonly>
</td>

<td class="pe-2 ps-5">Country</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=strtoupper(getFieldValue('name','id',$country_id,'country_list',$con))?>" readonly>
</td>
</tr>

<tr>
<td class="pe-2">Fee</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('fee','id',$urn_info['course_id'],'course_list',$con)?>" readonly>
</td>
<td class="pe-2 ps-5">Currency</td>
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

</table>

</center>
</div>

<?php include_once("footer_copyright.php"); ?>