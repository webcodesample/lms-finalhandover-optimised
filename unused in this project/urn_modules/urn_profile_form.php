<?php
if($urn_using_by_me)
{
    $form_start = "<form id='urn_profile_form' action='update_urn_profile.php' method='post'>";
    $form_end = "<input type='hidden' name='action_perform' id='action_perform' value='update_profile'>
                <input type='hidden' name='lead_id' value='".$_REQUEST['lead_id']."'>
                </form>";
}
else
{
    $form_start = "";
    $form_end = "";
}
?>

<?=$form_start?>
<table class="table table-sm table-borderless fs-9">

<?php
if(isset($modification_possible_flag) && $modification_possible_flag == 1 && $urn_using_by_me == 1)
include_once("urn_ops_btns.php");
?>

<tr>
<td class="pe-2">URN</td>
<td>
<input type="text" class="form-control form-control-sm fw-bold text-danger" value="CA<?=$lead['urn']?>" disabled>
</td>
<td class="pe-2 ps-5">Current Status</td>
<td>
<input type="text" class="form-control form-control-sm fw-bold text-success" value="<?=$current_status_description?>" disabled>
</td>
<?php if(in_array($_SESSION['login_type'],array(1,2,3,8))){ ?>
<td class="pe-2 ps-5">Allocated ID</td>
<td>
<input type="text" class="form-control form-control-sm fw-bold text-success" value="<?=$lead_allocation_id?>" disabled>
</td>
<?php } ?>
</tr>

<tr>
<td class="pe-2">Name</td>
<td>
<input type="text" class="form-control form-control-sm" name="student_name" value="<?=$student['student_name']?>" required <?=$field_visibility?>>
<input type="hidden" name="student_name_old" value="<?=$student['student_name']?>">
</td>
<td class="pe-2 ps-5">Mobile</td>
<td>
<input type="text" class="form-control form-control-sm" name="student_mobile" value="<?=$student['student_mobile']?>" required <?=$field_visibility?>>
<input type="hidden" name="student_mobile_old" value="<?=$student['student_mobile']?>">
</td>
<td class="pe-2 ps-5">Email</td>
<td>
<input type="email" class="form-control form-control-sm" name="student_email" value="<?=$student['student_email']?>" readonly <?=$field_visibility?>>
<input type="hidden" name="student_email_old" value="<?=$student['student_email']?>">
</td>
<td colspan="4"></td>
</tr>

<tr>
<td class="pe-2">Mobile (Alt)</td>
<td>
<input type="text" class="form-control form-control-sm" name="student_mobile_alt" value="<?=$student['student_mobile_alt']?>" <?=$field_visibility?>>
<input type="hidden" name="student_mobile_alt_old" value="<?=$student['student_mobile_alt']?>">
</td>
<td class="pe-2 ps-5">Date of Birth</td>
<td>
<input type="date" class="form-control form-control-sm" name="student_dob" value="<?=date('Y-m-d',$student['student_dob'])?>" required <?=$field_visibility?>>
<input type="hidden" name="student_dob_old" value="<?=date('Y-m-d',$student['student_dob'])?>">
</td>
</tr>

<tr>
<td class="pe-2">Address</td>
<td>
<textarea class="form-control form-control-sm" name="student_address" placeholder="Address" <?=$field_visibility?> style="height:100px;" required><?=$student['student_address']?></textarea>
<input type="hidden" name="student_address_old" value="<?=$student['student_address']?>">
</td>
<td class="pe-2 ps-5">Brief Note</td>
<td>
<textarea class="form-control form-control-sm" name="student_brief_note" placeholder="Brief Note" style="height:100px;" <?=$field_visibility?>><?=$student['student_brief_note']?></textarea>
<input type="hidden" name="student_brief_note_old" value="<?=$student['student_brief_note']?>">
</td>
<td colspan="2" class="ps-5">
<textarea class="form-control form-control-sm" name="updation_remark" placeholder="Profile Updation Remark" required  <?=$field_visibility?> style="height:100px;"></textarea>
</td>
</tr>


<tr>
<td class="pe-2">Course</td>
<td class="d-flex">
<input type="text" class="form-control form-control-sm" value="<?=$course_name?>" disabled>
<?php
if(isset($course_modification_flag) && $course_modification_flag == 1 && $urn_using_by_me == 1)
{
?>
<a href="urn_course_selection.php?lead_id=<?=$_REQUEST['lead_id']?>&course_id=<?=$lead['course_id']?>">
<img src="../portal-icons/edit_black.png" width="20px">
</a>
<?php
}
?>
</td>  
<td class="pe-2 ps-5">Course Type</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$course_type?>" disabled>
</td>  
<td class="pe-2 ps-5">Course Intake</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$course_intake?>" disabled>
</td>
  
</tr>

<tr>
<td class="pe-2">Course Duration</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$course_duration?>" disabled>
</td>
<td class="ps-5 pe-2">University</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$university?>" disabled>
</td>

<td class="pe-2 ps-5">Country</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$country_name?>" disabled>
<input type="hidden" value="<?=$university_id?>">
</td>
</tr>

<tr>
<td class="pe-2">Course Fee</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$course_fee?>" disabled>
</td>

<td class="pe-2 ps-5">Currency</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$currency?>" disabled>
</td>
<td class="ps-5 pe-2">Eligibility</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$course_eligibility?>" disabled>
</td>
</tr>
  
<tr>
<td colspan="6" align="center" class="pt-3">
<input type="submit" value="Update Profile" class="btn btn-primary btn-sm <?=setBtnVisibilityClass($urn_using_by_me)?>" <?=$field_visibility?>>
<?php if(in_array($_SESSION['login_type'],array(1,2,3,7,8))) {?>
<input type="button" class="btn btn-primary btn-sm <?=setBtnVisibilityClass($urn_using_by_me)?>" data-bs-toggle="modal" data-bs-target="#staticBackdrop" value="Move to Next Status" <?=$update_status_btn?>>
<?php } ?>
</td>
</tr>

</table>
<?=$form_end?>