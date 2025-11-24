<form method="post" action="update_menu.php">
<input type="hidden" name="menu_id" value="<?=$_REQUEST['menu_id']?>">
<div class="d-flex">
<input type="text" name="description" value="<?=$menu['description']?>" class="form-control form-control-sm m-1" style="width:200px;" required placeholder="Description">
<button type="submit" class="btn btn-sm btn-subtle-danger m-1">Update Menu</button>
</div>
</form>