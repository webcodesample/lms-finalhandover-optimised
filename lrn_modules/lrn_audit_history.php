<?php
if(isset($_REQUEST['audit_index']) && $_REQUEST['audit_index'])
$audit_history_offset = $_REQUEST['audit_index'];
else
$audit_history_offset = 0;

$audit_history_total = getRowCount('lrn',$_REQUEST['lrn'],'lrn_audit_history',$con);

$query_audit_history = "SELECT * FROM lrn_audit_history WHERE lrn = '".$_REQUEST['lrn']."' ORDER BY datentime DESC LIMIT 2 OFFSET ".$audit_history_offset;
$result_audit_history = mysqli_query($con, $query_audit_history);

$query_latest_audit = "SELECT id FROM lrn_audit_history WHERE lrn = '".$_REQUEST['lrn']."' ORDER BY datentime DESC LIMIT 1";
$result_latest_audit = mysqli_query($con, $query_latest_audit);
$latest_audit = mysqli_fetch_assoc($result_latest_audit);

if($_SESSION['login_type'] == 5)
$prev_next_link_href = 'view_lrn.php';
else
$prev_next_link_href = 'manage_lrn.php';

?>
<div class="container">
<div class="d-flex justify-content-between">
<?php
if($audit_history_offset > 0)
{
	echo "<a href='".$prev_next_link_href."?lrn=".$_REQUEST['lrn']."&tab=audit_history&audit_index=".($audit_history_offset-1)."' class='btn btn-subtle-primary btn-sm m-1'>New</a>";
}
else
{
	echo "<input type='button' class='btn btn-subtle-primary btn-sm m-1' value='New' disabled>";
}

if($audit_history_offset < ($audit_history_total-2))
{
	echo "<a href='".$prev_next_link_href."?lrn=".$_REQUEST['lrn']."&tab=audit_history&audit_index=".($audit_history_offset+1)."' class='btn btn-subtle-primary btn-sm m-1'>Old</a>";
}
else
{
	echo "<input type='button' class='btn btn-subtle-primary btn-sm m-1' value='Old' disabled>";
}

?>
</div>
</div>

<div class="d-flex">
<?php
$i=0;
while($lrn_audit_history = mysqli_fetch_assoc($result_audit_history))
{
	$i++;

	if($lrn_audit_history['id'] == $latest_audit['id'])
	$updation_date = "<span class='text-danger'>".date('d-m-Y h:i:s A',$lrn_audit_history['datentime'])." (Current)<span>";
	else
	$updation_date = "<span class='text-success'>".date('d-m-Y h:i:s A',$lrn_audit_history['datentime'])."<span>";
	$documents_list = "";

	if($lrn_audit_history['updated_columns'])
	$updated_column_array = explode(',',$lrn_audit_history['updated_columns']);
	else
	$updated_column_array = [];

	echo "<center>
		<div class='card h-100 mx-4'>
		<div class='card-body' style='width:500px;'>
		<table class='table table-sm table-hover fs-9'>
		<thead>
		<tr><th colspan='3' class='text-center'>".$updation_date."
		<button id='all_detail_btn_".$i."' class='btn btn-sm btn-subtle-danger ms-2 px-1 py-0 fw-bolder' onClick='toggleAllSections()'>+</button>
		</th></tr>
		</thead>
		<tbody>
		<tr><td nowrap width='150px'>Current Status </td><td>:</td><td>";
	if(in_array('status',$updated_column_array))
		echo "<span class='text-danger'>".getFieldValue('description','id',$lrn_audit_history['status_id'],'lead_status_list',$con)."</span>";
	else
		echo getFieldValue('description','id',$lrn_audit_history['status_id'],'lead_status_list',$con);

	echo "</td></tr>
		<tr><td nowrap>Updation Remark </td><td>:</td><td><textarea class='bg-transparent text-danger' readonly>".$lrn_audit_history['updation_remark']."</textarea></td></tr>
		</tbody>";
		
		include("audit_section_customer_detail.php");

		if($lrn_audit_history['cust_type'] == 2)
		include("audit_section_company_detail.php");

		include("audit_section_loan_detail.php");
		include("audit_section_bank_detail.php");
		include("audit_section_guarantor_detail.php");

	echo "</table>
		</div>
		</div>		
		</center>";
}
echo "<input type='hidden' id='audit_count' value='".$i."'>";
?>
</div>

<script src="../js/auditHistory.js"></script>