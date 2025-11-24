<?php
$crn = getFieldValue('crn','lrn',$_REQUEST['lrn'],'lrn_list',$con);
$where_con_array = ['crn' => $crn];
$guarantor_list = getRowsDataCon('guarantor_list',$where_con_array,$con);

$guarantor_options = "";
$guarantors = [];
$i = 0;

while($guarantor = mysqli_fetch_assoc($guarantor_list))
{
	$guarantors[] = $guarantor;

	if($guarantors[$i]['id'] == $lrn['guarantor_id'])
	$guarantor_options .= "<option value=".$i." selected>".$guarantors[$i]['name']."</option>";
	else
	$guarantor_options .= "<option value=".$i.">".$guarantors[$i]['name']."</option>";

	$i++;
}
?>
<form method="post" action="update_lrn_guarantor.php">
<input type="hidden" name="lrn" value="<?=$_REQUEST['lrn']?>">
<input type="hidden" name="guarantor_id" id="guarantor_id">
<input type="hidden" name="guarantor_id_old" id="guarantor_id_old" value="<?=$lrn['guarantor_id']?>">

<div class="fs-9">

<div class="d-flex">
<div <?=$label_design_col1?>>Select One</div>
<select <?=$required_dropdown_design?> id="guarantor" onChange="compareGuarantor(this.value)" <?=$field_visibility?>>
<option value=''>Select Guarantor</option>
<?=$guarantor_options?>
</select>
</div>

<?=createInput('guarantor_name','',$label_design_col1,$disabled_input_box_design,$field_visibility)?>
<?=createInput('guarantor_email','',$label_design_col1,$disabled_input_box_design,$field_visibility)?>
<?=createInput('guarantor_mobile','',$label_design_col1,$disabled_input_box_design,$field_visibility)?>
<?=createInput('guarantor_current_address','',$label_design_col1,$disabled_input_box_design,$field_visibility,'textarea')?>
<?=createInput('guarantor_permanent_address','',$label_design_col1,$disabled_input_box_design,$field_visibility,'textarea')?>
</div>

<center class="mt-3">
<input type="reset" class="btn btn-sm btn-subtle-danger rounded" data-bs-dismiss="modal" value="Cancel">
<button class="btn btn-sm btn-subtle-success m-1" id="updateGuarantorBtn" disabled>Update Guarantor</button>
</center>

</form>
<script>
$('#lrnGuarantorModal').on('show.bs.modal', function () {
    compareGuarantor($('#guarantor').val())
});

function compareGuarantor(index)
{
	showGuarantor(index);

	if(($('#guarantor_id').val() == $('#guarantor_id_old').val()) || $('#guarantor_id').val() == '')
	$('#updateGuarantorBtn').prop('disabled',true);
	else
	$('#updateGuarantorBtn').prop('disabled',false);
}

function showGuarantor(index)
{
	const guarantors = <?=json_encode($guarantors)?>;
	const inputs = ['id','name','mobile','email','current_address','permanent_address'];
	for(i=0; i<inputs.length; i++)
	{
		fieldIdPrefix = '#guarantor_';

		if(index == '')
		{
			$(fieldIdPrefix+inputs[i]).val('');
			$(fieldIdPrefix+inputs[i]).prop('readonly',true);
		}
		else if(index == 111)
		{
			$(fieldIdPrefix+inputs[i]).val('');
			$(fieldIdPrefix+inputs[i]).prop('readonly',false);
		}
		else
		{
			$(fieldIdPrefix+inputs[i]).val(guarantors[index][inputs[i]]);
			$(fieldIdPrefix+inputs[i]).prop('readonly',true);
		}
	}
}
</script>