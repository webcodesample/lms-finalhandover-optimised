<form id="search_form" method="post">
<div class="container mt-3" style="width:300px;">

<div class="d-flex justify-content-center">
<a href="course_finder.php" class="btn btn-outline-secondary m-1 rounded">Clear Filter</a>
<input type="submit" value="Apply Filter" class="btn btn-primary m-1 rounded">
</div>

<input type="text" name="keyword" class="form-control form-control-lg m-1" placeholder="Keyword" value="<?php if(isset($_REQUEST['keyword']) && $_REQUEST['keyword']) echo $_REQUEST['keyword']?>">

<select class="form-select form-select-lg m-1" name="country_id">
<option value="">Country</option>
<?php
$country_list = getRowsData('country_list',$con,'name','ASC');

while($country = mysqli_fetch_assoc($country_list))
{
	if(isset($_REQUEST['country_id']) && $_REQUEST['country_id'] == $country['id'])
	echo "<option value='".$country['id']."' selected='selected'>".strtoupper($country['name'])."</option>";
	else
	echo "<option value='".$country['id']."'>".strtoupper($country['name'])."</option>";
}
?>
</select>

<select class="form-select form-select-lg m-1" name="university">
<option value="">University</option>
<?php
//$get_universitylist_query = "SELECT DISTINCT university_id FROM course_list";
//$get_universitylist_result = mysqli_query($con, $get_universitylist_query);
$university_list = getRowsData('university_list',$con,'name','ASC');

while($university = mysqli_fetch_assoc($university_list))
{
	if(isset($_REQUEST['university']) && $_REQUEST['university'] == $university['id'])
	echo "<option value='".$university['university_id']."' selected='selected'>".strtoupper(getFieldValue('name','id',$university['university_id'],'university_list',$con))."</option>";
	else
	echo "<option value='".$university['university_id']."'>".strtoupper(getFieldValue('name','id',$university['university_id'],'university_list',$con))."</option>";
}
?>
</select>

<select class="form-select form-select-lg m-1" name="course">
<option value="">Course</option>
<?php
$get_courselist_query = "SELECT DISTINCT name FROM course_list";
$get_courselist_result = mysqli_query($con, $get_courselist_query);

while($course = mysqli_fetch_assoc($get_courselist_result))
{
	if(isset($_REQUEST['course']) && $_REQUEST['course'] == $course['name'])
	echo "<option value='".$course['name']."' selected='selected'>".strtoupper($course['name'])."</option>";
	else
	echo "<option value='".$course['name']."'>".strtoupper($course['name'])."</option>";
}
?>
</select>

<select class="form-select form-select-lg m-1" name="type">
<option value="">Course Type</option>
<?php
$get_typelist_query = "SELECT DISTINCT type FROM course_list";
$get_typelist_result = mysqli_query($con, $get_typelist_query);

while($course_type = mysqli_fetch_assoc($get_typelist_result))
{
	if(isset($_REQUEST['type']) && $_REQUEST['type'] == $course_type['type'])
	echo "<option value='".$course_type['type']."' selected='selected'>".strtoupper($course_type['type'])."</option>";
	else
	echo "<option value='".$course_type['type']."'>".strtoupper($course_type['type'])."</option>";
}
?>
</select>

<select class="form-select form-select-lg m-1" name="intake">
<option value="">Intake</option>
<?php
if(isset($_REQUEST['intake']) && $_REQUEST['intake'])
echo showSelectedMonthDropdown($con,$_REQUEST['intake']);
else
echo showMonthsDropdown($con);
?>
</select>

<select class="form-select form-select-lg m-1" name="eligibility">
<option value="">Min Education</option>
<?php
if(isset($_REQUEST['eligibility']) && $_REQUEST['eligibility'])
echo showSelectedEligibiltyDropdown($con,$_REQUEST['eligibility']);
else
echo showEligibiltyDropdown($con);
?>
</select>

<select class="form-select form-select-lg m-1" name="duration">
<option value="">Duration</option>
<?php
$get_durationlist_query = "SELECT DISTINCT duration FROM course_list ORDER BY duration ASC";
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

<select class="form-select form-select-lg m-1" name="fee">
<option value="">Course Fee</option>
<?php
for($i=5;$i<=50;$i+=5)
{
	$course_fee = $i * 1000;

	if(isset($_REQUEST['fee']) && $_REQUEST['fee'] == $course_fee)
	echo "<option value='".$course_fee."' selected='selected'>UPTO ".$course_fee."</option>";
	else
	echo "<option value='".$course_fee."'>UPTO ".$course_fee."</option>";

	if($i > 15)
	{
		$i += 5;
	}
}
?>
</select>

<select class="form-select form-select-lg m-1" name="scholarship_available">
<option value="">Scholarship Available</option>
<option value="1" <?php if(isset($_REQUEST['scholarship_available']) && $_REQUEST['scholarship_available'] == 1) echo 'selected'?>>Yes</option>
<option value="0" <?php if(isset($_REQUEST['scholarship_available']) && $_REQUEST['scholarship_available'] == 0) echo 'selected'?>>No</option>
</select>

</div>
<input type="hidden" name="action_perform" value="search_filter">
<input type="hidden" name="page_index" id="page_index">
</form>