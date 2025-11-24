<div <?=$input_row_div_design?>>
<div class="d-flex">
<div <?=$label_design_col1?>>LRN</div>
<input type="text" <?=$disabled_input_red?> value="LA<?=$_REQUEST['lrn']?>">
</div>
<div class="d-flex">
<div <?=$label_design_col2?>>Current Status</div>
<input type="text" <?=$disabled_input_green?> value="<?=$current_status_description?>">
</div>
<div class="d-flex">
<div <?=$label_design_col2?>>Allocated ID</div>
<input type="text" <?=$disabled_input_green?> value="<?=$lrn_allocation_id?>">
</div>
</div>