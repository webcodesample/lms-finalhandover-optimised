<?php
include_once("common_include.php");
include_once("../common/ledger-schedule-functions.php");
require '../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\IOFactory;

$import_msg = "";
$error_msg = "";

//upload xlsx file for import
if(isset($_FILES) && $_FILES)
{
    $newfilename = "lans.".pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);
    if(move_uploaded_file($_FILES['file']['tmp_name'], "../uploads/".$newfilename))
    {
        // Path to your Excel file
        $inputFileName = '../uploads/lans.xlsx';

        try 
        {
            // Load the Excel file
            $spreadsheet = IOFactory::load($inputFileName);
            $worksheet = $spreadsheet->getActiveSheet();
            $highestRow = $worksheet->getHighestRow(); // e.g. 10
            $highestColumn = $worksheet->getHighestColumn(); // e.g 'F'

            // Loop through each row of the worksheet in turn
            for ($row = 2; $row <= $highestRow; ++$row) 
            { // Start at row 2 to skip headers
                $rowData = $worksheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);

                // Assuming the Excel columns are: LAN, Amount, Date
                $lan = $rowData[0][0];
                $amount = $rowData[0][1];
                $dispatchDate = $rowData[0][2];

                //check lan exist OR not
                if(getRowCount('lan',$lan,'dispatch_list',$con))
                {
                    if(getFieldValue('status','lan',$lan,'dispatch_list',$con) == 0)
                    approveLANDispatch($lan,$con);
                }
            }
        } 
        catch (Exception $e) 
        {
            die('Error loading file "' . pathinfo($inputFileName, PATHINFO_BASENAME) . '": ' . $e->getMessage());
        }
        unlink($inputFileName);
    }
    header("Location:dispatch_list.php");
}
else
{
    include_once("import_bank_sheet_content.php");
}

function approveLANDispatch($lan,$con)
{
    mysqli_query($con,"UPDATE dispatch_list SET status = 1 WHERE lan = ".$lan);
    $lan_data = getLatestUpdateRow('lan',$lan,'lan_audit_history',$con);
	unset($lan_data['id'],$lan_data['updation_remark'],$lan_data['updated_columns']);

	mysqli_query($con,"UPDATE dispatch_list SET status = 1 WHERE lan = ".$lan);

	$lan_data['updation_remark'] = 'LAN Dispatched & Amount Disbursed';
	$lan_data['datentime'] = strtotime('now');
	
	insertData('lan_audit_history',$lan_data,$con);

	//insert lan_activity_history
	$lan_activty_info_array = [
								'lan' => $lan,
								'lrn' => $lan_data['lrn'],
								'comment' => 'LAN Dispatch & Amount Disbursed',
								'activity_by' => $_SESSION['user_ref_id'],
								'datentime' => strtotime('now'),
								];
	insertData('lan_activity_history',$lan_activty_info_array,$con);
	createRepaymentSchedule($lan_data,$con);
	createLedger($lan_data,$con);
}
?>