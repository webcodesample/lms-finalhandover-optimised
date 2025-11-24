<?php
include_once("common_include.php");

$report_list = getRowsData('testing_report_list',$con,'datentime','DESC');

include_once("head.php");
?>

<div class="d-flex justify-content-between p-2 mb-5">
	<span><?=$_SESSION['username']?></span>
	<a href="logout.php" class="btn btn-sm btn-danger m-1">Logout</a>
</div>

<div class="d-flex justify-content-end p-2 mb-2">
	<a href="add_record.php" class="btn btn-sm btn-success m-1">Add Feedback</a>
</div>

<table class="table table-bordered table-sm table-hover fs-9">

<thead class="table-warning text-center">
<th>#</th>
<th nowrap>Comment/Remark</th>
<th>Type</th>
<th nowrap>Created On</th>
<th nowrap>Submit By</th>
<th>Status</th>
<th nowrap>Updated On</th>
<th nowrap>Updated By</th>
<th nowrap>Update Remark</th>
<th>Action</th>
</thead>

<tbody>

<?php
$i = 0;
while($report = mysqli_fetch_assoc($report_list))
{
	$i++;

	if($report['type'] == 0)
		$report_type = "Error";
	else
		$report_type = "Suggestion";

	if($report['status'] == 0)
		$reprt_status = "Created";
	else if($report['status'] == 1)
		$reprt_status = "Updated";
	else if($report['status'] == 2)
		$reprt_status = "Rectified";
	else if($report['status'] == 3)
		$reprt_status = "Complete";

	if($report['update_datentime'])
		$updation_datentime = date('d-m-Y h:i:s A',$report['update_datentime']);
	else
		$updation_datentime = "";

	echo "<tr>
		<td>".$i."</td>
		<td>".$report['testing_comment']."</td>
		<td>".$report_type."</td>
		<td>".date('d-m-Y h:i:s A',$report['datentime'])."</td>
		<td>".ucwords($report['submit_by'])."</td>
		<td>".$reprt_status."</td>
		<td>".date('d-m-Y h:i:s A',$report['update_datentime'])."</td>
		<td>".ucwords($report['updated_by'])."</td>
		<td>".ucwords($report['update_remark'])."</td>
		<td nowrap>
		<a href='manage_report.php?report_id=".$report['id']."' class='link-success text-decoration-none m-1'><img src='../portal-icons/edit.png' height='20px'></a>
		<a href='test_report_history.php?report_id=".$report['id']."' class='link-success text-decoration-none m-1'><img src='../portal-icons/viewhistory.png' height='20px'></a>
		</td>
		</tr>";
}

if($i == 0)
{
	echo "<tr><td colspan='10' class='text-center text-danger fw-bold'>No Data Available</td></tr>";
}
?>

</tbody>

</table>

<?php include_once("../common/footer_copyright.php"); ?>