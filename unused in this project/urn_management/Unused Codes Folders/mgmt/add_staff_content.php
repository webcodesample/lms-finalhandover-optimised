<?=$action_perform_msg?>
<form method="post">
<select name="role_type" class="form-select form-select-sm m-1" style="width:250px;" required>
<option value="">Role Type</option>
<option value="3">Backend Staff</option>
</select>
<input type="text" name="name" class="form-control m-1" style="width:250px;" placeholder="Staff Name" required>
<input type="text" name="mobile" class="form-control m-1" style="width:250px;" placeholder="Staff Mobile Number" required>
<input type="email" name="email" class="form-control m-1" style="width:250px;" placeholder="Staff Email" required>
<input type="text" name="designation" class="form-control m-1" style="width:250px;" placeholder="Staff Designation" required>
<input type="text" name="division" class="form-control m-1" style="width:250px;" placeholder="Staff Division" required>
<div class="d-flex justify-content-center" style="width:250px;">
<input type="submit" name="action_perform" value="Add Staff" class="btn btn-primary mt-3">
</div>
</form>

<?php include_once("footer_copyright.php") ?>