<h5>Academic Details</h5>
<h6 class="text-primary mt-3 mb-2 ps-2">Highest Qualification</h6>

<form action="update_academic_details.php" method="post" enctype="multipart/form-data">
<input type="hidden" name="lead_id" value="<?=$_REQUEST['lead_id']?>">
<input type="hidden" name="action_perform" value="update_academic_details">

<input type="hidden" name="highest_education_type_old" value="<?=$student['highest_education_type']?>">
<select name="highest_education_type" class="form-select form-select-sm m-1" style="width:200px;" required>
<option value="">Education Type</option>
<option value="1" <?=setOptionSelected(1,$student['highest_education_type'])?>>Masters/PG</option>
<option value="2" <?=setOptionSelected(2,$student['highest_education_type'])?>>Bachelor/Graduate</option>
<option value="3" <?=setOptionSelected(3,$student['highest_education_type'])?>>10+2</option>
<option value="4" <?=setOptionSelected(4,$student['highest_education_type'])?>>Matric/10th</option>
</select>

<input type="text" name="highest_education_name" class="form-control form-control-sm m-1" style="width:410px;" placeholder="Degree/Certificate Rewarded" required value="<?=$student['highest_education_name']?>">
<input type="hidden" name="highest_education_name_old" value="<?=$student['highest_education_name']?>">

<div class="d-flex">
<select name="highest_education_from_year" class="form-select form-select-sm m-1" style="width:200px;" required onChange="setMinToYear(this.value)">
<option value="">From Year</option>
<?=generateYearDropdown(1990,$student['highest_education_from_year'])?>
</select>
<input type="hidden" name="highest_education_from_year_old" value="<?=$student['highest_education_from_year']?>">
<select id="highest_education_to_year" name="highest_education_to_year" class="form-select form-select-sm m-1" style="width:200px;" required>
<option value="">To Year</option>
<?php
if($student['highest_education_from_year'] > 0)
echo generateYearDropdown($student['highest_education_from_year']+1,$student['highest_education_to_year']);
?>
</select>
<input type="hidden" name="highest_education_to_year_old" value="<?=$student['highest_education_to_year']?>">
</div>

<input type="text" name="highest_education_institution" class="form-control form-control-sm m-1" style="width:410px;" placeholder="University/Board Name" required value="<?=$student['highest_education_institution']?>">
<input type="hidden" name="highest_education_institution_old" value="<?=$student['highest_education_institution']?>">

<div class="d-flex">
<input type="text" name="highest_education_institution_city" class="form-control form-control-sm m-1" style="width:200px;" placeholder="University/Board City" required value="<?=$student['highest_education_institution_city']?>">
<input type="hidden" name="highest_education_institution_city_old" value="<?=$student['highest_education_institution_city']?>">
<input type="text" name="highest_education_institution_country" class="form-control form-control-sm m-1" style="width:200px;" placeholder="University/Board Country" required value="<?=$student['highest_education_institution_country']?>">
<input type="hidden" name="highest_education_institution_country_old" value="<?=$student['highest_education_institution_country']?>">
</div>

<input type="file" name="highest_education_proof" class="form-control form-control-sm m-1" style="width:410px;" accept=".jpg,.jpeg,.pdf">

<h6 class="text-primary mt-5 mb-2 ps-2">Additional Tests</h6>

<div class="d-flex mb-2">
<span class="px-2 fs-9 mt-1">Have you taken any test?</span>
<?php
if($student['test_taken_flag'] == 1)
{
	$no_flag = "";
	$yes_flag = "checked";
	$test_section_display_class = "";
}
else 
{
	$no_flag = "checked";
	$yes_flag = "";
	$test_section_display_class = "d-none";
}
?>
<input type="radio" class="form-check-input form-check-input-sm m-1" name="test_taken_flag" value="0" onClick="toggleTestOptions(this.value)" <?=$no_flag?>><span class="text-danger m-1 fs-9">NO</span>
<input type="radio" class="form-check-input form-check-input-sm m-1" name="test_taken_flag" value="1" onClick="toggleTestOptions(this.value)" <?=$yes_flag?>><span class="text-success m-1 fs-9">YES</span>
<input type="hidden" name="test_taken_flag_old" value="<?=$student['test_taken_flag']?>">
</div>

<div id="new" class="ps-2 <?=$test_section_display_class?>">
<?php
$test_taken_name_array = explode(',',$student['test_name']);
//get pre defined test list from database
$predefined_test_name_array = [];
$predefined_test_list = getRowsData('predefined_test_list',$con);
while($predefined_test = mysqli_fetch_assoc($predefined_test_list))
{
    array_push($predefined_test_name_array, $predefined_test);
}
for($i=0;$i<count($predefined_test_name_array);$i++)
{
	if(in_array($predefined_test_name_array[$i]['name'],$test_taken_name_array))
	echo "<div class='d-flex'><div style='width:100px;' class='mt-2'><input type='checkbox' name='test_name[]' id='".$predefined_test_name_array[$i]['name']."' class='form-check-input mx-1' value='".$predefined_test_name_array[$i]['name']."' checked onClick='showVal(this.id)'><span class='mt-3 fs-9'>".$predefined_test_name_array[$i]['name']."</span></div><input type='file' name='".$predefined_test_name_array[$i]['name']."_proof' id='".$predefined_test_name_array[$i]['name']."_proof' class='form-control form-control-sm m-1' style='width:300px;'></div>";
	else
	echo "<div class='d-flex'><div style='width:100px;' class='mt-2'><input type='checkbox' name='test_name[]' id='".$predefined_test_name_array[$i]['name']."' class='form-check-input mx-1' value='".$predefined_test_name_array[$i]['name']."' onClick='showVal(this.id)'><span class='mt-3 fs-9'>".$predefined_test_name_array[$i]['name']."</span></div><input type='file' name='".$predefined_test_name_array[$i]['name']."_proof' id='".$predefined_test_name_array[$i]['name']."_proof' class='form-control form-control-sm m-1' style='width:300px;' disabled></div>";
}

if($student['other_test_name'])
{
	$other_test_name_array = explode(',',$student['other_test_name']);
	$existing_other_test_inputs = "";
	$i=0;
	foreach($other_test_name_array as $other_test_name)
	{
		$i++;

		$existing_other_test_inputs .= "<div class='d-flex'>
		<input type='text' id='existing_other_test_name".$i."' name='other_test_name[]' class='form-control form-control-sm me-1 my-1' style='width:200px;' placeholder='Test Name' value='".$other_test_name."' onBlur='toggleInput(this.id)'>
		<input type='file' id='existing_other_test_name".$i."_proof' name='other_test_proof[]' class='form-control form-control-sm me-1 my-1' style='width:200px;'>
		</div>";
	}

	$other_test_checkbox_status = "checked";
	$add_other_icon_class = "";
}
else
{
	$other_test_checkbox_status = "";
	$add_other_icon_class = "d-none";
}
?>
<div class="d-flex" style="width:150px;">
<input type="checkbox" id="others_test" class="form-check-input mx-1" onClick="showOthers(this.id)" <?=$other_test_checkbox_status?>>
<span class="fs-9 mt-1">OTHERS</span>
<span id="add_other" class="text-danger m-1 <?=$add_other_icon_class?>" data-feather="plus-square" style="height: 15px; width: 15px;" onClick="addOtherTestInput()"></span>
</div>

<?php
if($student['other_test_name'])
echo $existing_other_test_inputs;
?>
<div id="other_test_inputs">
</div>

<input type="hidden" name="other_test_name_old" value="<?=$student['other_test_name']?>">
</div>

</form>

<script src="../js/academicDetails.js"></script>