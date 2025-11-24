<form action="update_mybank.php" method="post" enctype="multipart/form-data">

<div class="fs-9">

<div class="row mt-3">
    <label for="staticEmail" class="col-sm-2 col-form-label">Account Holder Name</label>
    <div class="col-sm-10">
      <input type="text" name="bank_account_holder_name" class="form-control form-control-sm m-1" value="<?=$user['bank_account_holder_name']?>" style="width:250px;" required>
    </div>
</div>

<div class="row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Bank Name</label>
    <div class="col-sm-10">
      <input type="text" name="bank_name" class="form-control form-control-sm m-1" value="<?=$user['bank_name']?>" style="width:250px;" required>
    </div>
</div>

<div class="row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Bank Address</label>
    <div class="col-sm-10">
      <textarea name="bank_address" class="form-control form-control-sm m-1" style="width:250px;height:100px;" required><?=$user['bank_address']?></textarea>
    </div>
</div>

<div class="row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Account Number</label>
    <div class="col-sm-10">
      <input type="text" name="bank_account_number" class="form-control form-control-sm m-1" value="<?=$user['bank_account_number']?>" style="width:250px;" required>
    </div>
</div>

<div class="row">
    <label for="staticEmail" class="col-sm-2 col-form-label">IFSC</label>
    <div class="col-sm-10">
      <input type="text" name="bank_ifsc" class="form-control form-control-sm m-1" value="<?=$user['bank_ifsc']?>" style="width:250px;" required>
    </div>
</div>

<div class="row">
    <label for="staticEmail" class="col-sm-2 col-form-label">Account Type</label>
    <div class="col-sm-10 mt-2">
        <?php
        $sb_checked = '';
        $ca_checked = '';

        if($user['bank_account_type'] == 'sb')
        $sb_checked = 'checked';
        else if($user['bank_account_type'] == 'ca')
        $ca_checked = 'checked';

        ?>
        <input type="radio" name="bank_account_type" class="form-check-input m-1" value="sb" <?=$sb_checked?>>Saving
        <input type="radio" name="bank_account_type" class="form-check-input m-1" value="ca" <?=$ca_checked?>>Current
    </div>
</div>

<div class="row">
<div class="col-sm-5">
<center>
<button type="submit" class="btn btn-primary btn-sm mt-3">Update Bank</button>
</center>
</div>
</div>

</div>
</form>