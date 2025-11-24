<?php
    //get uploaded document lists    
    $folder = "../urn/ca".$lead['urn'];

    $query_get_uploaded_document_list = "SELECT * FROM urn_document_upload_history WHERE lead_id = '".$_REQUEST['lead_id']."' AND is_deleted = 0 ORDER BY datentime DESC";
    $result_get_uploaded_document_list = mysqli_query($con, $query_get_uploaded_document_list);
    $total_documents = mysqli_num_rows($result_get_uploaded_document_list);

    if($total_documents)
    {
        echo "<h5 class='text-info'>Uploaded Documents</h5>";
        echo "<div>";
        echo "<table class='table table-sm table-bordered table-hover table-striped fs-9'>";
        echo "<thead class='table-info text-center'>
            <tr>
            <th>Name</th>
            <th>Date</th>
            <th>Time</th>
            <th>By</th>
            <th>Role</th>
            <th>Action</th>
            </tr>
            </thead>
            <tbody>";

        while($uploaded_document = mysqli_fetch_assoc($result_get_uploaded_document_list))
        {
            if(substr($uploaded_document['upload_by'],0,2) == 'ST')
            {
                $upload_by = getFieldValue('name','id',substr($uploaded_document['upload_by'],2),'students',$con);
                $uploader_type_id = 5;
            }
            else if(substr($uploaded_document['upload_by'],0,2) == 'BS')
            {
                $upload_by = getFieldValue('name','id',substr($uploaded_document['upload_by'],2),'staff_list',$con);
                $uploader_type_id = getFieldValue('role_type','id',substr($uploaded_document['upload_by'],2),'staff_list',$con);
            }
            else if(substr($uploaded_document['upload_by'],0,2) == 'SA')
            {
                $upload_by = getFieldValue('name','id',substr($uploaded_document['upload_by'],2),'agent_list',$con);
                $uploader_type_id = 4;
            }
            else if(substr($uploaded_document['upload_by'],0,2) == 'SP')
            {
                $upload_by = getFieldValue('name','id',substr($uploaded_document['upload_by'],2),'sales_person_list',$con);
                $uploader_type_id = 6;
            }
            else if(substr($uploaded_document['upload_by'],0,2) == 'PV')
            {
                $upload_by = "Portal Visitor";
                $uploader_type_id = 9;
            }

            if($_SESSION['login_type'] == 1 || $_SESSION['login_type'] == 7)
            {
                $delete_icon = "<a class='".setBtnVisibilityClass($urn_using_by_me)."' data-bs-toggle='modal' data-bs-target='#deleteURNDocument' onClick='addDataToURNDocumentDeletionModal(".$uploaded_document['id'].")' ".$field_visibility."><img src='../portal-icons/delete.png' height='20px' width='20px'></a>";
            }
            else
            {
                $delete_icon = "";
            }

            if(isset($uploader_type_id))
            $uploader_type = getFieldValue('description','id',$uploader_type_id,'login_type_list',$con);

            echo "<tr>
                <td class='ps-2'>".str_replace('academic/','',$uploaded_document['file_name'])."</td>
                <td>".date('d-M-Y', $uploaded_document['datentime'])."</td>
                <td>".date('h:i:s A', $uploaded_document['datentime'])."</td>
                <td>".$upload_by."</td>
                <td>".$uploader_type."</td>
                <td>
                <a class='link-success text-decoration-none' href='javascript:showPreview(&quot;".$folder."/".$uploaded_document['file_name']."&quot;)'>
                <span class='text-primary' data-feather='eye' style='height: 20px; width: 20px;'></span>
                </a>
                ".$delete_icon."
                </td>
                </tr>";
        }
        echo "</tbody></table>";
        echo "</div>";
    }
    else
    echo "<h5 class='text-danger'>No Documents Available</h5>";
?>