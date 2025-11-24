<div class="d-flex rounded-2 border border-secondary-subtle gap-1 justify-content-end">
<?php
if($lrnAgreementCount > 0)
{
    if(checkSignedAgreementUploadStatus($_REQUEST['lrn'],$con) == 0)
    echo createOptBtns('uploadSignedAgreementModal','upload.png',25,'Upload Signed Agreement');

    if($current_status_description == 'Verified')
    $href = "view_lrn_agreement.php?lrn=".$_REQUEST['lrn'];
    else
    {
        $file_name = mysqli_fetch_assoc(mysqli_query($con,"SELECT file_name FROM lrn_document_upload_history WHERE file_name LIKE '%signed_agreement%' AND lrn = ".$_REQUEST['lrn']." AND is_deleted = 0"))['file_name'];
        $href = "../lrn/la".$_REQUEST['lrn']."/".$file_name;
    }

    echo "<a class='btn btn-subtle-secondary btn-sm p-1' href='".$href."' target='_blank' title='View Agreement'>
        <img src='../portal-icons/viewagreement.png' height='25 px'>
        </a>";
    $generateAgreementBtn = "disabled";
}

if($current_status_description == 'Verified')
echo createOptBtns('generateAgreementModal','create-agreement.png',25,'Generate Agreement',$generateAgreementBtn);

if(in_array($_SESSION['login_type'],array(1,2,3,7,8)) && !in_array($current_status_description,$finalise_status_array))
echo createOptBtns('staticBackdrop','arrow.png',22,'Move to Next Status',$update_status_btn);

if($callback_exist_flag == 0)
{
    $setCallBackBtn = createOptBtns('urnLeadCommunication','call-back.png',25,'Set Call Back');
    if(!in_array($current_status_description,$finalise_status_array))
    echo $setCallBackBtn;
    else if($current_status_description == 'Pending')
    {
        if(checkLoginType($_SESSION['login_type']) == 1)
        echo $setCallBackBtn;
    }
}

if(in_array($_SESSION['login_type'],array(1,2,3,7,8)))
{
    if(!in_array($current_status_description,$finalise_status_array))
    echo createOptBtns('killLead','trash.png',22,'Delete/Reject LRN');

    if(checkLoginType($_SESSION['login_type']) == 1)
    {
        if($current_status_description == 'Pending')
        echo "<input type='button' class='btn btn-subtle-danger btn-sm me-1' data-bs-toggle='modal' data-bs-target='#approveDeletion' value='Approve Deletion'>";
    }
}

function createOptBtns($modalId,$iconImg,$iconImgHeight,$title,$btnStatus='')
{
    return "<button type='button' class='btn btn-sm btn-subtle-secondary p-1' data-bs-toggle='modal' data-bs-target='#".$modalId."' title='".$title."' ".$btnStatus.">
        <img src='../portal-icons/".$iconImg."' height='".$iconImgHeight." px'>
        </button>"; 
}
?>
</div>