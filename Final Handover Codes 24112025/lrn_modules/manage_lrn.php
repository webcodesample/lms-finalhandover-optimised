<?php
include_once("common_include.php");

$current_alloted_staff_name = "";

if(isset($_REQUEST['tab']))
$requested_tab = $_REQUEST['tab'];
else
$requested_tab = 'summary';

$tabs_array = ['summary','profile','loan_detail','documents','guarantor','company_detail','history','communication_history','audit_history'];

//inputs design variables
$disabled_input_red = "class='form-control form-control-sm fw-bold text-danger m-1' style='width:200px' disabled";
$disabled_input_green = "class='form-control form-control-sm fw-bold text-success m-1' style='width:200px' disabled";

$input_box_design = "class='form-control form-control-sm m-1' style='width:200px'";
$required_input_box_design = "class='form-control form-control-sm m-1' style='width:200px' required";
$readonly_input_box_design = "class='form-control form-control-sm m-1' style='width:200px' readonly";

$textarea_design = "class='form-control form-control-sm m-1' style='width:200px; height:100px;'";
$required_textarea_design = "class='form-control form-control-sm m-1' style='width:200px; height:100px;' required";
$readonly_textarea_design = "class='form-control form-control-sm m-1' style='width:200px; height:100px;' readonly";

$lead_allocation_count = getRowCount('lrn',$_REQUEST['lrn'],'lrn_allocation_list',$con);

if($lead_allocation_count > 0)
{
    $allocated_id = getLatestUpdate('allocated_id','lrn',$_REQUEST['lrn'],'lrn_allocation_list',$con);
    if(substr($allocated_id,0,2) == 'SA')
    $lrn_allocation_id = $allocated_id." - ".getFieldValue('name','id',substr($allocated_id,2),'agent_list',$con);
    else if(substr($allocated_id,0,2) == 'SP')
    $lrn_allocation_id = $allocated_id." - ".getFieldValue('name','id',substr($allocated_id,2),'sales_person_list',$con);
}
else
$lrn_allocation_id = "Not Allocated";

//Lead Status for Comparision as lead reached at its final status
$finalise_status_array = ['Deleted','Complete','Pending','Fee Paid'];

//get urn call back already exist for future or not
/*$callback_search_query = "SELECT * FROM callback_list WHERE lead_id = ".$_REQUEST['lead_id']." AND callback_datentime > ".strtotime('now');
$callback_search_result = mysqli_query($con,$callback_search_query);
if(mysqli_num_rows($callback_search_result) > 0)
    $callback_exist_flag = 1;
else*/
    $callback_exist_flag = 0;

include_once("content_layout.php");
?>
