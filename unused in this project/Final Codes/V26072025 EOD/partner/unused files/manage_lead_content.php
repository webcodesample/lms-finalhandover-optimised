<?php if(isset($updation_msg)) echo $updation_msg;?>
<?php
if(getLatestUpdate('status_id','lead_id',$_REQUEST['lead_id'],'leads_activity_history',$con) != 7)
{
?>
<form action="allocate_lead.php" method="post">
<input type="hidden" name="lead_id" value="<?=$_REQUEST['lead_id']?>">
<input type="radio" class="form-check-input" name="allocation_type" value="SP" onClick="showAllocationOption(this.value)">
<label class="form-check-label">Sales Person</label>
<input type="radio" class="form-check-input" name="allocation_type" value="SA" onClick="showAllocationOption(this.value)">
<label class="form-check-label">Sales Agent</label>
<select name="sales_person_id" id="sp" class="form-select form-select-sm m-1" style="width:200px;" required disabled>
<option value="">Sales Person</option>

<?php
//get sales person list as dropdown
$sales_person_list = getRowsData('sales_person_list',$con);

while($sales_person = mysqli_fetch_assoc($sales_person_list))
{
	echo "<option value='SP".$sales_person['id']."'>".$sales_person['name']."</option>";
}
?>

</select>

<select name="agent_id" id="sa" class="form-select form-select-sm m-1" style="width:200px;" required disabled>
<option value="">Sales Agent</option>

<?php
//get sales person list as dropdown
$agent_list = getRowsData('agent_list',$con);

while($agent = mysqli_fetch_assoc($agent_list))
{
	echo "<option value='SA".$agent['id']."'>".$agent['name']."</option>";
}
?>

</select>

<input type="button" class="btn btn-danger btn-sm rounded m-1 p-2" data-bs-dismiss="modal" value="Cancel">
<input type="submit" name="action_perform" id="assign_btn" value="Assign" class="btn btn-primary btm-sm rounded m-1 p-2" disabled>
</form>
<?php
}
else
{
	echo "<br><h6 class='text-danger'>Lead has been already closed.</h6>";
}
?>