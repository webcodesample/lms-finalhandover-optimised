<?php
include_once("common_include.php");
require '../vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\IOFactory;

$import_msg = "";
$duplicacy_error = "";
$error_msg = "";

//upload xlsx file for import
if(isset($_FILES) && $_FILES)
{
    $newfilename = "leads.".pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);
    if(move_uploaded_file($_FILES['file']['tmp_name'], "../uploads/".$newfilename))
    {
        // Path to your Excel file
        $inputFileName = '../uploads/leads.xlsx';

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
        
                // Assuming the Excel columns are: Name, Mobile, Email, Source
                $name = $rowData[0][0];
                $mobile = $rowData[0][1];
                $email = $rowData[0][2];
                $source = $rowData[0][3];

                //check lead source already exist OR not
                if(getRowCount('description',$source,'lead_sources_list',$con))
                {                    
                    $source_id = getFieldValue('id','description',$source,'lead_sources_list',$con);
                    $where_con = [
				                    'email' => $email,
                                    'mobile' => $mobile,
			                    ];

	                if(getRowCountMultiCol(setWhereClause($where_con),'temp_leads',$con) == 0 && getRowCountMultiCol(setWhereClause($where_con),'customers_list',$con) == 0)
	                {
                        // Insert temp_leads data into the database
                        $temp_lead_data = [
                                            'name' => $name,
                                            'mobile' => $mobile,
                                            'email' => $email,
                                            'datentime' => strtotime('now'),
                                            'creator_id' => $_SESSION['userid'],
                                            'creator_type' => $_SESSION['login_type'],
                                            'source_id' => $source_id
                                            ];
                        insertData('temp_leads',$temp_lead_data,$con);
                    }
                }
            }
        }
        catch (Exception $e) 
        {
            die('Error loading file "' . pathinfo($inputFileName, PATHINFO_BASENAME) . '": ' . $e->getMessage());
        }
        unlink($inputFileName);
    }
    header("Location:temp_leads.php");
}
else
{
    include_once("import_leads_content.php");
}
?>
