<?php
function getAcceptedImageType($predefined_document_name,$uploaded_file_name)
{
	if($predefined_document_name != 'Student Photo' && $uploaded_file_name != 'student_photo')
        return ".jpg,.jpeg,.pdf";
    else
        return ".jpg,.jpeg";
}

function displayRequired($document_required_status)
{
    if($document_required_status)
    return "<span class='text-danger fw-bold'> *</span>";
    else
    return "";
}

function documentUploadStatus($lead_urn,$uploaded_file_name,$con)
{
    if(checkDocumentUploadCount($lead_urn,$uploaded_file_name,$con) > 0)
	return "<span class='text-success'> (Uploaded)</span>";
    else
    return "<span class='text-danger'> (Not Uploaded)</span>";
}

function setViewOnlyMode($urn_using_by_me_status)
{
    if($urn_using_by_me_status)
        return "";
    else
        return "You are in 'View Only' Mode";
}

function setBtnVisibilityClass($urn_using_by_me_status)
{
    if($urn_using_by_me_status)
        return "";
    else
        return "d-none";
}

function callAdminModule($moduleName,$submenuItem,$con,$moduleData = '')
{
    if(validateStaffAccessRight($submenuItem,$con))
	    include_once("admin_modules/".$moduleName.".php");
    else
	    setAccessDeniedMsg();
}

function setAccessDeniedMsg()
{
    echo "<div class='container mt-5 text-center text-danger fw-bold'>Restricted Area</div>";
}

function showActionPerformAlert($action_perform_msg)
{
    if($action_perform_msg)
    echo "<script> $(document).ready(function(){
            $('#alertModal').modal('show');
            }); </script>";
}

function validateStaffAccessRight($submenuItem,$con)
{
    $flag = 0;
    $authStatus = 0;
    $result = mysqli_fetch_assoc(mysqli_query($con, 'SELECT authorised_submenu_options FROM staff_list WHERE id = '.$_SESSION['userid']));
    $authorised_submenu_options = explode(',',$result['authorised_submenu_options']);

    $submenu_id_list = mysqli_query($con, "SELECT id FROM submenu_items WHERE description = '".$submenuItem."'");

    while($submenu = mysqli_fetch_assoc($submenu_id_list))
    {
        if(in_array($submenu['id'],$authorised_submenu_options))
        $flag = 1;
    }

    if(in_array($_SESSION['login_type'],array(1,2,8,7)) || $flag)
    $authStatus = 1;

    return $authStatus;
}

?>