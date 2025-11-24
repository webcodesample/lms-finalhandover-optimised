<?php
$i = 0;
$where_con_array = ['crn' => $_REQUEST['crn']];
$crn_bank_list = getRowsDataCon('bank_accounts_list',$where_con_array,$con);

if(getRowCount('crn',$_REQUEST['crn'],'bank_accounts_list',$con) < 3)
{
?>
<div class="text-end">
<button type="button" class="btn btn-sm btn-subtle-info py-1 px-2" data-bs-toggle="modal" data-bs-target="#addBank">Add Bank</button>
</div>
<?php } ?>

<table class="table table-sm table-hover table-bordered mt-3 mb-1 fs-9">

<thead>
	<tr class="table-info">
		<th>#</th>
		<th>Name</th>
		<th>Account Number</th>
		<th>IFSC</th>
		<th>Bank Name</th>
		<th>Bank Address</th>
		<th>Primary</th>
		<th>Status</th>
		<th>Action</th>
	</tr>
</thead>

<tbody>

<?php
while($crn_bank = mysqli_fetch_assoc($crn_bank_list))
{
	$i++;
	$primary_account = "";
	$deleteBtn = "<a href='delete_crn_bank.php?bank=".$crn_bank['id']."&crn=".$_REQUEST['crn']."'><img src='../portal-icons/delete.png' height='20px'></a>";

	if($crn_bank['id'] == $crn['primary_bank'])
	{
		$primary_account = "Yes";
		$deleteBtn = "";
	}

	if($crn_bank['verification_status'])
	$verification_status = "<span class='text-success fw-semibold'>Verified</span>";
	else
	$verification_status = "<span class='text-danger fw-semibold'>Not Verified</span>";

	echo "<tr>
			<td class='ps-2'>".$i."</td>
			<td>".$crn_bank['account_holder_name']."</td>
			<td>".$crn_bank['account_number']."</td>
			<td>".$crn_bank['ifsc']."</td>
			<td>".$crn_bank['bank_name']."</td>
			<td>".$crn_bank['branch_address']."</td>
			<td>".$primary_account."</td>
			<td>".$verification_status."</td>
			<td>".$deleteBtn."</td>
		</tr>";
}

if($i == 0)
{
	echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No Bank Account Added</td></tr>";
}
?>
</tbody>
</table>

<?php include_once("add_bank_modal.php") ?>