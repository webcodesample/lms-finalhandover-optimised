<div class="d-flex my-3 bg-warning-subtle ps-2">
<h5 class="my-2">Basic Info</h5>
</div>

<div <?=$input_row_div_design?>>
<div class="d-flex">
<div <?=$label_design_col1?>>LAN</div>
<input type="text" <?=$disabled_input_red?> value="<?=$_REQUEST['lan']?>">
</div>
<div class="d-flex">
<div <?=$label_design_col2?>>Agreement ID</div>
<input type="text" <?=$disabled_input_green?> value="<?=getFieldValue('agreement_id','lrn',$lan['lrn'],'lrn_agreements_list',$con)?>">
</div>
</div>