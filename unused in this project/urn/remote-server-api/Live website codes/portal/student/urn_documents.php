<form action="upload_documents.php" method="post" enctype="multipart/form-data">
<input type="hidden" name="urn" value="<?=$lead['urn']?>">
<input type="hidden" name="lead_id" value="<?=$_REQUEST['lead_id']?>">
  <?php
    $query_view_predefined_document_list = "SELECT * FROM document_list";
    $result_view_predefined_document_list = mysqli_query($con, $query_view_predefined_document_list);
    $total_predefined_documents = mysqli_num_rows($result_view_predefined_document_list);
    echo "<div class='pt-3'><table class='table table-sm table-borderless w-auto fs-9'>";
    $iframe_column = "";
    while($predefined_document_list = mysqli_fetch_assoc($result_view_predefined_document_list))
    {
        if($predefined_document_list['name'] != 'Student Photo' && $predefined_document_list['uploaded_file_name'] != 'student_photo')
            $accepted_type = ".jpg,.jpeg,.pdf";
        else
            $accepted_type = ".jpg,.jpeg";

        if($predefined_document_list['id'] == 1)
        {
            echo "<tr>
                <td valign='middle'>".$predefined_document_list['name']."</td>
                <td class='ps-5'>
                <input type='file' class='form-control form-control-sm' name='".$predefined_document_list['uploaded_file_name']."' accept='".$accepted_type."' ".$field_visibility.">
                </td>
                <td valign='top' rowspan='".($total_predefined_documents+2)."' class='ps-5'>
                <iframe id='preview' class='border border-secondary' style='width:400px;height:380px;display:none;'></iframe>
                </td>
                </tr>";
        }
        else
        {
            echo "<tr>
                <td valign='middle'>".$predefined_document_list['name']."</td>
                <td class='ps-5'>
                <input type='file' class='form-control form-control-sm' name='".$predefined_document_list['uploaded_file_name']."' accept='".$accepted_type."' ".$field_visibility.">
                </td>
                </tr>";
        }
    }
    echo "<tr>
        <td valign='middle'>Additional Documents</td>
        <td class='ps-5'><input type='file' class='form-control form-control-sm' name='more_documents[]' id='more_documents' accept='.jpeg,.jpg,.pdf' onChange='checkDocsLimit()' multiple ".$field_visibility."></td>
        </tr>
        <tr>
        <td colspan='2' align='center'><br>
        <input type='hidden' name='return_url' value='urn_details.php?lead_id=".$_REQUEST['lead_id']."&tab=documents'>
        <button type='submit' class='btn btn-primary btn-sm' ".$field_visibility.">Upload Documents</button>
        <input type='button' class='btn btn-danger btn-sm' id='btn_hide_preview' onClick='hidePreview()' value='Close Preview' disabled>
        </td>
        </tr>";
    echo "</table></div>";

    //get uploaded document lists    
    $folder = "../urn/ca".$lead['urn'];

    $query_get_uploaded_document_list = "SELECT * FROM urn_document_upload_history WHERE lead_id = '".$_REQUEST['lead_id']."' ORDER BY datentime DESC";
    $result_get_uploaded_document_list = mysqli_query($con, $query_get_uploaded_document_list);
    $total_documents = mysqli_num_rows($result_get_uploaded_document_list);

    if($total_documents)
    {
        echo "<h4 class='text-dark'>Documents Available</h4>";
        echo "<div>";
        echo "<table class='table table-sm table-bordered table-hover table-striped fs-9'>";
        echo "<thead class='table-info text-center'>
            <tr>
            <th>Document Name</th>
            <th>Upload Date&Time</th>
            <th>Uploaded By</th>
            <th>Action</th>
            </tr>
            </thead>
            <tbody>";

        while($uploaded_document = mysqli_fetch_assoc($result_get_uploaded_document_list))
        {
            if($uploaded_document['upload_by'] == $_SESSION['student_ref_id'])
            {
                $upload_by = "You";
            }
            else
            {
                $upload_by = "Backend";
            }

            echo "<tr>
                <td>".$uploaded_document['file_name']."</td>
                <td>".date('d-M-Y h:i:s A', $uploaded_document['datentime'])."</td>
                <td>".$upload_by."</td>
                <td>
                <a class='link-success text-decoration-none' href='javascript:showPreview(&quot;".$folder."/".$uploaded_document['file_name']."&quot;)'>Preview</a></li>
                </td>
                </tr>";
        }
        echo "</tbody></table>";
        echo "</div>";
    }
    else
    echo "<h5 class='text-danger'>No Documents Available</h5>";
  ?>
  </form>