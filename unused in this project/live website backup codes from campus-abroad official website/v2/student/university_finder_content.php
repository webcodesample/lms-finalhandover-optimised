<div class="container">

<h5>Please Select A Country</h5>
<?php

$query_view_country = "SELECT * FROM country_list";
$result_view_country = mysqli_query($con,$query_view_country);

while($country = mysqli_fetch_assoc($result_view_country))
{
	echo "<a href='university_finder.php?country_id=".$country['id']."' class='text-decoration-none'>
		<img src='../country-flags/".$country['name']."-sm.png' class='border border-2 border-light rounded-circle m-2' width='50px' title='".$country['name']."'>
		</a>";
}

?>

<h5 class="mt-5 mb-3"><?=$university_list_heading?></h5>

<?php
if($total_row_view_university)
{
?>

<table class="table table-sm table-bordered table-striped table-hover fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Name</th>
<th>Region</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;
while($university = mysqli_fetch_assoc($result_view_university))
{
	$i++;
	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td><a href='course_finder.php' class='text-decoration-none'>".$university['name']."</a></td>
		<td>".$university['region']."</td>
		</tr>";
}
?>

</tbody>
</table>

<?php
}
?>

</div>

<?php include_once("footer_copyright.php") ?>