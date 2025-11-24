<?php
include_once("common_include.php");

$label_design_col1 = "class='py-2' style='width:100px;'";
$label_design_col2 = "class='py-2' style='width:120px;'";
$input_row_div_design = "class='d-flex flex-wrap justify-content-start fs-9 px-5 gap-5'";

$crn = getFieldValue('crn','lrn',$_REQUEST['lrn'],'lrn_list',$con);
$where_con_array = ['crn' => $crn];
$bank_account_list = getRowsDataCon('bank_accounts_list',$where_con_array,$con);

$bank_account_options = "<option value=''>Select Bank Account</option>";
$bank_accounts = [];
$i = 0;

while($bank_account = mysqli_fetch_assoc($bank_account_list))
{
	$bank_accounts[] = $bank_account;

	if($bank_accounts[$i]['id'] == $lrn['bank_account'])
	$bank_account_options .= "<option value=".$i." selected>".$bank_accounts[$i]['account_number']." - ".$bank_accounts[$i]['ifsc']."</option>";
	else
	$bank_account_options .= "<option value=".$i.">".$bank_accounts[$i]['account_number']." - ".$bank_accounts[$i]['ifsc']."</option>";

	$i++;
}
?>
<form method="post" action="update_lrn_bank.php">
<input type="hidden" name="lrn" value="<?=$_REQUEST['lrn']?>">
<input type="hidden" name="bank_account" id="id">
<input type="hidden" name="bank_account_old" id="bank_account_old" value="<?=$lrn['bank_account']?>">

<div class="fs-9">

<div class="d-flex">
<div <?=$label_design_col1?>>Select One</div>
<select <?=$required_dropdown_design?> id="bank_account" onChange="compareBank(this.value)" <?=$field_visibility?>>
<?=$bank_account_options?>
</select>
</div>

<?=createInput('bank_name','',$label_design_col1,$disabled_input_box_design,$field_visibility)?>
<?=createInput('account_number','',$label_design_col1,$disabled_input_box_design,$field_visibility)?>
<?=createInput('ifsc','',$label_design_col1,$disabled_input_box_design,$field_visibility)?>
<?=createInput('branch_address','',$label_design_col1,$disabled_input_box_design,$field_visibility,'textarea')?>
</div>

<center class="mt-3">
<input type="reset" class="btn btn-sm btn-subtle-danger rounded" data-bs-dismiss="modal" value="Cancel">
<button class="btn btn-sm btn-subtle-success m-1" id="updateBankBtn" disabled>Update Bank Account</button>
</center>

</form>
<script>
$('#lrnBankModal').on('show.bs.modal', function () {
    compareBank($('#bank_account').val())
});

function compareBank(index)
{
	showBank(index);

	if(($('#id').val() == $('#bank_account_old').val()) || $('#id').val() == '')
	$('#updateBankBtn').prop('disabled',true);
	else
	$('#updateBankBtn').prop('disabled',false);
}

function showBank(index)
{
	const guarantors = <?=json_encode($bank_accounts)?>;
	const inputs = ['id','bank_name','account_number','ifsc','branch_address'];
	for(i=0; i<inputs.length; i++)
	{
		if(index == '')
		{
			$('#'+inputs[i]).val('');
			$('#'+inputs[i]).prop('readonly',true);
		}
		else if(index == 111)
		{
			$('#'+inputs[i]).val('');
			$('#'+inputs[i]).prop('readonly',false);
		}
		else
		{
			$('#'+inputs[i]).val(guarantors[index][inputs[i]]);
			$('#'+inputs[i]).prop('readonly',true);
		}
	}
}
</script>