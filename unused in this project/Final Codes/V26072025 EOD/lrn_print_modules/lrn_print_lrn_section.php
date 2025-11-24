<div <?=$input_row_div_design?>>
<div class="d-flex">
<div <?=$label_design_col1?>>LRN</div>
<input type="text" <?=$disabled_input_red?> value="LA<?=$_REQUEST['lrn']?>">
</div>
<div class="d-flex">
<div <?=$label_design_col2?>>Created On</div>
<input type="text" <?=$disabled_input_green?> value="<?=date('d-m-Y h:i:s A',$lrn_created_datentime)?>">
</div>
<div class="d-flex">
<div <?=$label_design_col2?>>Printed On</div>
<input type="text" <?=$disabled_input_red?> value="<?=date('d-m-Y h:i:s A')?>">
</div>
</div>

<div <?=$input_row_div_design?>>
<?php
$status_description = getFieldValue('description','id',$lrn['status_id'],'lead_status_list',$con);
createinput('Current Status',$status_description,$label_design_col1,$readonly_input_box_design,$field_visibility);

//if(in_array($status_description,['Customer Rejected','LRN Rejected','Deleted']))
//createinput('Remark',$lrn['updation_remark'],$label_design_col2,$readonly_input_box_design,$field_visibility);
?>
<div class="d-flex">
<div <?=$label_design_col2?>>Remark</div>
<div class="p-2 fw-semibold text-primary"><?=$lrn['updation_remark']?></div>
</div>
</div>