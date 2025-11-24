<div class="card mt-5">
<div class="card-body">


<form id="search_form" method="post">
<div style="width:300px;">

<div class="d-flex justify-content-center">
<input type="button" value="Clear Filter" class="btn btn-sm btn-outline-secondary m-1 rounded" onClick="clearFilter();enableSearchBtn();">
<input type="submit" id="search_btn" value="Apply Filter" class="btn btn-sm btn-primary m-1 rounded" <?=$search_btn_disable_flag?>>
</div>

<input type="text" name="keyword" id="keyword" class="form-control form-control-sm m-1" placeholder="Keyword" value="<?php if(isset($_REQUEST['keyword']) && $_REQUEST['keyword']) echo $_REQUEST['keyword']?>" onBlur="enableSearchBtn()">

<select class="form-select form-select-sm m-1" name="country_id" id="country" onChange="getUniversityList();getCourseList('');enableSearchBtn();">
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

<select class="form-select form-select-sm m-1" name="university" id="university" onChange="getCourseList();enableSearchBtn();">
<option value="">University</option>
<?php
if(isset($_REQUEST['country_id']) && $_REQUEST['country_id'])
{
	//load university options list as per requested country
	$where_con_array = [ 'country_id' => $_REQUEST['country_id']];
	$orderby_clause = "ORDER BY name ASC";
	$university_list = getRowsDataCon('university_list',$where_con_array,$con,$orderby_clause);
}
else
$university_list = getRowsData('university_list',$con,'name','ASC');

while($university = mysqli_fetch_assoc($university_list))
{
	if(isset($_REQUEST['university']) && $_REQUEST['university'] == $university['id'])
	echo "<option value='".$university['id']."' selected='selected'>".strtoupper($university['name'])."</option>";
	else
	echo "<option value='".$university['id']."'>".strtoupper($university['name'])."</option>";
}
?>
</select>

<select class="form-select form-select-sm m-1" name="course" id="course" onChange="enableSearchBtn()">
<option value="">Course</option>
<?php
if(isset($_REQUEST['university']) && $_REQUEST['university'])
{
	//load course options list as per requested university
	$where_con_array = [ 'university_id' => $_REQUEST['university']];
	$orderby_clause = "ORDER BY name ASC";
	$course_list = getRowsDataCon('course_list',$where_con_array,$con,$orderby_clause);
}
else
$course_list = getRowsData('course_list',$con,'name','ASC');

while($course = mysqli_fetch_assoc($course_list))
{
	if(isset($_REQUEST['course']) && $_REQUEST['course'] == $course['name'])
	echo "<option value='".$course['name']."' selected='selected'>".strtoupper($course['name'])."</option>";
	else
	echo "<option value='".$course['name']."'>".strtoupper($course['name'])."</option>";
}
?>
</select>

<select class="form-select form-select-sm m-1" name="type" id="type" onChange="enableSearchBtn()">
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

<select class="form-select form-select-sm m-1" name="intake" id="intake" onChange="enableSearchBtn()">
<option value="">Intake</option>
<?php
if(isset($_REQUEST['intake']) && $_REQUEST['intake'])
echo showSelectedMonthDropdown($con,$_REQUEST['intake']);
else
echo showMonthsDropdown($con);
?>
</select>

<select class="form-select form-select-sm m-1" name="eligibility" id="eligibility" onChange="enableSearchBtn()">
<option value="">Min Education</option>
<?php
if(isset($_REQUEST['eligibility']) && $_REQUEST['eligibility'])
echo showSelectedEligibiltyDropdown($con,$_REQUEST['eligibility']);
else
echo showEligibiltyDropdown($con);
?>
</select>

<select class="form-select form-select-sm m-1" name="duration" id="duration" onChange="enableSearchBtn()">
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

<select class="form-select form-select-sm m-1" name="fee" id="fee" onChange="enableSearchBtn()">
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

<select class="form-select form-select-sm m-1" name="scholarship_available" id="scholarship_available" onChange="enableSearchBtn()">
<option value="">Scholarship Available</option>
<option value="1" <?php if(isset($_REQUEST['scholarship_available']) && $_REQUEST['scholarship_available'] == 1) echo 'selected'?>>Yes</option>
<option value="0" <?php if(isset($_REQUEST['scholarship_available']) && $_REQUEST['scholarship_available'] == 0) echo 'selected'?>>No</option>
</select>

</div>
<input type="hidden" name="action_perform" value="search_filter">
<input type="hidden" name="page_index" id="page_index">
<input type="hidden" id="input_counter" value="0">
</form>


</div>
</div>

<script src="../js/course_finder.js"></script>