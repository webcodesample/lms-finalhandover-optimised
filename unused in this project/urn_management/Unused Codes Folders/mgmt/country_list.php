<?php
$result_country_list = getRowsData('country_list',$con);
?>

<table class="table table-sm table-bordered table-striped table-hover fs-9 mt-5">

<thead class="table-info text-center">
<td>ID</td>
<td>Name</td>
<td>Currency</td>
</thead>
<tbody>

<?php
$i = 0;
while($country = mysqli_fetch_assoc($result_country_list))
{
	$i++;
	echo "<tr>
		<td>".$country['id']."</td>	
		<td>".strtoupper($country['name'])."</td>
		<td>".strtoupper($country['currency'])."</td>
		</tr>";
}
?>

</tbody>
</table>