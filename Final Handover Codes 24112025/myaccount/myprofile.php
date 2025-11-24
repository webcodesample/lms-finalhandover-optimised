<form action="update_myprofile.php" method="post" enctype="multipart/form-data">

<div class="fs-9">

<div class="row mb-3">
    <label for="staticEmail" class="col-sm-2 col-form-label">Old Profile Pic</label>
    <div class="col-sm-10">
        <img class="rounded-circle border border-primary" src="<?=getProfilePic($_SESSION['user_ref_id'])?>" height="70px" width="70px">
    </div>
</div>

<div class="row">
    <label for="staticEmail" class="col-sm-2 col-form-label">New Profile Pic</label>
    <div class="col-sm-10">
      <input type="file" name="profile_pic" class="form-control form-control-sm m-1" style="width:200px;" accept=".jpg,.jpeg">
    </div>
</div>

<div class="row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Name</label>
    <div class="col-sm-10">
      <input type="text" name="name" class="form-control form-control-sm m-1" value="<?=$user['name']?>" style="width:200px;" required>
    </div>
</div>

<div class="row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
    <div class="col-sm-10">
      <input type="email" name="email" id="email" class="form-control form-control-sm m-1" value="<?=$user['email']?>" style="width:200px;" required onBlur="checkEmailUniqueness(this.id,'<?=$_SESSION['user_ref_id']?>')">
    </div>
</div>

<div class="row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Mobile</label>
    <div class="col-sm-10">
      <input type="text" name="mobile" class="form-control form-control-sm m-1" value="<?=$user['mobile']?>" style="width:200px;" required minlength="10">
    </div>
</div>

<div class="row">
<div class="col-sm-3">
<center>
<button type="submit" class="btn btn-primary btn-sm mt-3">Update Profile</button>
</center>
</div>
</div>

</div>
</form>
