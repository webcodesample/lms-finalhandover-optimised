<div class="d-flex justify-content-end">
<a href="add_course.php"><img src="../portal-icons/add.png" height="35px"></a>
<button class="btn btn-sm btn-subtle-success m-1" data-bs-toggle="modal" data-bs-target="#importCourse">Import Courses</button>
<a href="../sample_format/courses_sheet_format.xlsx" class="btn btn-sm btn-subtle-warning m-1">Sample Format</a>
</div>

<form id="search_form" method="post">
<div class="d-flex mt-2">

<input type="text" class="form-control form-control-sm m-1" style="width:100px;" name="country" id="country" onChange="liveSearch()" value="<?php if(isset($_REQUEST['country']) && $_REQUEST['country']) echo $_REQUEST['country'];?>" placeholder="Country">

<input type="text" class="form-control form-control-sm m-1" style="width:100px;" name="university" id="university" onChange="liveSearch()" value="<?php if(isset($_REQUEST['university']) && $_REQUEST['university']) echo $_REQUEST['university'];?>" placeholder="University">

<input type="text" class="form-control form-control-sm m-1" style="width:100px;" name="course" id="course" onChange="liveSearch()" value="<?php if(isset($_REQUEST['course']) && $_REQUEST['course']) echo $_REQUEST['course'];?>" placeholder="Course">

<input type="text" class="form-control form-control-sm m-1" style="width:100px;" name="course_type" id="course_type" onChange="liveSearch()" value="<?php if(isset($_REQUEST['course_type']) && $_REQUEST['course_type']) echo $_REQUEST['course_type'];?>" placeholder="Course Type">

<input type="text" class="form-control form-control-sm m-1" style="width:100px;" name="course_eligibility" id="course_eligibility" onChange="liveSearch()" value="<?php if(isset($_REQUEST['course_eligibility']) && $_REQUEST['course_eligibility']) echo $_REQUEST['course_eligibility'];?>" placeholder="Eligibility">

<select class="form-select form-select-sm m-1" style="width:100px;" name="intake" onChange="liveSearch()">
<option value="">Intake</option>
<?php
	if(isset($_REQUEST['intake']) && $_REQUEST['intake'])
	echo showSelectedMonthDropdown($_REQUEST['intake']);
	else
	echo showMonthsDropdown();
?>
</select>

<select class="form-select form-select-sm m-1" style="width:100px;" name="duration" onChange="liveSearch()">
<option value="">Duration</option>
<?php
$get_durationlist_query = "SELECT DISTINCT duration FROM course_list";
$get_durationlist_result = mysqli_query($con, $get_durationlist_query);

while($duration = mysqli_fetch_assoc($get_durationlist_result))
{
	if(isset($_REQUEST['duration']) && $_REQUEST['duration'] == $duration['duration'])
	echo "<option value='".$duration['duration']."' selected='selected'>".strtoupper($duration['duration'])."</option>";
	else
	echo "<option value='".$duration['duration']."'>".strtoupper($duration['duration'])."</option>";
}
?>
</select>

<select class="form-select form-select-sm m-1" style="width:100px;" name="fee" onChange="liveSearch()">
<option value="">Course Fee</option>
<?php
$get_feelist_query = "SELECT DISTINCT fee FROM course_list";
$get_feelist_result = mysqli_query($con, $get_feelist_query);

while($fee = mysqli_fetch_assoc($get_feelist_result))
{
	if(isset($_REQUEST['fee']) && $_REQUEST['fee'] == $fee['fee'])
	echo "<option value='".$fee['fee']."' selected='selected'>".strtoupper($fee['fee'])."</option>";
	else
	echo "<option value='".$fee['fee']."'>".strtoupper($fee['fee'])."</option>";
}
?>
</select>

<input type="text" class="form-control form-control-sm m-1" style="width:100px;" name="keyword" id="keyword" onChange="liveSearch()" value="<?php if(isset($_REQUEST['keyword']) && $_REQUEST['keyword']) echo $_REQUEST['keyword'];?>" placeholder="Keyword">

<input type="submit" value="Search" class="btn btn-sm btn-subtle-primary m-1">
<a href="view_course.php"><img src="../portal-icons/reset.png"></a>
</div>
<input type="hidden" name="action_perform" value="search_filter">
<input type="hidden" name="page_index" id="page_index">
</form>

<center>
<table class="table table-sm table-bordered table-striped table-hover fs-9">

<thead class="table-info text-center">
<tr>
<th>ID</th>
<th>Country</th>
<th>University</th>
<th>Course</th>
<th>Course Type</th>
<th>Intake</th>
<th>Duration</th>
<th>Eligibility</th>
<th>Fee</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<?php
if(checkIsRequested('page_index'))
$i = $nrpp*($_REQUEST['page_index']-1);
else
$i = 0;

while($course = mysqli_fetch_assoc($view_result_per_page))
{
	$i++;
	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>".strtoupper(getFieldValue('name','id',$course['country'],'country_list',$con))."</td>
		<td>".strtoupper($course['university'])."</td>
		<td>".strtoupper($course['course_name'])."</td>
		<td>".strtoupper($course['type'])."</td>
		<td>".strtoupper($course['intake'])."</td>
		<td>".strtoupper($course['duration'])."</td>
		<td>".strtoupper($course['eligibility'])."</td>
		<td>".$course['fee']."</td>
		<td nowrap>
		<a href='edit_course.php?course_id=".$course['course_id']."'><img src='../portal-icons/edit.png' height='20px'></a>&nbsp;
		<a href='delete_course.php?course_id=".$course['course_id']."'><img src='../portal-icons/delete.png' height='20px'></a>
		</td>
		</tr>";
}

if($i == 0)
{
	echo "<tr><td colspan='10' align='center' class='text-danger fw-bold'>No Course Available</td></tr>";
}
?>

</tbody>
</table>

<?php include_once("../common/pagination.php"); ?>

</center>
<?php include_once("footer_copyright.php") ?>
<?php
include_once("import_course_modal.php");
?>