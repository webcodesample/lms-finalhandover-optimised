<form action="update_agent_bank.php" method="post">
<input type="hidden" name="agent_id" value="<?=$_REQUEST['agent_id']?>">

<table class="table table-sm table-borderless fs-9 w-auto">

<tr>
<th colspan="4">Bank Account Details</td>
</tr>

<tr>
<td class="align-middle" nowrap>Account Holder Name</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="bank_account_holder_name" id="bank_account_holder_name" value="<?=$agent['bank_account_holder_name']?>" style="width:250px;" required>
</td>
<td class="align-middle" nowrap>Account Type</td>
<td class="align-middle fw-semibold">
<?php
$sb_checked = '';
$ca_checked = '';

if($agent['bank_account_type'] == 'sb')
$sb_checked = 'checked';
else if($agent['bank_account_type'] == 'ca')
$ca_checked = 'checked';

?>
<input type="radio" name="bank_account_type" class="form-check-input m-1" value="sb" <?=$sb_checked?>>Saving
<input type="radio" name="bank_account_type" class="form-check-input m-1" value="ca" <?=$ca_checked?>>Current
</td>
</tr>

<tr>
<td class="align-top" nowrap>Bank Name</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="bank_name" id="bank_name" style="width:250px;" value="<?=$agent['bank_name']?>" required>
</td>
<td class="align-top" nowrap>Bank Address</td>
<td>
<textarea class="form-control form-control-sm m-1" name="bank_address" id="bank_address" style="width:250px; height:100px;" required><?=$agent['bank_address']?></textarea>
</td>
</tr>

<tr>
<td class="align-middle" nowrap>Account Number</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="bank_account_number" id="bank_account_number" value="<?=$agent['bank_account_number']?>" style="width:250px;" required>
</td>

<td class="align-middle" nowrap>IFSC</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="bank_ifsc" id="bank_ifsc" style="width:250px;" value="<?=$agent['bank_ifsc']?>" required>
</td>
</tr>

<tr>
<td colspan="4" align="center">
<input type="submit" class="btn btn-sm btn-primary m-3" value="Update Agent Bank">
</td>
</tr>

</table>

</form>