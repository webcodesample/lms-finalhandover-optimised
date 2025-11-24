<div class="d-flex justify-content-end">
<button class="btn btn-sm btn-subtle-danger me-2" onClick="printData()">
<span data-feather="printer" style="height: 20px; width: 20px;"></span>
</button>
<?php setGoBack("leads.php"); ?>
</div>

<div id="myPrintableDiv" class="mt-5">
<center><h5 class="mb-5 bg-danger-subtle py-2">LAN Application Form</h5></center>
<?php
$lan = getLatestUpdateRow('lan',$_REQUEST['lan'],'lan_audit_history',$con);

$where_con_array = [ 'id' => $lan['guarantor_id']];
$guarantor = mysqli_fetch_assoc(getRowsDataCon('guarantor_list',$where_con_array,$con));

$where_con_array = [ 'id' => $lan['bank_account']];
$bank = mysqli_fetch_assoc(getRowsDataCon('bank_accounts_list',$where_con_array,$con));

$product = 'Not Selected';
$introducer = 'Not Selected';
$introducer_code = 'Not Selected';
$lan_created_datentime =  getFieldvalue('approval_datentime','lan',$_REQUEST['lan'],'dispatch_list',$con);

$unchangable_key_val = ['product_id','introducer_id'];

foreach($lan AS $key=>$value)
{
	if(!in_array($key,$unchangable_key_val) && ($value == '' || $value == 0))
	$lan[$key] = '--Not Available--';
}

if($lan['product_id'] > 0)
$product = getFieldvalue('description','id',$lan['product_id'],'product_list',$con);

if($lan['introducer_id'] > 0)
{
	$introducer = getFieldvalue('name','id',$lan['introducer_id'],'introducer_list',$con);
	$introducer_code = 'IR'.(25000+$lan['introducer_id']);
}

include_once("../lan_modules/lan_summary_lan_section.php");
include_once("../lan_modules/lan_summary_profile_section.php");

if($lan['cust_type'] == 2)
include_once("../lan_modules/lan_summary_company_section.php");

include_once("../lan_modules/lan_summary_loan_section.php");
include_once("../lan_modules/lan_summary_bank_section.php");

include_once("../lan_modules/lan_summary_guarantor_section.php");

include_once("../lan_modules/lan_print_document_section.php");
?>
</div>

<?php include_once("footer_copyright.php"); ?>