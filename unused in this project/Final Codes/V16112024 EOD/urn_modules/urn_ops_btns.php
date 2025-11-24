<tr class="mb-2">
<td colspan="6" align="right">
<?php
if(checkLoginType($_SESSION['login_type']) == 1)
{
    if(!in_array($current_status_description,$finalise_status_array))
    {
        if($lead_allocation_count)
            echo "<input type='button' class='btn btn-subtle-warning btn-sm me-1' data-bs-toggle='modal' data-bs-target='#manageLead' value='Reallocate'>";
        else
            echo "<input type='button' class='btn btn-subtle-warning btn-sm me-1' data-bs-toggle='modal' data-bs-target='#manageLead' value='Allocate'>";
    }
}

if($callback_exist_flag == 0)
{
    if(!in_array($current_status_description,$finalise_status_array))
        echo "<input type='button' class='btn btn-subtle-success btn-sm me-1' data-bs-toggle='modal' data-bs-target='#urnLeadCommunication' value='Communication'>";
    else if($current_status_description == 'Pending')
    {
        if(checkLoginType($_SESSION['login_type']) == 1)
        echo "<input type='button' class='btn btn-subtle-success btn-sm me-1' data-bs-toggle='modal' data-bs-target='#urnLeadCommunication' value='Communication'>";
    }
}

if(in_array($_SESSION['login_type'],array(1,2,3,7,8)))
{
    if(!in_array($current_status_description,$finalise_status_array))
        echo "<input type='button' class='btn btn-subtle-danger btn-sm me-1' data-bs-toggle='modal' data-bs-target='#killLead' value='Delete Lead'>";    

    if(checkLoginType($_SESSION['login_type']) == 1)
    {
        if($current_status_description == 'Pending')
        {
            echo "<input type='button' class='btn btn-subtle-danger btn-sm me-1' data-bs-toggle='modal' data-bs-target='#approveDeletion' value='Approve Deletion'>";
        }
        
        if($current_status_description == 'Applied')
        {
            echo "<input type='button' class='btn btn-subtle-danger btn-sm' data-bs-toggle='modal' data-bs-target='#urnRejected' value='URN Rejected'>";
        }

        if($current_status_description == 'Visa Applied')
        {
            echo "<input type='button' class='btn btn-subtle-danger btn-sm' data-bs-toggle='modal' data-bs-target='#visaRejected' value='VISA Rejected'>";
        } 
    }
}
?>
<br><br>
</td>
</tr>