<?=$action_perform_msg?>
<div class="d-flex justify-content-end">
<?php setGoBack("staff_list.php"); ?>
</div>

<form method="post">
<input type="text" name="name" class="form-control m-1" style="width:250px;" placeholder="Staff Name" required value="<?=$staff['name']?>">
<input type="text" name="mobile" class="form-control m-1" style="width:250px;" placeholder="Staff Mobile Number" required value="<?=$staff['mobile']?>">
<input type="email" name="email" class="form-control m-1" style="width:250px;" placeholder="Staff Email" required value="<?=$staff['email']?>">
<input type="text" name="designation" class="form-control m-1" style="width:250px;" placeholder="Staff Designation" required value="<?=$staff['designation']?>">
<input type="text" name="division" class="form-control m-1" style="width:250px;" placeholder="Staff Division" required value="<?=$staff['division']?>">
<div class="d-flex justify-content-center" style="width:250px;">
<input type="submit" name="action_perform" value="Update Staff" class="btn btn-primary mt-3">
</div>
</form>

<?php include_once("footer_copyright.php") ?>