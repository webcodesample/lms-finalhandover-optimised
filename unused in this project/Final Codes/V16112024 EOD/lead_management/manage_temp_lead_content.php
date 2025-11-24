<div class="d-flex mb-3 justify-content-between">
<h5>Manage Lead</h5>
<?php setGoBack('temp_leads.php'); ?>
</div>

<?php
if(isset($_REQUEST['msg']) && $_REQUEST['msg'] == 'error')
echo "<center><h6 class='text-danger'>Data Already Exist</h6></center>";
else if(isset($_REQUEST['msg']) && $_REQUEST['msg'] == 'success')
echo "<center><h6 class='text-success'>Data Added</h6></center>";
?>

<form action="update_temp_lead.php" method="post">
<input type="hidden" name="id" value="<?=$_REQUEST['id']?>">

<div class="fs-9">

<div class="d-flex">
<div class="mt-2" style="width:50px;">
Name : 
</div>
<input type="text" name="name" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Student Name" value="<?=$temp_lead['name']?>" required>
</div>

<div class="d-flex">
<div class="mt-2" style="width:50px;">
Mobile : 
</div>
<input type="text" name="mobile" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Student Mobile" value="<?=$temp_lead['mobile']?>" required>
</div>

<div class="d-flex">
<div class="mt-2" style="width:50px;">
Email : 
</div>
<input type="text" name="email" id="email" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Student Email" value="<?=$temp_lead['email']?>" onBlur="checkEmailUniqueness(this.id)">
</div>

<div class="d-flex justify-content-center mt-3" style="width:250px;">
<input type="submit" value="Update Lead" class="btn btn-sm btn-primary">
</div>

</div>

</form>