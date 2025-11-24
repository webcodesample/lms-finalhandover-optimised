<?php if(isset($updation_msg)) echo $updation_msg;?>
<?php
if(getLatestUpdate('status_id','lead_id',$_REQUEST['lead_id'],'leads_activity_history',$con) != 7)
{
?>
<form method="post">
<select name="staff_id" class="form-select m-1" style="width:250px;" required>
<option value="">Staff</option>

<?php
//get staff list as dropdown
$query_staff_list = "SELECT * FROM staff_list";
$result_staff_list = mysqli_query($con, $query_staff_list);

while($staff = mysqli_fetch_assoc($result_staff_list))
{
	echo "<option value='".$staff['id']."'>".$staff['name']."</option>";
}
?>

</select>
<input type="button" class="btn btn-danger btn-sm rounded" data-bs-dismiss="modal" value="Cancel">
<input type="submit" name="action_perform" value="Assign Staff" class="btn btn-primary btm-sm rounded">
</form>
<?php
}
else
{
	echo "<br><h6 class='text-danger'>Lead has been already closed.</h6>";
}
?>