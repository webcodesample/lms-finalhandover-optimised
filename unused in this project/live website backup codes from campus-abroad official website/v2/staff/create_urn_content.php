<div class="d-flex justify-content-between mb-5">
<div>
<h5 class="text-primary"><?=strtoupper($temp_lead['name'])?></h5>
<div class="d-flex">
<h6 class="text-success"><?=$temp_lead['email']?></h6>
<h6 class="text-danger ps-2"><?=$temp_lead['mobile']?></h6>

</div>
</div>
<?php setGoBack('temp_leads.php'); ?>
</div>

<?php
if($email_duplicay_flag == 0)
{
?>

<form id="search_form" method="post">
<div class="d-flex mt-2 mb-2">

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
	echo "<option value='".$duration['duration']."' selected='selected'>".strtoupper($duration['duration'])." Months</option>";
	else
	echo "<option value='".$duration['duration']."'>".strtoupper($duration['duration'])." Months</option>";
}
?>
</select>

<select class="form-select form-select-sm m-1" style="width:100px;" name="fee" onChange="liveSearch()">
<option value="">Fee</option>
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

<input type="submit" value="Search Course" class="btn btn-sm btn-subtle-primary m-1">
<input type="button" value="Create URN" class="btn btn-sm btn-subtle-danger m-1" onClick="updateURNCourse()">

</div>
<input type="hidden" name="action_perform" value="search_filter">
<input type="hidden" name="page_index" id="page_index">
</form>

<form id="urn_course_selection_form" action="create_urn_course_selection.php" method="post">

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
		<td class='ps-1'><input type='radio' name='course_id' value='".$course['course_id']."'> ".$i."</td>
		<td>".strtoupper(getFieldValue('name','id',$course['country'],'country_list',$con))."</td>
		<td>".strtoupper($course['university'])."</td>
		<td>".strtoupper($course['course_name'])."</td>
		<td>".strtoupper($course['type'])."</td>
		<td>".strtoupper($course['intake'])."</td>
		<td>".strtoupper($course['duration'])." Months</td>
		<td>".strtoupper($course['eligibility'])."</td>
		<td class='pe-1'>".$course['fee']."</td>
		</tr>";
}

if($i == 0)
{
	echo "<tr><td colspan='10' align='center' class='text-danger fw-bold'>No Course Available</td></tr>";
}
?>

</tbody>
</table>

<div class="mb-2 text-center">
<?php include_once("../common/pagination.php"); ?>
</div>

<input type="hidden" name="temp_lead_id" value="<?=$_REQUEST['temp_lead_id']?>">
<input type="hidden" name="name" value="<?=$temp_lead['name']?>">
<input type="hidden" name="mobile" value="<?=$temp_lead['mobile']?>">
<input type="hidden" name="email" value="<?=$temp_lead['email']?>">
<input type="hidden" name="lead_source_id" value="<?=$temp_lead['source_id']?>">

</form>

<?php
}
else
{
	echo "<div class='text-danger text-center fw-bold'>Sorry! Email <span class='text-primary'>".$temp_lead['email']."</span> Already Exist<br>If you want to change it then <a href='manage_temp_lead.php?id=".$temp_lead['id']."' class='text-decoration-none'>click here</a></div>";
}
?>

<?php include_once("footer_copyright.php") ?>