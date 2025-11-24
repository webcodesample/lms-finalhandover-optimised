<?php
if(isset($_REQUEST['audit_index']) && $_REQUEST['audit_index'])
$audit_history_offset = $_REQUEST['audit_index'];
else
$audit_history_offset = 0;

$audit_history_total = getRowCount('lead_id',$_REQUEST['lead_id'],'urn_audit_history',$con);

$query_audit_history = "SELECT * FROM urn_audit_history WHERE lead_id = '".$_REQUEST['lead_id']."' ORDER BY datentime DESC LIMIT 2 OFFSET ".$audit_history_offset;
$result_audit_history = mysqli_query($con, $query_audit_history);

$query_latest_audit = "SELECT id FROM urn_audit_history WHERE lead_id = '".$_REQUEST['lead_id']."' ORDER BY datentime DESC LIMIT 1";
$result_latest_audit = mysqli_query($con, $query_latest_audit);
$latest_audit = mysqli_fetch_assoc($result_latest_audit);

?>
<div class="container">
<div class="d-flex justify-content-between">
<?php
if($audit_history_offset > 0)
{
	echo "<a href='urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=audit&audit_index=".($audit_history_offset-1)."' class='btn btn-subtle-primary btn-sm m-1'>New</a>";
}
else
{
	echo "<input type='button' class='btn btn-subtle-primary btn-sm m-1' value='New' disabled>";
}

if($audit_history_offset < ($audit_history_total-2))
{
	echo "<a href='urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=audit&audit_index=".($audit_history_offset+1)."' class='btn btn-subtle-primary btn-sm m-1'>Old</a>";
}
else
{
	echo "<input type='button' class='btn btn-subtle-primary btn-sm m-1' value='Old' disabled>";
}

?>
</div>
</div>

<div class="d-flex">
<?php
$i=0;
while($urn_audit_history = mysqli_fetch_assoc($result_audit_history))
{
	$i++;

	if($urn_audit_history['id'] == $latest_audit['id'])
	$updation_date = "<span class='text-danger'>".date('d-m-Y h:i:s A',$urn_audit_history['datentime'])." (Current)<span>";
	else
	$updation_date = "<span class='text-success'>".date('d-m-Y h:i:s A',$urn_audit_history['datentime'])."<span>";
	$documents_list = "";

	if($urn_audit_history['updated_columns'])
	$updated_column_array = explode(',',$urn_audit_history['updated_columns']);
	else
	$updated_column_array = [];

	echo "<center>
		<div class='card h-100 mx-4'>
		<div class='card-body' style='width:500px;'>
		<table class='table table-sm table-hover fs-9'>
		<thead>
		<tr><th colspan='3' class='text-center'>".$updation_date."
		<button id='all_detail_btn_".$i."' class='btn btn-sm btn-subtle-danger ms-2 px-1 py-0 fw-bolder' onClick='toggleAllSections()'>+</button>
		</th></tr>
		</thead>
		<tbody>
		<tr><td nowrap>Current Batch </td><td>:</td><td>B".$current_status_batch_id."</td></tr>
		<tr><td nowrap>Current Status </td><td>:</td><td>";
	if(in_array('status',$updated_column_array))
		echo "<span class='text-danger'>".getFieldValue('description','id',$urn_audit_history['status_id'],'lead_status_list',$con)."</span>";
	else
		echo getFieldValue('description','id',$urn_audit_history['status_id'],'lead_status_list',$con);

	echo "</td></tr>
		<tr><td nowrap>Updation Remark </td><td>:</td><td><textarea class='bg-transparent text-danger' readonly>".$urn_audit_history['updation_remark']."</textarea></td></tr>
		</tbody>
		<thead>
		<tr><th colspan='3' nowrap>Student Detail<button id='personal_detail_btn_".$i."' class='btn btn-sm btn-subtle-danger ms-2 px-1 py-0 fw-bolder' onClick='toggleSection(&quot;personal_detail&quot;)'>+</button></th></tr>
		</thead>
		<tbody id='personal_detail_".$i."' class='d-none'>
		<tr><td nowrap>Student Name </td><td>:</td><td>";

	if(in_array('student_name',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['student_name']."</span>";
	else
		echo $urn_audit_history['student_name'];

	echo "</td></tr>
		<tr><td nowrap>Student Mobile </td><td>:</td><td>";

	if(in_array('student_mobile_primary',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['student_mobile']."</span>";
	else
		echo $urn_audit_history['student_mobile'];

	echo "</td></tr>
		<tr><td nowrap>Student Mobile Alt </td><td>:</td><td>";

	if(in_array('student_mobile_alt',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['student_mobile_alt']."</span>";
	else
		echo $urn_audit_history['student_mobile_alt'];

	echo "</td></tr>
		<tr><td nowrap>Student Email </td><td>:</td><td>";

	if(in_array('student_email',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['student_email']."</span>";
	else
		echo $urn_audit_history['student_email'];
		
	echo "</td></tr>
		<tr><td nowrap>Student DOB </td><td>:</td><td>";

	if(in_array('student_dob',$updated_column_array))
		echo "<span class='text-danger'>".date('d-m-Y',$urn_audit_history['student_dob'])."</span>";
	else
		echo date('d-m-Y',$urn_audit_history['student_dob']);

	echo "</td></tr>
		<tr><td nowrap>Student Address </td><td>:</td><td>";

	if(in_array('student_address',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['student_address']."</span>";
	else
		echo $urn_audit_history['student_address'];

	echo "</td></tr>
		<tr><td>Brief Note </td><td>:</td><td>";

	if(in_array('student_brief_note',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['student_brief_note']."</span>";
	else
		echo $urn_audit_history['student_brief_note'];

	echo "</td></tr>
		</tbody>
		<thead>
		<tr><th colspan='3' nowrap>Highest Education<button id='highest_education_detail_btn_".$i."' class='btn btn-sm btn-subtle-danger ms-2 px-1 py-0 fw-bolder' onClick='toggleSection(&quot;highest_education_detail&quot;)'>+</button></th></tr>
		</thead>";

	echo "<tbody id='highest_education_detail_".$i."' class='d-none'>
		<tr><td>Type </td><td>:</td><td>";

	$education_type = ['Not Added','Master','Graduate','10+2','10th'];
	if(in_array('highest_education_type',$updated_column_array))
		echo "<span class='text-danger'>".$education_type[$urn_audit_history['highest_education_type']]."</span>";
	else
		echo $education_type[$urn_audit_history['highest_education_type']];

	echo "</td></tr>
		<tr><td>Degree/Certificate </td><td>:</td><td>";

	if(in_array('highest_education_name',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['highest_education_name']."</span>";
	else
		echo $urn_audit_history['highest_education_name'];

	echo "</td></tr>
		<tr><td>From Year </td><td>:</td><td>";

	if(in_array('highest_education_from_year',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['highest_education_from_year']."</span>";
	else
		echo $urn_audit_history['highest_education_from_year'];

	echo "</td></tr>
		<tr><td>To Year </td><td>:</td><td>";

	if(in_array('highest_education_to_year',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['highest_education_to_year']."</span>";
	else
		echo $urn_audit_history['highest_education_to_year'];

	echo "</td></tr>
		<tr><td>University/Board </td><td>:</td><td>";

	if(in_array('highest_education_institution',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['highest_education_institution']."</span>";
	else
		echo $urn_audit_history['highest_education_institution'];

	echo "</td></tr>
		<tr><td>University/Board City</td><td>:</td><td>";

	if(in_array('highest_education_institution_city',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['highest_education_institution_city']."</span>";
	else
		echo $urn_audit_history['highest_education_institution_city'];

	echo "</td></tr>
		<tr><td>University/Board Country</td><td>:</td><td>";

	if(in_array('highest_education_institution_country',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['highest_education_institution_country']."</span>";
	else
		echo $urn_audit_history['highest_education_institution_country'];

	echo "</td></tr>
		</tbody>
		<thead>
		<tr><th colspan='3' nowrap>Test Details<button id='test_taken_detail_btn_".$i."' class='btn btn-sm btn-subtle-danger ms-2 px-1 py-0 fw-bolder' onClick='toggleSection(&quot;test_taken_detail&quot;)'>+</button></th></tr>
		</thead>";

	echo "<tbody id='test_taken_detail_".$i."' class='d-none'>
		<tr><td>Test Taken (Any) </td><td>:</td><td>";

	//get total test taken count
	if($urn_audit_history['test_name'])
	$test_taken_name_array = explode(',',$urn_audit_history['test_name']);
	else
	$test_taken_name_array = [];

	if($urn_audit_history['other_test_name'])
	$other_test_taken_name_array = explode(',',$urn_audit_history['other_test_name']);
	else
	$other_test_taken_name_array = [];

	$total_test_taken = count($test_taken_name_array)+count($other_test_taken_name_array);

	if($urn_audit_history['test_taken_flag'])
		$test_taken_description = $total_test_taken." Test Taken";
	else
		$test_taken_description = "No Test Taken";

	if(in_array('test_taken_flag',$updated_column_array))
		echo "<span class='text-danger'>".$test_taken_description."</span>";
	else
		echo $test_taken_description;

	echo "</td></tr>
		<tr><td>Test Name </td><td>:</td><td>";
	
	//get all taken test names
	if($urn_audit_history['test_name'] && $urn_audit_history['other_test_name'])
		$test_names = $urn_audit_history['test_name'].",".$urn_audit_history['other_test_name'];
	else if($urn_audit_history['test_name'] == '' && $urn_audit_history['other_test_name'])
		$test_names = $urn_audit_history['other_test_name'];
	else if($urn_audit_history['test_name'] && $urn_audit_history['other_test_name'] == '')
		$test_names = $urn_audit_history['test_name'];
	else
		$test_names = "";

	if(in_array('test_name',$updated_column_array) || in_array('other_test_name',$updated_column_array))
		echo "<span class='text-danger'>".strtoupper($test_names)."</span>";
	else
		echo strtoupper($test_names);

	echo "</td></tr>
		</tbody>
		<thead>
		<tr><th colspan='3' nowrap>Passport Details<button id='passport_detail_btn_".$i."' class='btn btn-sm btn-subtle-danger ms-2 px-1 py-0 fw-bolder' onClick='toggleSection(&quot;passport_detail&quot;)'>+</button></th></tr>
		</thead>";

	echo "<tbody id='passport_detail_".$i."' class='d-none'>
		<tr><td>Number </td><td>:</td><td>";

	if(in_array('passport_number',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['passport_number']."</span>";
	else
		echo $urn_audit_history['passport_number'];

	echo "</td></tr>
		<tr><td>Place of Issue </td><td>:</td><td>";

	if(in_array('passport_place_of_issue',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['passport_place_of_issue']."</span>";
	else
		echo $urn_audit_history['passport_place_of_issue'];

	echo "</td></tr>
		<tr><td>Issue Date </td><td>:</td><td>";

	if(in_array('passport_issued_on',$updated_column_array))
		echo "<span class='text-danger'>".date('d-m-Y',$urn_audit_history['passport_issued_on'])."</span>";
	else
		echo date('d-mY',$urn_audit_history['passport_issued_on']);

	echo "</td></tr>
		<tr><td>Valid Till </td><td>:</td><td>";

	if(in_array('passport_valid_till',$updated_column_array))
		echo "<span class='text-danger'>".date('d-m-Y',$urn_audit_history['passport_valid_till'])."</span>";
	else
		echo date('d-m-Y',$urn_audit_history['passport_valid_till']);

	echo "</td></tr>
		<tr><td>Holder Name </td><td>:</td><td>";

	if(in_array('passport_holder_name',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['passport_holder_name']."</span>";
	else
		echo $urn_audit_history['passport_holder_name'];

	echo "</td></tr>
		<tr><td>Holder Surname </td><td>:</td><td>";

	if(in_array('passport_holder_surname',$updated_column_array))
		echo "<span class='text-danger'>".$urn_audit_history['passport_holder_surname']."</span>";
	else
		echo $urn_audit_history['passport_holder_surname'];

	echo "</td></tr>
		</tbody>
		<thead>
		<tr><th colspan='3' nowrap>Course Selection Detail<button id='course_selection_detail_btn_".$i."' class='btn btn-sm btn-subtle-danger ms-2 px-1 py-0 fw-bolder' onClick='toggleSection(&quot;course_selection_detail&quot;)'>+</button></th></tr>
		</thead>";

	$query_course_detail = "SELECT * FROM course_list WHERE id ='".$urn_audit_history['course_id']."'";
	$result_course_details = mysqli_query($con, $query_course_detail);
	$lead_course = mysqli_fetch_assoc($result_course_details);

	if(in_array('course',$updated_column_array))
	{
		echo "<tbody id='course_selection_detail_".$i."' class='d-none'>
			<tr><td nowrap>Course Name </td><td>:</td><td class='text-danger'>".strtoupper($lead_course['name'])."</td></tr>
			<tr><td nowrap>Course Type </td><td>:</td><td class='text-danger' nowrap>".ucfirst($lead_course['type'])."</td></tr>
			<tr><td nowrap>Course Intake </td><td>:</td><td class='text-danger' nowrap>".strtoupper($lead_course['intake'])."</td></tr>
			<tr><td nowrap>University </td><td>:</td><td class='text-danger' nowrap>".strtoupper(getFieldValue('name','id',$lead_course['university_id'],'university_list',$con))."</td></tr>
			<tr><td nowrap>Course Duration </td><td>:</td><td class='text-danger' nowrap>".ucwords($lead_course['duration'])."</td></tr>
			</tbody>";
	}
	else
	{
		echo "<tbody id='course_selection_detail_".$i."' class='d-none'>
			<tr><td nowrap>Course Name </td><td>:</td><td>".strtoupper($lead_course['name'])."</td></tr>
			<tr><td nowrap>Course Type </td><td>:</td><td nowrap>".ucfirst($lead_course['type'])."</td></tr>
			<tr><td nowrap>Course Intake </td><td>:</td><td nowrap>".strtoupper($lead_course['intake'])."</td></tr>
			<tr><td nowrap>University </td><td>:</td><td nowrap>".strtoupper(getFieldValue('name','id',$lead_course['university_id'],'university_list',$con))."</td></tr>
			<tr><td nowrap>Course Duration </td><td>:</td><td nowrap>".ucwords($lead_course['duration'])."</td></tr>
			</tbody>";
	}

	echo "</table>
		</div>
		</div>		
		</center>";
}
echo "<input type='hidden' id='audit_count' value='".$i."'>";
?>
</div>

<script src="../js/auditHistory.js"></script>