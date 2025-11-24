<?php

?>

<div <?=$input_row_div_design?>>
<div class="d-flex">
<div <?=$label_design_col1?>>Agreement ID</div>
<input type="text" <?=$disabled_input_red?> value="<?=getFieldValue('agreement_id','lrn',$_REQUEST['lrn'],'lrn_agreements_list',$con)?>">
</div>
<div class="d-flex">
<div <?=$label_design_col2?>>Generated On</div>
<input type="text" <?=$disabled_input_green?> value="<?=date('d-m-Y h:i:s A',getFieldValue('datentime','lrn',$_REQUEST['lrn'],'lrn_agreements_list',$con))?>">
</div>
<div class="d-flex">
<div <?=$label_design_col2?>>Printed On</div>
<input type="text" <?=$disabled_input_red?> value="<?=date('d-m-Y h:i:s A')?>">
</div>
</div>