<div class="d-flex justify-content-between">
<h5>Application Point List</h5>
<a href="add_application_point.php"><img src="../portal-icons/add.png" height="25px"></a>
</div>

<table class="table table-sm table-bordered table-hover table-striped fs-9 mt-3">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Name</th>
<th>Type</th>
<th>Address</th>
<th>Contact Person</th>
<th>Mobile</th>
<th>Email</th>
<th>Commission %</th>
<th>Action</th>
</tr>
</thead>

<tbody>
<?php
$i = 0;
while($application_point = mysqli_fetch_assoc($application_point_list))
{
	$i++;
	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>
		<a class='text-decoration-none' href='manage_application_point.php?ap_id=".$application_point['id']."'>".strtoupper($application_point['name'])."</a></td>
		<td>";

	if($application_point['type'] == 'u')
	echo "University";
	else
	echo "Intermediary";

	echo "</td>
		<td>".$application_point['address']."</td>
		<td>".$application_point['contact_person_name']."</td>
		<td>".$application_point['mobile']."</td>
		<td>".$application_point['email']."</td>
		<td>".$application_point['comission_percentage']."</td>
		<td nowrap>
		<a href='manage_application_point.php?ap_id=".$application_point['id']."' onclick='return makeConfirm(&quot;edit ".$application_point['name']."?&quot;)'><img src='../portal-icons/edit.png' height='20px'></a>
		<img src='../portal-icons/delete.png' height='20px'>
		</td>
		</tr>";
}
?>
</tbody>

</table>