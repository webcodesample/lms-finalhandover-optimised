<?php
$lrn = getLatestUpdateRow('lrn',$_REQUEST['lrn'],'lrn_audit_history',$con);

$next_status_description = "";
$field_visibility = "";
$update_status_btn = "";
$generateAgreementBtn = "disabled";
$lrnAgreementCount = getRowCount('lrn',$_REQUEST['lrn'],'lrn_agreements_list',$con);

$mandatory_documents_upload_status = checkMandatoryDocumentsUploadStatus($lrn['lrn'],$con);

$current_status_description = getFieldValue('description','id',$lrn['status_id'],'lead_status_list',$con);
$current_status_step_order = getFieldValue('step_order','id',$lrn['status_id'],'lead_status_list',$con);

if($current_status_step_order < 4)
{
    $next_status_step_order = $current_status_step_order+1;
    $next_status_description = getFieldValue('description','step_order',$next_status_step_order,'lead_status_list',$con);
    $next_status_description = "<img src='../portal-icons/arrow.png' height='15 px'> ".$next_status_description;
}

if(in_array($current_status_description,$finalise_status_array))
{
    $field_visibility = "disabled";
    $update_status_btn = "disabled";
}

if($current_status_description == 'Verified')
{
    $field_visibility = "disabled";
    if(checkSignedAgreementUploadStatus($_REQUEST['lrn'],$con) == 0)
    {
        $update_status_btn = "disabled";
        $generateAgreementBtn = "";
    }
}

if($current_status_step_order == 2 && $mandatory_documents_upload_status == 0)
$update_status_btn = "disabled";

if($lrn_using_by_me == 0)
$field_visibility = "disabled";
?>

<div class="d-flex justify-content-between align-items-center">
    <div class="d-flex">
        <img class="rounded-circle mx-1" src="<?=getLatestLRNProfilePic($_REQUEST['lrn'],$con)?>" height="30px" width="30px">
    
        <div>
        <span class="text-primary fw-bold"><?=strtoupper($lrn['name'])?></span>
        <span class="text-success fw-bold">  LA<?=$lrn['lrn']?></span>
        </div>
    </div>
    <div>
    <span class="text-primary fw-bold"><?=$current_status_description?></span>
    <span class="text-success fw-bold"><?=$next_status_description?></span>
    </div>
</div>