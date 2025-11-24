<form action="create_email_alert.php" method="post">
<div class="d-flex justify-content-between">
<h5>Add New Email Alert</h5>
<?php setGoBack("email_alerts_settings.php") ?>
</div>

<div class="d-flex">
<input type="text" name="trigger_type" placeholder="Email Alert Type" class="form-control form-control-sm m-1" style="width:200px;" required>
<input type="email" name="from_email" placeholder="Sender/From Email" class="form-control form-control-sm m-1" style="width:200px;" required>
</div>

<div class="d-flex">
<input type="email" name="to_email[]" placeholder="Recipient/To Email" class="form-control form-control-sm m-1" style="width:200px;" required>
<a class="btn btn-sm btn-subtle-danger m-1 px-2 pt-2 fw-bolder" onClick="addEmailRecipient()">
<span data-feather="user-plus"></span>
</a>
</div>

<div id="recipient">
</div>

<div class="d-flex">
<h6 class="mt-3 m-1">Linked Action</h6>
<div class="d-flex mt-2">
<input type="checkbox" class="form-check-input m-1" name="checkAll" id="checkAll" onClick="selectAll(this.checked)">
<span class="text-primary m-1 fs-9">All</span>
</div>
</div>

<div class="d-flex flex-wrap mb-3">
<?php displayActionPerformCheckboxes($con)?>
</div>

<button type="submit" class="btn btn-sm btn-primary m-1">
Add Email Alert
</button>

</form>