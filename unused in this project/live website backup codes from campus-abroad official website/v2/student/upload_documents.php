<?php
include_once("common_include.php");

//urn folder path
$urn_folder = "../urn/ca".$_REQUEST['urn']."/";
$student_id = 'ST'.$_SESSION['userid'];

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

				//insert into urn_document_upload_history
				$document_upload_info = [
											'lead_id' => $_REQUEST['lead_id'],
											'urn' => $_REQUEST['urn'],
											'file_name' => $newfilename,
											'datentime' => strtotime('now'),
											'upload_by' => $student_id,
										];
				
				insertData('urn_document_upload_history', $document_upload_info, $con);
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

			//insert into urn_document_upload_history
			$document_upload_info = [
										'lead_id' => $_REQUEST['lead_id'],
										'urn' => $_REQUEST['urn'],
										'file_name' => $newfilename,
										'datentime' => strtotime('now'),
										'upload_by' => $student_id,
									];
		
			insertData('urn_document_upload_history', $document_upload_info, $con);
		}
	}
}

$current_status_id = getFieldValue('status_id','id',$_REQUEST['lead_id'],'leads_details',$con);

//insert new lead activity record
$activty_info_array = [
						'lead_id' => $_REQUEST['lead_id'],
						'status_id' => $current_status_id,
						'comment' => 'Documents Uploaded',
						'activity_by' => $_SESSION['user_ref_id'],
						'datentime' => strtotime('now'),
					];

insertData('leads_activity_history', $activty_info_array, $con);

//get latest urn_audit_history row data
$urn_latest_info  = getLatestUpdateRow('lead_id',$_REQUEST['lead_id'],'urn_audit_history',$con);

//insert urn_audit_history
$urn_audit_history_array = [
							'lead_id' => $_REQUEST['lead_id'],
							'course_id' => $urn_latest_info['course_id'],
							'status_id' => $urn_latest_info['status_id'],
							'student_name' => $urn_latest_info['student_name'],
							'student_dob' => $urn_latest_info['student_dob'],
							'student_mobile' => $urn_latest_info['student_mobile'],
							'student_mobile_alt' => $urn_latest_info['student_mobile_alt'],
							'student_email' => $urn_latest_info['student_email'],
							'student_address' => $urn_latest_info['student_address'],
							'student_brief_note' => $urn_latest_info['student_brief_note'],
							'highest_education_type' => $urn_latest_info['highest_education_type'],
							'highest_education_name' => $urn_latest_info['highest_education_name'],
							'highest_education_from_year' => $urn_latest_info['highest_education_from_year'],
							'highest_education_to_year' => $urn_latest_info['highest_education_to_year'],
							'highest_education_institution' => $urn_latest_info['highest_education_institution'],
							'highest_education_institution_city' => $urn_latest_info['highest_education_institution_city'],
							'highest_education_institution_country' => $urn_latest_info['highest_education_institution_country'],
							'test_taken_flag' => $urn_latest_info['test_taken_flag'],
							'test_name' => $urn_latest_info['test_name'],
							'other_test_name' => $urn_latest_info['other_test_name'],
							'passport_number' => $urn_latest_info['passport_number'],
							'passport_place_of_issue' => $urn_latest_info['passport_place_of_issue'],
							'passport_issued_on' => $urn_latest_info['passport_issued_on'],
							'passport_valid_till' => $urn_latest_info['passport_valid_till'],
							'passport_holder_name' => $urn_latest_info['passport_holder_name'],
							'passport_holder_surname' => $urn_latest_info['passport_holder_surname'],
							'immigration_applied' => $urn_latest_info['immigration_applied'],
							'immigration_detail' => $urn_latest_info['immigration_detail'],
							'past_visa_refusal_status' => $urn_latest_info['past_visa_refusal_status'],
							'past_visa_refusal_detail' => $urn_latest_info['past_visa_refusal_detail'],
							'serious_medical_status' => $urn_latest_info['serious_medical_status'],
							'medical_condition_detail' => $urn_latest_info['medical_condition_detail'],
							'criminal_offence_status' => $urn_latest_info['criminal_offence_status'],
							'criminal_offence_detail' => $urn_latest_info['criminal_offence_detail'],
							'updation_remark' => 'Documents Uploaded By '.$_SESSION['user_ref_id'],
							'datentime' => strtotime('now'),
							];

insertData('urn_audit_history', $urn_audit_history_array, $con);

//create email history
urnupdationEmailHistory('Document Upload',$urn_latest_info['lead_id'],$urn_latest_info['student_email'],$con);

header("Location:".$_REQUEST['return_url']);

?>