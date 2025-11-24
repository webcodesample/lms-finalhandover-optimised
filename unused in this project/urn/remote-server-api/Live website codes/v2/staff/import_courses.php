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
    $newfilename = "courses.".pathinfo($_FILES['file']['name'], PATHINFO_EXTENSION);
    if(move_uploaded_file($_FILES['file']['tmp_name'], "../uploads/".$newfilename))
    {
        // Path to your Excel file
        $inputFileName = '../uploads/courses.xlsx';

        try {
            // Load the Excel file
            $spreadsheet = IOFactory::load($inputFileName);
            $worksheet = $spreadsheet->getActiveSheet();
            $highestRow = $worksheet->getHighestRow(); // e.g. 10
            $highestColumn = $worksheet->getHighestColumn(); // e.g 'F'

            // Loop through each row of the worksheet in turn
            for ($row = 2; $row <= $highestRow; ++$row) { // Start at row 2 to skip headers
                $rowData = $worksheet->rangeToArray('A' . $row . ':' . $highestColumn . $row, NULL, TRUE, FALSE);
        
                // Assuming the Excel columns are: ID, Name, Age
                $name = $rowData[0][0];
                $type = $rowData[0][1];
                $intake = $rowData[0][2];
                $duration = $rowData[0][3];
                $eligibility = $rowData[0][4];
                $university = $rowData[0][5];
                $fee = $rowData[0][6];

                //check university already exist OR not
                if(getRowCount('name',$university,'university_list',$con))
                {
                    $university_id = getFieldValue('id','name',$university,'university_list',$con);
                    $where_con = [
				                    'name' => $name,
				                    'university_id' => $university_id,
			                    ];

	                if(getRowCountMultiCol(setWhereClause($where_con),'course_list',$con) == 0)
	                {
                        // Insert data into the database
                        $sql = "INSERT INTO course_list (name, type, intake, duration, eligibility, university_id, fee) VALUES ('$name', '$type', '$intake', '$duration', '$eligibility', '$university_id', '$fee')";
                        $result = mysqli_query($con,$sql);
                    }
                    else
                    {
                        if($duplicacy_error == "")
                        $duplicacy_error .= $row;
                        else
                        $duplicacy_error .=", ".$row;
                    }
                }
                else
                {
                    if($import_msg == "")
                    $import_msg .= $university;
                    else
                    $import_msg .=", ".$university;
                }
            }

            if($import_msg != "")
            {
                $error_msg .= "<div class='text-danger'><b>Import Error : </b> Course related to ".$import_msg." can not be imported. Please add university first.</div>";
            }

            if($duplicacy_error != "")
            {
                $error_msg .= "<br><div class='text-danger'><b>Duplicate Data : </b> Row ".$duplicacy_error." Already Exist.</div>";
            }

            if($duplicacy_error == "" && $import_msg == "")
            {
                $error_msg .= "<br><div class='text-success fw-bold'>Data Inserted Successfully.</div>";
            }
        } catch (Exception $e) {
            die('Error loading file "' . pathinfo($inputFileName, PATHINFO_BASENAME) . '": ' . $e->getMessage());
        }
        unlink($inputFileName);
    }
}

include_once("import_courses_content.php");
?>
