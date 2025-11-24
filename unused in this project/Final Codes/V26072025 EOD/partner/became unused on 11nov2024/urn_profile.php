<?php
    $query_view_lead_profile = "SELECT * FROM leads_details WHERE id = '".$_REQUEST['lead_id']."'";
    $result_view_lead_profile = mysqli_query($con, $query_view_lead_profile);
    $lead = mysqli_fetch_assoc($result_view_lead_profile);

    $urn_latest_info = getLatestUpdateRow('lead_id',$_REQUEST['lead_id'],'urn_audit_history',$con);
    $student = $urn_latest_info;

    $university_id = getFieldValue('university_id','id',$lead['course_id'],'course_list',$con);
    $university = getFieldValue('name','id',$university_id,'university_list',$con);
    $country_id = getFieldValue('country_id','id',$university_id,'university_list',$con);

?>
<form id="urn_profile_form" action="update_urn_profile.php" method="post">

<table class="table table-sm table-borderless fs-9">

<?php
// display iff status is not complete, kill lead, urn rejected OR visa rejected
if($modification_possible_flag == 1 && $urn_using_by_me == 1)
{ ?>
    <tr class="mb-2">
    <td colspan="6" align="right">

    <?php
    if($callback_exist_flag == 0)
    {
        if(!in_array($current_status_description,$finalise_status_array))
            echo "<input type='button' class='btn btn-subtle-success btn-sm me-1' data-bs-toggle='modal' data-bs-target='#urnLeadCommunication' value='Communication'>";
        else if($current_status_description == 'Pending')
        {
            if(checkLoginType($_SESSION['login_type']) == 1)
            echo "<input type='button' class='btn btn-subtle-success btn-sm me-1' data-bs-toggle='modal' data-bs-target='#urnLeadCommunication' value='Communication'>";
        }
    }
    ?>

    <br><br>
    </td>
    </tr>
<?php } ?>
<tr>
<td class="pe-2">URN</td>
<td>
<input type="text" class="form-control form-control-sm fw-bold text-danger" value="CA<?=$lead['urn']?>" disabled>
</td>
<td class="pe-2 ps-5">Current Status</td>
<td>
<input type="text" class="form-control form-control-sm fw-bold text-success" value="<?=$current_status_description?>" disabled>
</td>
<td class="pe-2 ps-5">Allocated ID</td>
<td>
<input type="text" class="form-control form-control-sm fw-bold text-success" value="<?=$lead_allocation_id?>" disabled>
</td>
</tr>

<tr>
<td colspan="6" class="fw-bolder fs-8">Student Detail</td>
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
<td colspan="6" class="fw-bolder fs-8">Course Detail</td>
</tr>

<tr>
<td class="pe-2">Course</td>
<td class="d-flex">
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('name','id',$lead['course_id'],'course_list',$con)?>" disabled>
<?php
if($course_modification_flag == 1)
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
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('type','id',$lead['course_id'],'course_list',$con)?>" disabled>
</td>  
<td class="pe-2 ps-5">Course Intake</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('intake','id',$lead['course_id'],'course_list',$con)?>" disabled>
</td>
  
</tr>

<tr>
<td class="pe-2">Course Duration</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('duration','id',$lead['course_id'],'course_list',$con)?>" disabled>
</td>
<td class="ps-5 pe-2">University</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=$university?>" disabled>
</td>

<td class="pe-2 ps-5">Country</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('name','id',$country_id,'country_list',$con)?>" disabled>
<input type="hidden" value="<?=$university_id?>">
</td>
</tr>

<tr>
<td class="pe-2">Course Fee</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('fee','id',$lead['course_id'],'course_list',$con)?>" disabled>
</td>

<td class="pe-2 ps-5">Currency</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('currency','id',$country_id,'country_list',$con)?>" disabled>
</td>
<td class="ps-5 pe-2">Eligibility</td>
<td>
<input type="text" class="form-control form-control-sm" value="<?=getFieldValue('eligibility','id',$lead['course_id'],'course_list',$con)?>" disabled>
</td>
</tr>

<?php
if($urn_using_by_me == 1)
{
?>  
<tr>
<td colspan="6" align="center" class="pt-3">
<input type="submit" value="Update Profile" class="btn btn-primary btn-sm" <?=$field_visibility?>>
</td>
</tr>
<?php
}
?>
  
</table>
<input type="hidden" id="action_perform" name="action_perform" value="update_profile">
<input type="hidden" name="lead_id" value="<?=$_REQUEST['lead_id']?>">
</form>
<?php
include_once("manage_lead_modal.php");
include_once("../modal_boxes/communication/urn_communication_modal.php");
?>
  