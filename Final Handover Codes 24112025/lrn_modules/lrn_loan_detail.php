<?php
//include_once("common_include.php");

$product = '';
$introducer = '';

if($lrn['product_id'] > 0)
$product = getFieldValue('description','id',$lrn['product_id'],'product_list',$con).' - '.$lrn['product_id'];

if($lrn['introducer_id'] > 0)
$introducer = getFieldValue('name','id',$lrn['introducer_id'],'introducer_list',$con).' - '.$lrn['introducer_id'];
?>

<form method="post" action="update_lrn_loan_detail.php">
<input type="hidden" name="lrn" value="<?=$_REQUEST['lrn']?>">

<div class="fs-9">
<?=createInput('product_id',$product,$label_design_col1,$required_input_box_design,$field_visibility)?>
<?=createInput('required_loan_amount',$lrn['required_loan_amount'],$label_design_col1,$required_input_box_design,$field_visibility)?>
<?=createInput('introducer_id',$introducer,$label_design_col1,$required_input_box_design,$field_visibility)?>
<?=createInput('updation_remark','',$label_design_col1,$required_textarea_design,$field_visibility,'textarea')?>
</div>

<center>
<input type="reset" class="btn btn-sm btn-subtle-danger rounded" data-bs-dismiss="modal" value="Cancel">
<button class="btn btn-sm btn-subtle-success m-1" id="updateLoanBtn" onClick="return validateLoanChanges()" <?=$field_visibility?>>Update Loan Detail</button>
</center>

<input type="hidden" name="introducer_id_old" id="introducer_id_old" value="<?=$introducer?>">
<input type="hidden" name="product_id_old" id="product_id_old" value="<?=$product?>">
<input type="hidden" name="required_loan_amount_old" id="required_loan_amount_old" value="<?=$lrn['required_loan_amount']?>">
</form>
<script>
function validateLoanChanges()
{
	let flag = false;

    let inputs = ['product_id','introducer_id','required_loan_amount'];

    for(i=0;i<inputs.length;i++)
    {
        if($('#'+inputs[i]).val() !== $('#'+inputs[i]+'_old').val())
        flag = true;
    }

    if(flag == false)
    alert('All values are same as old');

    return flag;
}
</script>