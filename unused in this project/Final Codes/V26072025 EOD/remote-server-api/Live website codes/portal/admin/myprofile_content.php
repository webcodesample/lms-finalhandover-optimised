<form action="update_myprofile.php" method="post">

<div class="fs-9">

<div class="row">
    <label for="staticEmail" class="col-sm-1 col-form-label">Name</label>
    <div class="col-sm-11">
      <input type="text" name="name" class="form-control form-control-sm m-1" value="<?=$user['name']?>" style="width:200px;" required>
    </div>
</div>

<div class="row">
    <label for="staticEmail" class="col-sm-1 col-form-label">Email</label>
    <div class="col-sm-11">
      <input type="email" name="email" class="form-control form-control-sm m-1" value="<?=$user['email']?>" style="width:200px;" required>
    </div>
</div>

<div class="row">
    <label for="staticEmail" class="col-sm-1 col-form-label">Mobile</label>
    <div class="col-sm-11">
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