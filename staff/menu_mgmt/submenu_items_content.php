<div class="text-end mb-2">
<?php
if($goBackOption)
setGoBack("menu_items.php");
?>
</div>

<form action="add_submenu_item.php" method="post">
<div class="d-flex mb-2 justify-content-center">
<input type="text" name="description" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Description" required>
<input type="text" name="href_link" class="form-control form-control-sm m-1" style="width:200px;" placeholder="Linked Script" required>
<?=generateMenuListDropdown($con)?>
<select class="form-select form-select-sm m-1" name="parent_menu_item_id" id="parent_menu_item_id" style="width:210px;" required disabled>
<option value="">Select Parent Menu Item</option>

</select>
<button type="submit" id="btn_submit" class="btn btn-sm btn-subtle-danger m-1" disabled>Add Submenu Item</button>
</div>
</form>

<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>Description</th>
<th>Linked Script</th>
<th>Parent Menu Item</th>
<th>Parent Menu</th>
<th>Action</th>
</thead>

<tbody>

<?php
$i = 0;
while($submenu_item = mysqli_fetch_assoc($submenu_item_list))
{
	$i++;
	$parent_menu_id = getFieldValue('parent_menu_id','id',$submenu_item['parent_menu_item_id'],'menu_items',$con);

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>".$submenu_item['description']."</td>
		<td>".$submenu_item['href_link']."</td>
		<td>".getFieldValue('description','id',$submenu_item['parent_menu_item_id'],'menu_items',$con)."</td>
		<td>".getFieldValue('description','id',$parent_menu_id,'menu_list',$con)."</td>
		<td nowrap>
		<a href='manage_submenu_item.php?submenu_item_id=".$submenu_item['id']."' class='text-decoration-none'><img class='mx-1' src='../portal-icons/edit.png' height='20px'></a>
		<a href='delete_submenu_item.php?submenu_item_id=".$submenu_item['id']."' class='text-decoration-none'><img class='mx-1' src='../portal-icons/delete.png' height='20px'></a>
		</td>
		</tr>";
}
?>

</tbody>
</table>

<?php include_once("footer_copyright.php") ?>

<script>
$(document).ready(function(){
$("#parent_menu_id").change(function(){
if($("#parent_menu_id").val() > 0)
{
	$.ajax({
			url: "../ajax_files/getMenuItems_ajax.php",
			type: "post",
			data: { parent_menu: $("#parent_menu_id").val(),},
			success: function(response){
				$("#parent_menu_item_id").html(response);
			}
	});
	$("#parent_menu_item_id").attr('disabled',false);
	$("#btn_submit").attr('disabled',false);
}
else
{
	$("#parent_menu_item_id").attr('disabled',true);
	$("#btn_submit").attr('disabled',true);
}
});
});
</script>
