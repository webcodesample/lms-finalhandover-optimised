<h5 class="mb-3">My URN List</h5>

<table class="table table-sm table-bordered table-striped table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>URN</th>
<th>Date & Time</th>
<th>Course</th>
<th>University</th>
</thead>

<tbody>

<?php
$i = 0;
while($urn = mysqli_fetch_assoc($urn_list))
{
	$i++;

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td><a href='urn_details.php?lead_id=".$urn['id']."' class='text-decoration-none'>CA".$urn['urn']."</a></td>
		<td>".date('d-m-Y h:i A', $urn['datentime'])."</td>
		<td>".getFieldValue('name','id',$urn['course_id'],'course_list',$con)."</td>
		<td>".getFieldValue('name','id',getFieldValue('university_id','id',$urn['course_id'],'course_list',$con),'university_list',$con)."</td>
		</tr>";
}
?>

</tbody>
</table>