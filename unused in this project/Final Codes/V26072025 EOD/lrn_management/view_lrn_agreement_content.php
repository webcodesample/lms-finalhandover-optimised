<div class="d-flex justify-content-end">
<button class="btn btn-sm btn-subtle-danger me-2" onClick="printData()">
<span data-feather="printer" style="height: 20px; width: 20px;"></span>
</button>
<?php setGoBack("leads.php"); ?>
</div>

<div id="myPrintableDiv" class="mt-5 p-2">
<center><h5 class="mb-5 bg-danger-subtle py-2">Loan Agreement</h5></center>
<?php
$lrn = getLatestUpdateRow('lrn',$_REQUEST['lrn'],'lrn_audit_history',$con);
$label_design_col1 = "class='py-2' style='width:100px;'";
$label_design_col2 = "class='py-2' style='width:100px;'";
$input_row_div_design = "class='d-flex flex-wrap justify-content-start fs-9 px-5 gap-4'";
$field_visibility = "";

$where_con_array = [ 'id' => $lrn['guarantor_id']];
$guarantor = mysqli_fetch_assoc(getRowsDataCon('guarantor_list',$where_con_array,$con));

$where_con_array = [ 'id' => $lrn['bank_account']];
$bank = mysqli_fetch_assoc(getRowsDataCon('bank_accounts_list',$where_con_array,$con));

$product = 'Not Selected';
$introducer = 'Not Selected';
$introducer_code = 'Not Selected';
$lrn_created_datentime =  getFieldvalue('datentime','lrn',$_REQUEST['lrn'],'lrn_list',$con);

$unchangable_key_val = ['product_id','introducer_id'];

foreach($lrn AS $key=>$value)
{
	if(!in_array($key,$unchangable_key_val) && ($value == '' || $value == 0))
	$lrn[$key] = '--Not Available--';
}

if($lrn['product_id'] > 0)
$product = getFieldvalue('description','id',$lrn['product_id'],'product_list',$con);

if($lrn['introducer_id'] > 0)
{
	$introducer = getFieldvalue('name','id',$lrn['introducer_id'],'introducer_list',$con);
	$introducer_code = 'IR'.(25000+$lrn['introducer_id']);
}

if($lrn['dob'] > 0)
$lrn['dob'] = date('d-m-Y',$lrn['dob']);

include_once("../lrn_agreement_modules/agreement_info_section.php");
include_once("../lrn_agreement_modules/agreement_profile_section.php");

if($lrn['cust_type'] == 2)
include_once("../lrn_agreement_modules/agreement_company_section.php");

include_once("../lrn_agreement_modules/agreement_loan_section.php");
include_once("../lrn_agreement_modules/agreement_bank_section.php");

if($lrn['guarantor_id'] > 0)
include_once("../lrn_agreement_modules/agreement_guarantor_section.php");

include_once("../lrn_agreement_modules/agreement_document_section.php");
?>
</div>

<?php include_once("footer_copyright.php"); ?>