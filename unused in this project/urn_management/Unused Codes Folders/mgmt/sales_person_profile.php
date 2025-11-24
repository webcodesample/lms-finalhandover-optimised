<form action="update_sales_person.php" method="post">
<input type="hidden" name="sales_person_id" value="<?=$_REQUEST['sales_person_id']?>">

<table class="table table-sm table-borderless fs-9 w-auto">

<tr>
<td class="align-middle" nowrap>Sales Person ID</td>
<td class="fw-bold text-danger">SP<?=(100+$sales_person['id'])?></td>

<tr>
<th colspan="4">
Personal Details
</td>
</tr>

<tr>
<td class="align-middle" nowrap>Name</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="name" value="<?=$sales_person['name']?>" style="width:250px;" required>
</td>

<td class="align-middle" nowrap>Email</td>
<td>
<input type="email" class="form-control form-control-sm m-1" name="email" value="<?=$sales_person['email']?>" style="width:250px;" required>
</td>
</tr>

<tr>
<td class="align-middle" nowrap>Mobile</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="mobile" value="<?=$sales_person['mobile']?>" style="width:250px;" required>
</td>

<td class="align-middle" nowrap>WhatsApp</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="whatsapp" value="<?=$sales_person['whatsapp']?>" style="width:250px;" required>
</td>
</tr>

<tr>
<th colspan="4">
Other Details
</td>
</tr>

<tr>
<td class="align-middle" nowrap>Comission %</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="comission_percent" value="<?=$sales_person['comission']?>" style="width:250px;" required>
</td>

<td class="align-middle" nowrap>Salary</td>
<td>
<input type="text" class="form-control form-control-sm m-1" name="salary" value="<?=$sales_person['salary']?>" style="width:250px;" required>
</td>
</tr>

<tr>

<td class="align-middle" nowrap>Status</td>
<td class="align-middle fw-semibold">
<input type="radio" name="status" class="form-check-input m-1" value="1" <?php if($sales_person['status'] == 1) echo 'checked'; ?>>ACTIVE
<input type="radio" name="status" class="form-check-input m-1" value="0" <?php if($sales_person['status'] == 0) echo 'checked'; ?>>INACTIVE
</td>
</tr>

<tr>
<td colspan="4" align="center">
<input type="submit" class="btn btn-sm btn-primary m-3" value="Update Sales Person">
</td>
</tr>

</table>

</form>