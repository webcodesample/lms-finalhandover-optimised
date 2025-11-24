<div class="text-end mb-3">
<?php setGoBack("menu_items.php"); ?>
</div>

<form action="update_menu_item.php" method="post">
<input type="hidden" name="menu_item_id" value="<?=$_REQUEST['menu_item_id']?>">
<div class="d-flex mb-2 justify-content-center">
<input type="text" name="description" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Description" required value="<?=$menu_item['description']?>">
<input type="text" name="submenu_id_name" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Submenu ID Name" required value="<?=$menu_item['submenu_id_name']?>">
<input type="text" name="icon_name" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Icon Name" required value="<?=$menu_item['icon_name']?>">
<input type="text" class="form-control form-control-sm m-1" style="width:150px;" value="<?=getFieldValue('description','id',$menu_item['parent_menu_id'],'menu_list',$con)?>" disabled>
<button type="submit" class="btn btn-sm btn-subtle-danger m-1">Update Menu Item</button>
</div>
</form>