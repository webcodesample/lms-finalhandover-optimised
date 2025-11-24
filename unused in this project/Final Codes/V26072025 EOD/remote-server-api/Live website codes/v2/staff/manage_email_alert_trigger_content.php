<div class="d-flex justify-content-between">
<h5>Update Email Alert</h5>
<?php setGoBack("email_alerts_settings.php") ?>
</div>

<form action="update_email_alert.php" method="post">
<input type="hidden" name="trigger_id" value="<?=$email_alert['id']?>">

<div class="d-flex">
<input type="text" name="trigger_type" placeholder="Email Alert Type" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$email_alert['email_trigger_type']?>" required>
<input type="email" name="from_email" placeholder="Sender/From Email" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$email_alert['from_email']?>" required>
</div>

<?php
$to_emails = explode(',',$email_alert['to_emails']);

for($i=0;$i<count($to_emails);$i++)
{
	if($i == 0)
	{
		echo "<div class='d-flex'>
			<input type='email' name='to_email[]' placeholder='Recipient/To Email' class='form-control form-control-sm m-1' style='width:200px;' value='".$to_emails[$i]."' required>
			<a class='link-danger m-2 fw-bold' onClick='addEmailRecipient()'>
			<span data-feather='user-plus'></span>
			</a>
			</div>";
	}
	else
	{
		echo "<div id='to_email_".$i."' class='d-flex'>
			<input type='email' name='to_email[]' placeholder='Recipient/To Email' class='form-control form-control-sm m-1' style='width:200px;' value='".$to_emails[$i]."' required>
			<a href='#' class='m-2' onClick='removeEmailRecipient(&quot;to_email_".$i."&quot;)'>
			<img src='../portal-icons/delete.png' height='20px'>
			</a>
			</div>";
	}
}
?>

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
<?php displayActionPerformCheckboxesSelected($con)?>
</div>

<input type="hidden" id="recipient_counter" value="<?=count($to_emails)-1?>">
<button type="submit" class="btn btn-sm btn-primary m-1">
Update Email Alert
</button>

</form>

<script>
$(document).ready(countCheckboxChecked);
</script>