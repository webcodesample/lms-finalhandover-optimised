<div class="text-end mb-3">
<?php setGoBack("submenu_items.php"); ?>
</div>

<form action="update_submenu_item.php" method="post">
<input type="hidden" name="submenu_item_id" value="<?=$_REQUEST['submenu_item_id']?>">
<div class="d-flex mb-2 justify-content-center">
<input type="text" name="description" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Description" required value="<?=$submenu_item['description']?>">
<input type="text" name="href_link" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Linked Script" required value="<?=$submenu_item['href_link']?>">
<select class="form-select form-select-sm m-1" name="parent_menu_item_id" style="width:210px;" required>
<option value="">Select Parent Menu Item</option>
<?php
$parent_menu_id = getFieldValue('parent_menu_id','id',$submenu_item['parent_menu_item_id'],'menu_items',$con);
$where_con_array = [ 'parent_menu_id' => $parent_menu_id,];
$menu_item_list = getRowsDataCon('menu_items',$where_con_array,$con);
while($menu_item = mysqli_fetch_assoc($menu_item_list))
{
	if($submenu_item['parent_menu_item_id'] == $menu_item['id'])
	echo "<option value='".$menu_item['id']."' selected>".$menu_item['description']."</option>";
	else
	echo "<option value='".$menu_item['id']."'>".$menu_item['description']."</option>";
}
?>
</select>
<button type="submit" class="btn btn-sm btn-subtle-danger m-1">Update Submenu Item</button>
</div>
</form>