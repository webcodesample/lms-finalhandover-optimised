<?php
$action_list = getRowsData('action_perform_list',$con);
?>
<div class="d-flex justify-content-end">
<img src="../portal-icons/add.png" width="30px" onclick="showAddDiv()">
</div>

<div id="add_div" style="display:none;">
<form action="add_predefined_action.php" method="post">
<div class="d-flex">
<input type="text" class="form-control form-control-sm m-1" style="width:200px;" name="action_description" placeholder="Action Name" required>
<input type="submit" value="Add Action" onClick="return makeConfirm('add new action in list')" class="btn btn-primary btn-sm m-1">
</div>
</form>
</div>

<table class="table table-sm table-bordered table-striped table-hover fs-9 w-50">

<thead class="table-info text-center">
<th>#</th>
<th>Name</th>
</thead>
<tbody>

<?php
$i = 0;
while($action = mysqli_fetch_assoc($action_list))
{
	$i++;

	echo "<tr>
		<td class='ps-2'>".$action['id']."</td>
		<td>".$action['description']."</td>
		</tr>";
}
?>

</tbody>
</table>