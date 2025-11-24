<div class="mb-5">
<?php
$where_con_array = [ 'id' => $lan['guarantor_id']];
$guarantor = mysqli_fetch_assoc(getRowsDataCon('guarantor_list',$where_con_array,$con));

$where_con_array = [ 'id' => $lan['bank_account']];
$bank = mysqli_fetch_assoc(getRowsDataCon('bank_accounts_list',$where_con_array,$con));

$product = 'Not Selected';
$introducer = 'Not selected';

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
?>
</div>