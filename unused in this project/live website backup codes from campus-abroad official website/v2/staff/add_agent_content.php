<div class="text-end">
<?=setGoBack("agent_list.php")?>
</div>

<form action="create_agent.php" method="post">

<table class="table table-sm table-borderless fs-9 w-auto">

<tr>
<td class="align-middle" nowrap>Type</td>
<td class="align-middle fw-semibold">
<input type="radio" name="type" class="form-check-input m-1" value="0" onClick="showhideCompanySection(this.value)">Individual
<input type="radio" name="type" class="form-check-input m-1" value="1" onClick="showhideCompanySection(this.value)">Corporate
</td>
</tr>

<tr>
<th colspan="4">
Personal Details
</td>
</tr>

<tr>
<td class="align-middle" nowrap>Name</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="name" style="width:250px;" required>
</td>

<td class="align-middle" nowrap>Email</td>
<td>
<input type="email" class="form-control form-control-sm m-1" name="email" id="email" style="width:250px;" required onBlur="checkEmailUniqueness(this.id)">
</td>
</tr>

<tr>
<td class="align-middle" nowrap>Mobile</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="mobile" id="mobile" style="width:250px;" required onBlur="checkMobileUniqueness(this.id)">
</td>

<td class="align-middle" nowrap>WhatsApp</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="whatsapp" id="whatsapp" style="width:250px;" required onBlur="checkMobileUniqueness(this.id)">
</td>
</tr>

<tr id="company_sec_a">
<th colspan="4">
Company Details
</td>
</tr>

<tr id="company_sec_b">
<td class="align-middle" nowrap>Name</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="company_name" id="company_name" style="width:250px;" required>
</td>

<td class="align-middle" nowrap>Website</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="company_website" id="company_website" style="width:250px;" required>
</td>
</tr>

<tr id="company_sec_c">
<td class="align-middle" nowrap>Address</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="company_address" id="company_address" style="width:250px;" required>
</td>
</tr>

<tr>
<th colspan="4">
Bank Account Details
</td>
</tr>

<tr>
<td class="align-middle" nowrap>Account Holder Name</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="bank_account_holder_name" id="bank_account_holder_name" style="width:250px;">
</td>
<td class="align-middle" nowrap>Account Type</td>
<td class="align-middle fw-semibold">
<input type="radio" name="bank_account_type" class="form-check-input m-1" value="sb">Saving
<input type="radio" name="bank_account_type" class="form-check-input m-1" value="ca">Current
</td>
</tr>

<tr>
<td class="align-top" nowrap>Bank Name</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="bank_name" id="bank_name" style="width:250px;">
</td>
<td class="align-top" nowrap>Bank Address</td>
<td>
<textarea class="form-control form-control-sm m-1" name="bank_address" id="bank_address" style="width:250px; height:100px;"></textarea>
</td>
</tr>

<tr>
<td class="align-middle" nowrap>Account Number</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="bank_account_number" id="bank_account_number" style="width:250px;">
</td>

<td class="align-middle" nowrap>IFSC</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="bank_ifsc" id="bank_ifsc" style="width:250px;">
</td>
</tr>

<th colspan="4">
Other Details
</td>
</tr>

<tr>
<td class="align-middle" nowrap>Commission %</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="comission" style="width:250px;" required>
</td>

<td class="align-middle" nowrap>Status</td>
<td class="align-middle fw-semibold">
<input type="radio" name="status" class="form-check-input m-1" value="1">ACTIVE
<input type="radio" name="status" class="form-check-input m-1" value="0">INACTIVE
</td>
</tr>

<tr>
<td colspan="4" align="center">
<input type="submit" class="btn btn-sm btn-primary m-3" value="Add Agent">
</td>
</tr>

</table>

</form>