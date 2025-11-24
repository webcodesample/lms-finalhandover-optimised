<div class="text-end">
<?=setGoBack("view_course.php") ?>
</div>

<form id="crud_form_course" action="add_course.php" method="post">
<input type="hidden" name="action_perfom" value="add_course">

<table class="table table-sm table-borderless w-auto fs-9">

<tr>
	<td class="align-middle">University</td>
	<td>
		<input type="text" name="university" id="university" class="form-control form-control-sm m-1 z-index" style="width:200px;" placeholder="University" required>
	</td>
</tr>

<tr>
	<td class="align-middle">Name</td>
	<td>
		<input type="text" name="course_name" placeholder="Course Name" class="form-control form-control-sm m-1" style="width:200px;" required>
	</td>
</tr>

<tr>
	<td class="align-middle">Type</td>
	<td>
		<input type="text" name="course_type" placeholder="Course/Degree Type" class="form-control form-control-sm m-1" style="width:200px;" required>
	</td>
</tr>

<tr>
	<td class="align-top pt-2">Intake</td>
	<td width="200px" class="d-flex flex-wrap">
		<?php echo showMonthsCheckBoxes('course_intake'); ?>
	</td>
</tr>

<tr>
	<td class="align-middle">Duration</td>
	<td>
		<input type="text" name="course_duration" placeholder="Course Duration" class="form-control form-control-sm m-1" style="width:200px;" required>
	</td>
</tr>

<tr>
	<td class="align-middle">Eligibility</td>
	<td>
		<input type="text" name="course_eligibility" placeholder="Course Eligibility" class="form-control form-control-sm m-1" style="width:200px;" required>
	</td>
</tr>

<tr>
	<td class="align-middle">Fee</td>
	<td>
		<input type="trxt" name="course_fee" placeholder="Course Fee" class="form-control form-control-sm m-1" style="width:200px;" required>
	</td>
</tr>

<tr>
	<td colspan="2" align="center">
		<input type="submit" value="Add Course" class="btn btn-sm btn-primary rounded m-1" onClick="return validateCourseSubmit()">
	</td>
</tr>

</table>
</form>