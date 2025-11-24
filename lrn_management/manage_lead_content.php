<?php if(isset($updation_msg)) echo $updation_msg;?>

<form action="allocate_lead.php" method="post">
<input type="hidden" name="lrn" value="<?=$_REQUEST['lrn']?>">
<select name="staff_id" id="bs" class="form-select form-select-sm m-1" style="width:200px;" required>
<option value="">Staff</option>

<?php
//get sales person list as dropdown
$staff_list = getRowsData('staff_list',$con);

while($staff = mysqli_fetch_assoc($staff_list))
{
	echo "<option value='BS".$staff['id']."'>".$staff['name']."</option>";
}
?>

</select>


<input type="button" class="btn btn-danger btn-sm rounded m-1 p-2" data-bs-dismiss="modal" value="Cancel">
<input type="submit" name="action_perform" id="assign_btn" value="Assign" class="btn btn-primary btm-sm rounded m-1 p-2" disabled>
</form>