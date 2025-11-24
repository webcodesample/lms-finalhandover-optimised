<?php
include_once("common_include.php");

if(checkIsRequested('country_id'))
{
	$where_con_array = [
				'country_id' => $_REQUEST['country_id'],
				];

	$university_list = getRowsDataCon('university_list',$where_con_array,$con);
	$total_university = getRowCount('country_id',$_REQUEST['country_id'],'university_list',$con);
	$university_list_heading = "Total Universities from ".strtoupper(getFieldValue('name','id',$_REQUEST['country_id'],'country_list',$con))." : ".$total_university;
}
else
{
	$total_university = 0;
	$university_list_heading = "";
}

include_once("../common/head.php");
include_once("../common/loader.php");
?>

<div class="container mt-5">
<div class="row">

<div class="col-2">
<center>
<h6 class="text-danger">Please Select A Country</h6>
<?php

$country_list = getRowsData('country_list',$con);

while($country = mysqli_fetch_assoc($country_list))
{
	echo "<a href='university_finder.php?country_id=".$country['id']."'>
		<img src='../country-flags/".$country['name']."-sm.png' class='border border-2 border-warning rounded-circle m-2' width='80px' title='".$country['name']."'>
		</a>";
}

?>

</center>
</div>

<div class="col-10">

<h5 class="text-danger mb-3"><?=$university_list_heading?></h5>

<?php
if($total_university)
{
?>

<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Name</th>
<th>Region</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;
while($university = mysqli_fetch_assoc($university_list))
{
	$i++;
	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>".$university['name']."</td>
		<td>".$university['region']."</td>
		<td><a href='course_finder.php' class='btn btn-sm btn-info p-1 rounded-pill'>Find Course</a></td>
		</tr>";
}
?>

</tbody>
</table>

<?php
}
?>

</div>
</div>
</div>