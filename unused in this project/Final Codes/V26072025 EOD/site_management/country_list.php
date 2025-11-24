<?php
$result_country_list = getRowsData('country_list',$con);
?>

<div class="text-end">
<img src="../portal-icons/add.png" height="25px" onClick="$('#addCountry').toggleClass('d-none')">
</div>

<div id="addCountry" class="d-none">
<form action="add_country.php" method="post">
<div class="d-flex">
<input type="text" name="country_name" placeholder="Country Name" class="form-control form-control-sm m-1" style="width:200px;" required>
<input type="text" name="currency_name" placeholder="Country Currency" class="form-control form-control-sm m-1" style="width:200px;" required>
<button type="submit" class="btn btn-subtle-danger btn-sm m-1">Add Country</button>
</div>
</form>
</div>

<table class="table table-sm table-bordered table-striped table-hover fs-9 mt-2">

<thead class="table-info text-center">
<th>#</th>
<th>Name</th>
<th>Currency</th>
<th></th>
</thead>
<tbody>

<?php
$i = 0;
while($country = mysqli_fetch_assoc($result_country_list))
{
	$i++;
	$delete_link = "";

	if(getRowCount('country_id',$country['id'],'university_list',$con) == 0)
	$delete_link .= "<a href='delete_country.php?country_id=".$country['id']."' onClick='return makeConfirm(&quot;delete ".strtoupper($country['name'])." &quot;)'><img src='../portal-icons/delete.png' height='20px'></a>";

	echo "<tr>
		<td class='ps-2'>".$country['id']."</td>	
		<td>".strtoupper($country['name'])."</td>
		<td>".strtoupper($country['currency'])."</td>
		<td>
		<a href='manage_country.php?country_id=".$country['id']."' onClick='return makeConfirm(&quot;edit ".strtoupper($country['name'])." &quot;)'><img src='../portal-icons/edit.png' height='20px'></a>
		".$delete_link."
		</td>
		</tr>";
}
?>

</tbody>
</table>