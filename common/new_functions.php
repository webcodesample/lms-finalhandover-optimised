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

function setViewOnlyMode($lrn_using_by_me_status)
{
    if($lrn_using_by_me_status)
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

//code added on 15-04-2025 below this point

function setTabTitleFormat($tabTitle)
{
    return ucwords(str_replace('_',' ',str_replace('lms_','LMS ',$tabTitle)));
}

function setColor($prefix = '')
{
    $colors = ['success','danger','warning','primary','info'];
    shuffle($colors);

    if($prefix)
    $color = $prefix.'-'.$colors[0];
    else
    $color = $colors[0];

    return $color;
}

function generateTabsList($requestedTab,$tabsArray,$targetUrlSuffix = '')
{
	$inactive_tab_pointer = "";
    $active_tab_pointer = " style='pointer-events: none;'";
    $active_link_color = setColor('link');

	$tabs_list = "<ul class='nav nav-underline fs-9'>";

	for($i=0; $i<count($tabsArray); $i++)
	{
        if($targetUrlSuffix)
		$href = " href='?".$targetUrlSuffix."&tab=".$tabsArray[$i]."'";
        else
        $href = " href='?tab=".$tabsArray[$i]."'";

		if($tabsArray[$i] == $requestedTab)
		$tabs_list .=  "<li class='nav-item'><a ".$href." class='nav-link active ".$active_link_color."'".$active_tab_pointer.">".setTabTitleFormat($tabsArray[$i])."</a></li>";
		else
		$tabs_list .=  "<li class='nav-item'><a ".$href." class='nav-link'".$inactive_tab_pointer.">".setTabTitleFormat($tabsArray[$i])."</a></li>";
	}

	$tabs_list .= "</ul>";
	return $tabs_list;
}

function copyFolderContents($src, $dst) {
    // Check if source folder exists
    if (!is_dir($src)) {
        echo "Source folder does not exist.";
        return false;
    }

    // Create destination folder if it doesn't exist
    if (!file_exists($dst)) {
        mkdir($dst, 0777, true); // true allows recursive directory creation
    }

    // Open the source directory
    $dir = opendir($src);

    while (($file = readdir($dir)) !== false) {
        if ($file === '.' || $file === '..') continue;

        $srcPath = $src . DIRECTORY_SEPARATOR . $file;
        $dstPath = $dst . DIRECTORY_SEPARATOR . $file;

        if (is_dir($srcPath)) {
            // Recursively copy subfolders
            copyFolderContents($srcPath, $dstPath);
        } else {
            // Copy file
            copy($srcPath, $dstPath);
        }
    }

    closedir($dir);
    return true;
}

function createDll($destDir, $content)
{
    $dllPath = $destDir . DIRECTORY_SEPARATOR . 'dll.txt';
    file_put_contents($dllPath, $content);
}

function createLMSDb($dbName)
{
    $con = mysqli_connect('localhost','root','');

	if($con)
	{
		$dbCreationQuery = "CREATE DATABASE ".$dbName." CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci";
		mysqli_query($con,$dbCreationQuery);
	}
    mysqli_close($con);
}

function createLMSDbStructure($dbName)
{
    $con = mysqli_connect('localhost','root','',$dbName);
    $query = file_get_contents('../lms_structure_sql/sql.sql');
    mysqli_multi_query($con,$query);
    mysqli_close($con);
}

function uploadFile($fileInput,$uploadFileName,$uploadDir)
{
    $uploadFileSuccessFlag = 0;

    if(!is_dir($uploadDir))
    mkdir($uploadDir, 0777, true);

    if ($fileInput['error'] === 0) 
    {
        // Get the file extension
        $fileExt = pathinfo($fileInput['name'], PATHINFO_EXTENSION);

        // Create new filename
        $newFileName = $uploadFileName.'.'.$fileExt;
        $uploadPath = $uploadDir . $newFileName;

        if (move_uploaded_file($fileInput['tmp_name'], $uploadPath))
        $uploadFileSuccessFlag = 1;
    }

    return $uploadFileSuccessFlag;
}

function deleteUploadedFile($folder,$fileBasename)
{
    // Find files like "example.jpg", "example.png", etc.
    $matches = glob($folder.$fileBasename . '.*');

    if (!empty($matches)) 
    {
        foreach ($matches as $file) 
        {
            if (is_file($file))
            unlink($file);
        }
    }
}

// new functions on 05-07-205
function getLANCustomer()
{

}

function setCreditLimit($lrn,$approvedAmount,$con)
{    
    $crn = getFieldValue('crn','lrn',$lrn,'lrn_list',$con);
    $current_credit_limit = getFieldValue('credit_limit','id',$crn,'customers_list',$con);
    $new_credit_limit = ($approvedAmount * 120)/100;

    if(($current_credit_limit == 0) || ($current_credit_limit < $new_credit_limit))
    mysqli_query($con,"UPDATE customers_list SET credit_limit = ".$new_credit_limit." WHERE id = ".$crn);
}

function updateCreditLimit($lrn,$new_credit_limit,$con)
{   
    $updationFlag = 0;
    $crn = getFieldValue('crn','lrn',$lrn,'lrn_list',$con);
    $current_credit_limit = getFieldValue('credit_limit','id',$crn,'customers_list',$con);

    if(($current_credit_limit == 0) || ($current_credit_limit < $new_credit_limit))
    {
        mysqli_query($con,"UPDATE customers_list SET credit_limit = ".$new_credit_limit." WHERE id = ".$crn);
        $updationFlag = 1;
    }
    return $updationFlag;
}

function getCreditLimit($lrn,$con)
{    
    $crn = getFieldValue('crn','lrn',$lrn,'lrn_list',$con);
    return getFieldValue('credit_limit','id',$crn,'customers_list',$con);
}


?>