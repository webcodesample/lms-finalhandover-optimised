<div class="mb-5">
<?php
$label_design_col1 = "class='py-2' style='width:100px;'";
$label_design_col2 = "class='py-2' style='width:100px;'";
$input_row_div_design = "class='d-flex flex-wrap justify-content-start fs-9 px-5 gap-4'";

$where_con_array = [ 'id' => $lrn['guarantor_id']];
$guarantor = mysqli_fetch_assoc(getRowsDataCon('guarantor_list',$where_con_array,$con));

$where_con_array = [ 'id' => $lrn['bank_account']];
$bank = mysqli_fetch_assoc(getRowsDataCon('bank_accounts_list',$where_con_array,$con));

$product = 'Not Selected';
$introducer = 'Not selected';

if($lrn['product_id'] > 0)
$product = getFieldvalue('description','id',$lrn['product_id'],'product_list',$con);

if($lrn['introducer_id'] > 0)
$introducer = getFieldvalue('name','id',$lrn['introducer_id'],'introducer_list',$con);

include_once("lrn_summary_ops_btns.php");
include_once("lrn_summary_lrn_section.php");
include_once("lrn_summary_profile_section.php");

if($lrn['cust_type'] == 2)
include_once("lrn_summary_company_section.php");

include_once("lrn_summary_loan_section.php");
include_once("lrn_summary_bank_section.php");

if($lrn['guarantor_id'] > 0)
include_once("lrn_summary_guarantor_section.php");
?>
</div>