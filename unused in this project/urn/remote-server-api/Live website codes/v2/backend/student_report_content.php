<h5 class="mb-5">Student Wise URN Report</h5>
<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-warning text-center">
<th>#</th>
<th>Name</th>
<th>ID</th>
<th>URN Count</th>
<th>New</th>
<th>Applied</th>
<th>URN Rejected</th>
<th>Visa Rejected</th>
<th>Deleted</th>
<th>Complete</th>
</thead>

<tbody>

<?php
$i = 0;
while($student = mysqli_fetch_assoc($student_list))
{
	$i++;

	echo "<tr class='text-center'>
		<td>".$i."</td>
		<td class='text-start'>".ucwords($student['name'])."</td>
		<td>ST".$student['id']."</td>
		<td>".getRowCount('student_id',$student['id'],'leads_details',$con)."</td>
		<td>".getStudentURNCount($student['id'],'New',$con)."</td>
		<td>".getStudentURNCount($student['id'],'Applied',$con)."</td>
		<td class='text-danger'>".getStudentURNCount($student['id'],'URN Rejected',$con)."</td>
		<td class='text-danger'>".getStudentURNCount($student['id'],'Visa Rejected',$con)."</td>
		<td class='text-danger'>".getStudentURNCount($student['id'],'Deleted',$con)."</td>
		<td class='text-success'>".getStudentURNCount($student['id'],'Complete',$con)."</td>
		</tr>";
}
?>

</tbody>

</table>

<?php include_once("footer_copyright.php"); ?>