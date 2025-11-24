<?php
include_once("common_include.php");

$where_con_array = [ 'report_id' => $_REQUEST['report_id']];
$orderby_clause = setOrderByClause('update_datentime','ASC');

$report_history_list = getRowsDataCon('testing_report_history',$where_con_array,$con,$orderby_clause);

include_once("head.php");
?>

<div class="d-flex justify-content-between p-2 mb-5">
	<span><?=$_SESSION['username']?></span>
	<a href="logout.php" class="btn btn-sm btn-danger m-1">Logout</a>
</div>

<div class="d-flex justify-content-end p-2 mb-2">
	<a href="test_report.php" class="btn btn-sm btn-success m-1">Go Back</a>
</div>

<table class="table table-bordered table-sm table-hover fs-9">

<thead class="table-warning text-center">
<th>#</th>
<th>Update Remark</th>
<th>Updated By</th>
<th>Date & Time</th>
</thead>

<tbody>

<?php
$i = 0;
while($report = mysqli_fetch_assoc($report_history_list))
{
	$i++;


	echo "<tr>
		<td>".$i."</td>
		<td>".$report['updation_remark']."</td>
		<td>".$report['update_by']."</td>
		<td>".date('d-m-Y h:i:s A',$report['update_datentime'])."</td>
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