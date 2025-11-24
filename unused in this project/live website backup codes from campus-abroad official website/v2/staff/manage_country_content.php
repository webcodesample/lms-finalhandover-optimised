<form action="update_country.php" method="post">
<input type="hidden" name="country_id" value="<?=$_REQUEST['country_id']?>">
<input type="text" name="country_name" placeholder="Country Name" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$country_name?>" required>
<input type="text" name="currency_name" placeholder="Country Currency" class="form-control form-control-sm m-1" style="width:200px;" value="<?=$currency_name?>" required>
<button type="submit" class="btn btn-subtle-danger btn-sm m-1">Update Country</button>
</form>
