<?php
include_once("common_include.php");

//urn folder path
$urn_folder = "../urn/ca".$_REQUEST['urn']."/";

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
											'upload_by' => 0,
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
										'upload_by' => 0,
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
						'activity_by' => 'Portal User',
						'datentime' => strtotime('now'),
					];

insertData('leads_activity_history', $activty_info_array, $con);

//insert urn_audit_history
$urn_student_id = getFieldValue('student_id','id',$_REQUEST['lead_id'],'leads_details',$con);

$where_con_array = [
					'id' => $urn_student_id,
					];

$student_info = mysqli_fetch_assoc(getRowsDataCon('students',$where_con_array,$con));
$current_lead_course_id = getFieldValue('course_id','id',$_REQUEST['lead_id'],'leads_details',$con);

$urn_audit_history_array = [
							'lead_id' => $_REQUEST['lead_id'],
							'course_id' => $current_lead_course_id,
							'status_id' => $current_status_id,
							'student_name' => $student_info['name'],
							'student_mobile' => $student_info['mobile'],
							'student_email' => $student_info['email'],
							'student_dob' => $student_info['dob'],
							'student_brief_note' => $student_info['brief_note'],
							'updation_remark' => 'Upload by Portal User',
							'datentime' => strtotime('now'),
							];
	
insertData('urn_audit_history', $urn_audit_history_array, $con);


header("Location:../".$_REQUEST['return_url']);

?>