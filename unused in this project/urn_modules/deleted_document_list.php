<?php
//get deleted document list

$query_get_deleted_document_list = "SELECT * FROM urn_document_upload_history WHERE lead_id = '".$_REQUEST['lead_id']."' AND is_deleted = 1 ORDER BY deletion_datentime DESC";
$result_get_deleted_document_list = mysqli_query($con, $query_get_deleted_document_list);
$total_deleted_documents = mysqli_num_rows($result_get_deleted_document_list);

if($total_deleted_documents)
{
    echo "<h5 class='text-danger mt-5'>Deleted Documents</h5>";
    echo "<div>";
    echo "<table class='table table-sm table-bordered table-hover table-striped fs-9'>";
    echo "<thead class='table-danger text-center'>
        <tr>
        <th>Name</th>
        <th>Date</th>
        <th>Time</th>
        <th>By</th>
        <th>Role</th>
        <th>Remark</th>
        </tr>
        </thead>
        <tbody>";

    while($deleted_document = mysqli_fetch_assoc($result_get_deleted_document_list))
    {
        if(substr($deleted_document['deleted_by'],0,2) == 'ST')
        {
            $deleted_by = getFieldValue('name','id',substr($deleted_document['deleted_by'],2),'students',$con);
            $deleter_type_id = 5;
        }
        else if(substr($deleted_document['deleted_by'],0,2) == 'BS')
        {
            $deleted_by = getFieldValue('name','id',substr($deleted_document['deleted_by'],2),'staff_list',$con);
            $deleter_type_id = getFieldValue('role_type','id',substr($deleted_document['deleted_by'],2),'staff_list',$con);
        }
        else if(substr($deleted_document['deleted_by'],0,2) == 'SA')
        {
            $deleted_by = getFieldValue('name','id',substr($deleted_document['deleted_by'],2),'agent_list',$con);
            $deleter_type_id = 4;
        }
        else if(substr($deleted_document['deleted_by'],0,2) == 'SP')
        {
            $deleted_by = getFieldValue('name','id',substr($deleted_document['deleted_by'],2),'sales_person_list',$con);
            $deleter_type_id = 6;
        }
        else if(substr($deleted_document['deleted_by'],0,2) == 'PV')
        {
            $deleted_by = "Portal Visitor";
            $deleter_type_id = 9;
        }

        if(isset($deleter_type_id))
        $deleter_type = getFieldValue('description','id',$deleter_type_id,'login_type_list',$con);

        echo "<tr>
            <td class='ps-2'>".str_replace('academic/','',$deleted_document['file_name'])."</td>
            <td>".date('d-M-Y', $deleted_document['deletion_datentime'])."</td>
            <td>".date('h:i:s A', $deleted_document['deletion_datentime'])."</td>
            <td>".$deleted_by."</td>
            <td>".$deleter_type."</td>
            <td>".$deleted_document['deletion_remark']."</td>
            </tr>";
    }
    echo "</tbody></table>";
    echo "</div>";
}
?>