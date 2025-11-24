<div class="text-end">
<?=setGoBack("temp_leads.php");?>
</div>

<form method="post">
<center>
<div class="container">
<input type="hidden" name="temp_lead_id" value="<?=$_REQUEST['id']?>">
<input type="hidden" name="action_perform" value="Delete Temp Lead">
<input type="text" class="form-control form-control-sm m-1" style="width:350px;" value="<?=$temp_lead['name']?>" disabled>
<input type="text" class="form-control form-control-sm m-1" style="width:350px;" value="<?=$temp_lead['mobile']?>" disabled>
<input type="text" class="form-control form-control-sm m-1" style="width:350px;" value="<?=$temp_lead['email']?>" disabled>
<textarea name="remark" class="form-control form-control-sm m-1" style="width:350px; height:100px;" placeholder="Remark"></textarea>
<button type="submit" class="btn btn-sm btn-subtle-danger m-1">Mark AS Fake Lead</button>
</div>
</center>
</form>