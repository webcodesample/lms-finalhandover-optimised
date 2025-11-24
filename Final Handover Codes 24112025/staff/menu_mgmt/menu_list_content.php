<form action="add_menu.php" method="post">
<div class="d-flex mb-2 justify-content-center">
<input type="text" name="description" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Description" required>
<button type="submit" class="btn btn-sm btn-subtle-danger m-1">Add Menu</button>
</div>
</form>

<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>Description</th>
<th>Action</th>
</thead>

<tbody>

<?php
$i = 0;
while($menu = mysqli_fetch_assoc($menu_list))
{
	$i++;

	if(getRowCount('parent_menu_id',$menu['id'],'menu_items',$con) == 0)
		$delete_icon = "<a href='delete_menu.php?menu_id=".$menu['id']."' class='text-decoration-none'><img class='mx-1' src='../portal-icons/delete.png' height='20px'></a>";
	else
		$delete_icon = "";

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td><a href='menu_items.php?parent_menu=".$menu['id']."' class='text-decoration-none text-success'>".$menu['description']."</a></td>
		<td nowrap>
		<a href='manage_menu.php?menu_id=".$menu['id']."' class='text-decoration-none'><img class='mx-1' src='../portal-icons/edit.png' height='20px'></a>
		".$delete_icon."
		</td>
		</tr>";
}
?>

</tbody>
</table>

<?php include_once("footer_copyright.php") ?>