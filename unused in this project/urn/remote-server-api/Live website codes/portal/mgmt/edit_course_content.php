<form id="crud_form_course" action="update_course.php" method="post">
<input type="hidden" name="course_id" value="<?=$_REQUEST['course_id']?>">
<input type="hidden" name="action_perfom" value="update_course">

<table class="table table-sm table-borderless w-auto fs-9">

<tr>
	<td class="align-middle">University</td>
	<td>
	<input type="text" name="university" class="form-control form-control-sm m-1 fw-bold text-primary" style="width:200px;" value="<?=getFieldValue('name','id',$course['university_id'],'university_list',$con)?>" disabled>
	</td>
</tr>

<tr>
	<td class="align-middle">Name</td>
	<td>
	<input type="text" name="course_name" placeholder="Course Name" class="form-control form-control-sm m-1 fw-bold text-danger" style="width:200px;" value="<?=$course['name']?>" disabled>
	</td>
</tr>

<tr>
	<td class="align-middle">Type</td>
	<td>
	<input type="text" name="course_type" placeholder="Course/Degree Type" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$course['type']?>" required>
	</td>
</tr>

<tr>
	<td class="align-top pt-2">Intake</td>
	<td width="200px" class="d-flex flex-wrap">
		<?php		
		echo showSelectedMonthCheckBoxes('course_intake',$course['intake']);
		?>
	</td>
</tr>

<tr>
	<td class="align-middle">Duration</td>
	<td>
	<input type="text" name="course_duration" placeholder="Course Duration" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$course['duration']?>" required>
	</td>
</tr>

<tr>
	<td class="align-middle">Eligibility</td>
	<td>
	<input type="text" name="course_eligibility" placeholder="Course Eligibility" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$course['eligibility']?>" required>
	</td>
</tr>

<tr>
	<td class="align-middle">Fee</td>
	<td>
	<input type="trxt" name="course_fee" placeholder="Course Fee" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$course['fee']?>" required>
	</td>
</tr>

<tr>
	<td colspan="2" align="center">
	<input type="submit" value="Update Course" class="btn btn-sm btn-primary m-1" onClick="return validateCourseSubmit()">
	</td>
</tr>

</table>

	
</form>

<?php include_once("footer_copyright.php") ?>