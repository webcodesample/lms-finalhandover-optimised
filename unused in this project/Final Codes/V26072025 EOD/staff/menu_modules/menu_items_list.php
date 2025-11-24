<form action="add_menu_item.php" method="post">
<div class="d-flex mb-2 justify-content-center">
<input type="text" name="description" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Description" required>
<input type="text" name="submenu_id_name" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Submenu ID Name" required>
<input type="text" name="icon_name" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Icon Name" required>
<?php echo generateMenuListDropdown($con); ?>
<button type="submit" class="btn btn-sm btn-subtle-danger m-1">Add Menu Item</button>
</div>
</form>

<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>Description</th>
<th>Submenu ID Name</th>
<th>Display Icon</th>
<th>Parent Menu</th>
<th>Action</th>
</thead>

<tbody>

<?php
$i = 0;
while($menu_item = mysqli_fetch_assoc($menu_item_list))
{
	$i++;

	if(getRowCount('parent_menu_item_id',$menu_item['id'],'submenu_items',$con) == 0 && $menu_item['description'] != 'URN Management')
		$delete_icon = "<a href='delete_menu_item.php?menu_item_id=".$menu_item['id']."' class='text-decoration-none'><img class='mx-1' src='../portal-icons/delete.png' height='20px'></a>";
	else
		$delete_icon = "";

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td><a href='submenu_items.php?parent_menu=".$menu_item['id']."' class='text-decoration-none text-success'>".$menu_item['description']."</a></td>
		<td>".$menu_item['submenu_id_name']."</td>
		<td>".$menu_item['icon_name']."</td>
		<td>".getFieldValue('description','id',$menu_item['parent_menu_id'],'menu_list',$con)."</td>
		<td nowrap>
		<a href='manage_menu_item.php?menu_item_id=".$menu_item['id']."' class='text-decoration-none'><img class='mx-1' src='../portal-icons/edit.png' height='20px'></a>
		".$delete_icon."
		</td>
		</tr>";
}
?>

</tbody>
</table>