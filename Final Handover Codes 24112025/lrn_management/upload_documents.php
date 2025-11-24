<?php
include_once("common_include.php");

//urn folder path
$urn_folder = "../lrn/la".$_REQUEST['lrn']."/";

//check whether urn folder exist or not; if not then create urn folder with full permission
if (!file_exists($urn_folder)) 
{
	mkdir($urn_folder, 0777, true);
}

//allowed file extensions
$file_extension_array = ['.jpg','.jpeg','.pdf'];
//$date_identifier = date("YmdHis");
$date_identifier = strtotime('now');

foreach($_FILES as $key => $value)
{
	//check file input field is multiple or single
	if($key == 'more_documents')
	{
		$total_documents = count($value['name']);
		if($total_documents && $value['name'][0])
		{
			for($i = 0; $i < $total_documents; $i++)
			{
				//upload new file to urn folder
				$newfilename = pathinfo($value['name'][$i], PATHINFO_FILENAME).'_'.$date_identifier.'.'.pathinfo($value['name'][$i], PATHINFO_EXTENSION);
				move_uploaded_file($value['tmp_name'][$i], $urn_folder.$newfilename);

				//insert into lrn_document_upload_history
				recordLRNDocUploadHistory($newfilename,$con);
			}
		}
	}
	else
	{
		if($value['name'])
		{
			//upload new file to urn folder
			$newfilename = $key.'_'.$date_identifier.'.'.pathinfo($value['name'], PATHINFO_EXTENSION);
			move_uploaded_file($value['tmp_name'], $urn_folder.$newfilename);

			//insert into lrn_document_upload_history
			recordLRNDocUploadHistory($newfilename,$con);
		}
	}
}

$_REQUEST['updation_remark'] = 'Documents Uploaded';

//insert new lrn activity record
recordLRNActivityHistory($con);

//insert urn_audit_history
recordLRNAuditHistory([],$con);

//create email history
//urnupdationEmailHistory('Document Upload',$urn_latest_info['lead_id'],$urn_latest_info['student_email'],$con);

header("Location: manage_lrn.php?lrn=".$_REQUEST['lrn']."&tab=documents");
?>