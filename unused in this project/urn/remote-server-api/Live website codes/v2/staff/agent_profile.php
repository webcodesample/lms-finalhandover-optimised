<form action="update_agent.php" method="post">
<input type="hidden" name="agent_id" value="<?=$_REQUEST['agent_id']?>">

<table class="table table-sm table-borderless fs-9 w-auto">

<tr>
<td class="align-middle" nowrap>Agent ID</td>
<td class="fw-bold text-danger">SA<?=$agent['id']?></td>

<td class="align-middle" nowrap>Type</td>
<td class="align-middle fw-semibold">
<input type="radio" name="type" class="form-check-input m-1" value="0" onClick="showhideCompanySection(this.value)" <?php if($agent['type'] == 0) echo 'checked'; ?>>Individual
<input type="radio" name="type" class="form-check-input m-1" value="1" onClick="showhideCompanySection(this.value)" <?php if($agent['type'] == 1) echo 'checked'; ?>>Corporate
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
<input type="text" class="form-control form-control-sm m-1" name="name" value="<?=$agent['name']?>" style="width:250px;" <?=$company_input_required?>>
</td>

<td class="align-middle" nowrap>Email</td>
<td>
<input type="email" class="form-control form-control-sm m-1" name="email" id="email" value="<?=$agent['email']?>" style="width:250px;" <?=$company_input_required?> onBlur="checkEmailUniqueness(this.id,'SA<?=$_REQUEST['agent_id']?>')">
</td>
</tr>

<tr>
<td class="align-middle" nowrap>Mobile</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="mobile" id="mobile" value="<?=$agent['mobile']?>" style="width:250px;" <?=$company_input_required?> onBlur="checkMobileUniqueness(this.id,'SA<?=$_REQUEST['agent_id']?>')">
</td>

<td class="align-middle" nowrap>WhatsApp</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="whatsapp" id="whatsapp" value="<?=$agent['whatsapp']?>" style="width:250px;" required onBlur="checkMobileUniqueness(this.id,'SA<?=$_REQUEST['agent_id']?>')">
</td>
</tr>

<tr id="company_sec_a" style="display:<?=$company_section_display?>;">
<th colspan="4">
Company Details
</td>
</tr>

<tr id="company_sec_b" style="display:<?=$company_section_display?>;">
<td class="align-middle" nowrap>Name</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="company_name" id="company_name" value="<?=$agent['company_name']?>" style="width:250px;" required <?=$company_section_input?>>
</td>

<td class="align-middle" nowrap>Website</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="company_website" id="company_website" value="<?=$agent['company_website']?>" style="width:250px;" required <?=$company_section_input?>>
</td>
</tr>

<tr id="company_sec_c" style="display:<?=$company_section_display?>;">
<td class="align-middle" nowrap>Address</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="company_address" id="company_address" value="<?=$agent['company_address']?>" style="width:250px;" required <?=$company_section_input?>>
</td>
</tr>

<th colspan="4">
Other Details
</td>
</tr>

<tr>
<td class="align-middle" nowrap>Commission %</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="comission_percent" value="<?=$agent['comission']?>" style="width:250px;" required>
</td>

<td class="align-middle" nowrap>Status</td>
<td class="align-middle fw-semibold">
<input type="radio" name="status" class="form-check-input m-1" value="1" <?php if($agent['status'] == 1) echo 'checked'; ?>>ACTIVE
<input type="radio" name="status" class="form-check-input m-1" value="0" <?php if($agent['status'] == 0) echo 'checked'; ?>>INACTIVE
</td>
</tr>

<tr>
<td colspan="4" align="center">
<input type="submit" class="btn btn-sm btn-primary m-3" value="Update Agent">
</td>
</tr>

</table>

</form>