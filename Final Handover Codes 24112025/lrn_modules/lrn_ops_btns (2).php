<div class="d-flex justify-content-end gap-2 mb-3">
<?php
    /*if(checkLoginType($_SESSION['login_type']) == 1)
    {
        if(!in_array($current_status_description,$finalise_status_array))
        {
            if($lead_allocation_count)
            echo "<input type='button' class='btn btn-subtle-warning btn-sm me-1' data-bs-toggle='modal' data-bs-target='#manageLead' value='Reallocate'>";
            else
            echo "<input type='button' class='btn btn-subtle-warning btn-sm me-1' data-bs-toggle='modal' data-bs-target='#manageLead' value='Allocate'>";
        }
    }*/
    if($lrnAgreementCount > 0)
    {
        if(checkSignedAgreementUploadStatus($_REQUEST['lrn'],$con) == 0)
        echo "<input type='button' class='btn btn-subtle-warning btn-sm ".setBtnVisibilityClass($urn_using_by_me)."' data-bs-toggle='modal' data-bs-target='#uploadSignedAgreementModal' value='Upload Signed Agreement' ".$generateAgreementBtn.">";

        echo "<a class='btn btn-subtle-warning btn-sm ".setBtnVisibilityClass($urn_using_by_me)."' href='view_lrn_agreement.php?lrn=".$_REQUEST['lrn']."' target='_blank'>View Agreement</a>";
        $generateAgreementBtn = "disabled";
    }

    if($current_status_description == 'Verified')
    echo "<input type='button' class='btn btn-subtle-warning btn-sm ".setBtnVisibilityClass($urn_using_by_me)."' data-bs-toggle='modal' data-bs-target='#generateAgreementModal' value='Generate Agreement' ".$generateAgreementBtn.">";

    if(in_array($_SESSION['login_type'],array(1,2,3,7,8)))
    echo createOptBtns('staticBackdrop','arrow.png',22,'Move to Next Status');
    //echo "<input type='button' class='btn btn-subtle-primary btn-sm ".setBtnVisibilityClass($urn_using_by_me)."' data-bs-toggle='modal' data-bs-target='#staticBackdrop' value='Move to Next Status' ".$update_status_btn.">";

    if($callback_exist_flag == 0)
    {
        if(!in_array($current_status_description,$finalise_status_array))
            echo "<input type='button' class='btn btn-subtle-success btn-sm me-1' data-bs-toggle='modal' data-bs-target='#urnLeadCommunication' value='Communication'>";
        else if($current_status_description == 'Pending')
        {
            if(checkLoginType($_SESSION['login_type']) == 1)
            echo "<input type='button' class='btn btn-subtle-success btn-sm me-1' data-bs-toggle='modal' data-bs-target='#urnLeadCommunication' value='Communication'>";
        }
    }

    if(in_array($_SESSION['login_type'],array(1,2,3,7,8)))
    {
        if(!in_array($current_status_description,$finalise_status_array))
        echo createOptBtns('killLead','trash.png',22,'Delete/Reject');

        if(checkLoginType($_SESSION['login_type']) == 1)
        {
            if($current_status_description == 'Pending')
            echo "<input type='button' class='btn btn-subtle-danger btn-sm me-1' data-bs-toggle='modal' data-bs-target='#approveDeletion' value='Approve Deletion'>";
        
            if($current_status_description == 'Applied')
            echo "<input type='button' class='btn btn-subtle-danger btn-sm' data-bs-toggle='modal' data-bs-target='#urnRejected' value='URN Rejected'>";

            if($current_status_description == 'Visa Applied')
            echo "<input type='button' class='btn btn-subtle-danger btn-sm' data-bs-toggle='modal' data-bs-target='#visaRejected' value='VISA Rejected'>";
        }
    }

    function createOptBtns($modalId,$iconImg,$iconImgHeight,$title)
    {
        return "<button type='button' class='btn btn-sm me-1 p-0' data-bs-toggle='modal' data-bs-target='#".$modalId."' title='".$title."'>
            <img src='../portal-icons/".$iconImg."' height='".$iconImgHeight." px'>
            </button>"; 
    }
?>
</div>