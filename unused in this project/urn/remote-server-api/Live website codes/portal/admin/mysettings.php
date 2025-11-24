<?php
include_once("common_include.php");

$where_con_array = [
					'ref_id' => $_SESSION['staff_ref_id'],
					];
$login_detial = mysqli_fetch_assoc(getRowsDataCon('login_detail',$where_con_array,$con));

?>
<form action="update_mysettings.php" method="post">
<div class="fs-9">

<div class="row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Username</label>
    <div class="col-sm-10">
      <input type="text" class="form-control form-control-sm m-1" name="username" value="<?=$login_detial['username']?>" style="width:200px;" disabled>
    </div>
</div>

<div class="row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Current Password</label>
    <div class="col-sm-10">
      <input type="password" class="form-control form-control-sm m-1" name="password" value="<?=$login_detial['password']?>" style="width:200px;" required>
    </div>
</div>

<div class="row">
    <label for="staticEmail" name="new_password" class="col-sm-2 col-form-label">New Password</label>
    <div class="col-sm-10">
      <input type="password" name="new_password" class="form-control form-control-sm m-1" placeholder="New Password" style="width:200px;" minlength="5" required>
    </div>
</div>

<div class="row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Confirm Password</label>
    <div class="col-sm-10">
      <input type="password" name="confirm_password" class="form-control form-control-sm m-1" placeholder="Confirm Password" style="width:200px;" minlength="5" required>
    </div>
</div>

<div class="row">
    <div class="col-sm-4">
        <center>
            <button type="submit" class="btn btn-primary btn-sm mt-3">Update Password</button>
        </center>
    </div>
</div>

</div>
</form>