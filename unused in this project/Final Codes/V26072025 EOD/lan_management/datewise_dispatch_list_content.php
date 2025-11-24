<div class="d-flex justify-content-between mb-2">
<h5>Dispatch List for <?=$_REQUEST['date']?></h5>
<form action="approveDispatch.php" method="post">
<button type="button" class="btn btn-sm btn-subtle-success p-0" title="Export Dispatch List" onClick="exportToExcel('<?=date('dmY',strtotime($_REQUEST['date']))?>')">
<span class="mx-1" data-feather="file" style="height: 20px; width: 20px;"></span>
</button>
<button type="submit" id="dispatchBtn" title="Dispatch Loan" class="btn btn-sm btn-subtle-danger p-0" onClick="return confirm('are you sure to approve dispatch?')" disabled>
<span class="text-danger mx-1" data-feather="check" style="height: 20px; width: 20px;"></span>
</button>
</div>

<table class="table table-sm table-hover table-bordered fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>LAN</th>
<th>Requested Amount</th>
<th>Approved Amount</th>
<th>Approval Date</th>
</tr>
</thead>

<tbody>

<?php
$printable_table = "<table class='d-none' id='printable_table'>
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>LAN</th>
                        <th>Amount</th>
                        <th>Bank Account</th>
                        <th>IFSC</th>
                        <th>Account Holder Name</th>
                    </tr>
                    </thead>
                    <tbody>";

$i = 0;

while($dispatch_list = mysqli_fetch_assoc($datewise_dispatch_list))
{
	$i++;
    //print_r($dispatch_list);

	echo "<tr>
		<td class='ps-2'><input type='checkbox' name='dispatchLAN[]' class='form-check-input me-1 dispatchLAN' value='".$dispatch_list['lan']."' onClick='validateCheckCount()'>".$i."</td>
		<td>".ucwords($dispatch_list['lan'])."</td>
		<td>".$dispatch_list['requested_amount']."</td>
		<td>".$dispatch_list['approved_loan_amount']."</td>
		<td>".date('d-m-Y',$dispatch_list['approval_date'])."</td>
		</tr>";

    $lan_bank_account = getFieldValue('bank_account','lan',$dispatch_list['lan'],'lan_audit_history',$con);
    $bank_account_info = mysqli_fetch_assoc(mysqli_query($con,"SELECT * FROM bank_accounts_list WHERE id = ".$lan_bank_account));
    $printable_table .= "<tr>
                            <td>".$i."</td>
                            <td>".$dispatch_list['lan']."</td>
                            <td>".$dispatch_list['approved_loan_amount']."</td>
                            <td>".$bank_account_info['account_number']."</td>
                            <td>".$bank_account_info['ifsc']."</td>
                            <td>".$bank_account_info['account_holder_name']."</td>
                        </tr>";
}

$printable_table .= "</tbody></table>";

if($i == 0)
echo "<tr><td colspan='9' class='text-center text-danger bg-danger-subtle fw-semibold'>No LAN Available for dispatch</td></tr>";
?>

</tbody>
</table>
</form>
<?php
echo $printable_table;
include_once("footer_copyright.php");
?>

<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
<script>
function validateCheckCount()
{
	let checkedCount = $('.dispatchLAN:checked').length;

	if(checkedCount > 0)
	$('#dispatchBtn').prop('disabled',false);
	else
	$('#dispatchBtn').prop('disabled',true);
}

function getTableDataAsJson(tableId)
{
    var data = [];
    var headers = [];

    // Get headers
    $('#' + tableId + ' thead th').each(function() {
        headers.push($(this).text().trim());
    });

    // Get rows
    $('#' + tableId + ' tbody tr').each(function() {
        var row = {};
        $(this).find('td').each(function(colIndex) {
            // Use headers for object keys
            if (headers[colIndex]) {
                row[headers[colIndex]] = $(this).text().trim();
            }
        });
        data.push(row);
    });
    return data;
}

function exportToExcel(dateVal) {
            const data = getTableDataAsJson('printable_table');
            const worksheet = XLSX.utils.json_to_sheet(data);
            const workbook = XLSX.utils.book_new();
            XLSX.utils.book_append_sheet(workbook, worksheet, "History");
            XLSX.writeFile(workbook, 'dispatch_list_'+dateVal+'.xlsx');
        }
</script>
