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
	if($urn_audit_history['id'] == $latest_audit['id'])
	$updation_date = "<span class='text-danger'>".date('d-m-Y h:i:s A',$urn_audit_history['datentime'])." (Current)<span>";
	else
	$updation_date = "<span class='text-success'>".date('d-m-Y h:i:s A',$urn_audit_history['datentime'])."<span>";
	$documents_list = "";

	echo "<center>
		<div class='card h-100 mx-4'>
		<div class='card-body' style='width:500px;'>
		<table class='table table-sm table-hover fs-9'>
		<thead>
		<tr><th colspan='3' class='text-center'>".$updation_date."</th></tr>
		</thead>
		<tbody>
		<tr><td nowrap>Current Batch </td><td>:</td><td>B".$current_status_batch_id."</td></tr>
		<tr><td nowrap>Current Status </td><td>:</td><td>";
	if(str_contains($urn_audit_history['updated_columns'],'status'))
		echo "<span class='text-danger'>".getFieldValue('description','id',$urn_audit_history['status_id'],'lead_status_list',$con)."</span>";
	else
		echo getFieldValue('description','id',$urn_audit_history['status_id'],'lead_status_list',$con);

	echo "</td></tr>
		<tr><td nowrap>Updation Remark </td><td>:</td><td><textarea class='bg-transparent text-danger' readonly>".$urn_audit_history['updation_remark']."</textarea></td></tr>
		</tbody>
		<thead>
		<tr><th colspan='3' nowrap>Student Detail</th></tr>
		</thead>
		<tbody>
		<tr><td nowrap>Student Name </td><td>:</td><td>";

	if(str_contains($urn_audit_history['updated_columns'],'student_name'))
		echo "<span class='text-danger'>".$urn_audit_history['student_name']."</span>";
	else
		echo $urn_audit_history['student_name'];

	echo "</td></tr>
		<tr><td nowrap>Student Mobile </td><td>:</td><td>";

	if(str_contains($urn_audit_history['updated_columns'],'student_mobile_primary'))
		echo "<span class='text-danger'>".$urn_audit_history['student_mobile']."</span>";
	else
		echo $urn_audit_history['student_mobile'];

	echo "</td></tr>
		<tr><td nowrap>Student Mobile Alt </td><td>:</td><td>";

	if(str_contains($urn_audit_history['updated_columns'],'student_mobile_alt'))
		echo "<span class='text-danger'>".$urn_audit_history['student_mobile_alt']."</span>";
	else
		echo $urn_audit_history['student_mobile_alt'];

	echo "</td></tr>
		<tr><td nowrap>Student Email </td><td>:</td><td>";

	if(str_contains($urn_audit_history['updated_columns'],'student_email'))
		echo "<span class='text-danger'>".$urn_audit_history['student_email']."</span>";
	else
		echo $urn_audit_history['student_email'];
		
	echo "</td></tr>
		<tr><td nowrap>Student DOB </td><td>:</td><td>";

	if(str_contains($urn_audit_history['updated_columns'],'student_dob'))
		echo "<span class='text-danger'>".date('d-m-Y',$urn_audit_history['student_dob'])."</span>";
	else
		echo date('d-m-Y',$urn_audit_history['student_dob']);

	echo "</td></tr>
		<tr><td nowrap>Student Address </td><td>:</td><td>";

	if(str_contains($urn_audit_history['updated_columns'],'student_address'))
		echo "<span class='text-danger'>".$urn_audit_history['student_address']."</span>";
	else
		echo $urn_audit_history['student_address'];

	echo "</td></tr>
		<tr><td>Brief Note </td><td>:</td><td>";

	if(str_contains($urn_audit_history['updated_columns'],'student_brief_note'))
		echo "<span class='text-danger'>".$urn_audit_history['student_brief_note']."</span>";
	else
		echo $urn_audit_history['student_brief_note'];

	echo "</td></tr>
		</tbody>
		<thead>
		<tr><th colspan='3' nowrap>Course Detail</th></tr>
		</thead>";

	$query_course_detail = "SELECT * FROM course_list WHERE id ='".$urn_audit_history['course_id']."'";
	$result_course_details = mysqli_query($con, $query_course_detail);
	$lead_course = mysqli_fetch_assoc($result_course_details);

	if(str_contains($urn_audit_history['updated_columns'],'course'))
	{
		echo "<tbody>
			<tr><td nowrap>Course Name </td><td>:</td><td class='text-danger'>".strtoupper($lead_course['name'])."</td></tr>
			<tr><td nowrap>Course Type </td><td>:</td><td class='text-danger' nowrap>".ucfirst($lead_course['type'])."</td></tr>
			<tr><td nowrap>Course Intake </td><td>:</td><td class='text-danger' nowrap>".strtoupper($lead_course['intake'])."</td></tr>
			<tr><td nowrap>University </td><td>:</td><td class='text-danger' nowrap>".strtoupper(getFieldValue('name','id',$lead_course['university_id'],'university_list',$con))."</td></tr>
			<tr><td nowrap>Course Duration </td><td>:</td><td class='text-danger' nowrap>".ucwords($lead_course['duration'])."</td></tr>
			</tbody>";
	}
	else
	{
		echo "<tbody>
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
?>
</div>
