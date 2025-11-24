<?=$action_perform_msg?>

<div class="text-end">
<?=setGoBack("staff_list.php")?>
</div>

<form method="post">
<select name="role_type" class="form-select form-select-sm m-1" style="width:250px;" required>
<option value="">Role Type</option>
<?php
if($_SESSION['login_type'] == 1 || $_SESSION['login_type'] == 7)
echo "<option value='8'>Management</option>";
?>
<option value="3">Backend Staff</option>
</select>
<input type="text" name="name" class="form-control m-1" style="width:250px;" placeholder="Staff Name" required>
<input type="text" name="mobile" id="mobile" class="form-control m-1" style="width:250px;" placeholder="Staff Mobile Number" required onBlur="checkMobileUniqueness(this.id)">
<input type="email" name="email" id="email" class="form-control m-1" style="width:250px;" placeholder="Staff Email" required onBlur="checkEmailUniqueness(this.id)">
<input type="text" name="designation" class="form-control m-1" style="width:250px;" placeholder="Staff Designation" required>
<input type="text" name="division" class="form-control m-1" style="width:250px;" placeholder="Staff Division" required>
<h6 class="my-2 mx-1">Authorisation</h6>
<?php
showAuthorizationOption($con);
?>

<div class="d-flex justify-content-center" style="width:250px;">
<input type="submit" name="action_perform" value="Add Staff" class="btn btn-primary mt-3">
</div>
</form>

<?php include_once("footer_copyright.php") ?>