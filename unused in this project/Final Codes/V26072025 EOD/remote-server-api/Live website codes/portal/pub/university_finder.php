<?php
include_once("common_include.php");

if(checkIsRequested('country_id'))
{
	$where_con = [
				'country_id' => $_REQUEST['country_id'],
				];

	$query_view_university = "SELECT * FROM university_list".setWhereClause($where_con);
	$result_view_university = mysqli_query($con, $query_view_university);
	$total_row_view_university = mysqli_num_rows($result_view_university);
	$university_list_heading = "Total Universities from ".strtoupper(getFieldValue('name','id',$_REQUEST['country_id'],'country_list',$con))." : ".$total_row_view_university;
}
else
{
	$total_row_view_university = 0;
	$university_list_heading = "";
}

include_once("../common/head.php");
include_once("../common/loader.php");
?>

<div class="container">
<div class="row">

<div class="col-2">
<center>
<h6 class="text-danger">Please Select A Country</h6>
<?php

$query_view_country = "SELECT * FROM country_list";
$result_view_country = mysqli_query($con,$query_view_country);

while($country = mysqli_fetch_assoc($result_view_country))
{
	echo "<a href='university_finder.php?country_id=".$country['id']."'>
		<img src='../country-flags/".$country['name']."-sm.png' class='border border-2 border-warning rounded-circle m-2' width='80px' title='".$country['name']."'>
		</a>";
}

?>

</center>
</div>

<div class="col-10">

<h5 class="text-danger"><?=$university_list_heading?></h5>

<?php
if($total_row_view_university)
{
?>

<table class="table table-sm table-bordered table-striped table-hover">

<tr>
<th>#</th>
<th>Name</th>
<th>Region</th>
<th>Action</th>
</tr>

<?php
$i = 0;
while($university = mysqli_fetch_assoc($result_view_university))
{
	$i++;
	echo "<tr>
		<td>".$i."</td>
		<td>".$university['name']."</td>
		<td>".$university['region']."</td>
		<td><a href='course_finder.php' class='btn btn-sm btn-info border rounded-pill'>Find Course</a></td>
		</tr>";
}
?>

</table>

<?php
}
?>

</div>
</div>
</div>