<div class="d-flex justify-content-between" >
<?php
    $student_id = getFieldValue('student_id','id',$_REQUEST['lead_id'],'leads_details',$con);
    $student_name = getFieldValue('name','id',$student_id,'students',$con);
    $urn = getFieldValue('urn','id',$_REQUEST['lead_id'],'leads_details',$con);
    $current_status_batch_id = getFieldValue('status_batch_id','id',$_REQUEST['lead_id'],'leads_details',$con);
    $current_status_id = getLatestUpdate('status_id','lead_id',$_REQUEST['lead_id'],'leads_activity_history',$con);

    $where_con_array = [
                        'id' => $current_status_id,
                        'batch_id' => $current_status_batch_id,
                        ];
    $current_status_description = getFieldValueMultiCon('description',setWhereClause($where_con_array),'lead_status_list',$con);
    $current_status_step_order = getFieldValueMultiCon('step_order',setWhereClause($where_con_array),'lead_status_list',$con);

    $where_con_array_next_status = [
                    'batch_id' => $current_status_batch_id,
                    'step_order' => ($current_status_step_order+1),
                    ];

    $next_status_description = getFieldValueMultiCon('description',setWhereClause($where_con_array_next_status),'lead_status_list',$con);

    if($current_status_description == 'Complete' || $current_status_description == 'Deleted' || $current_status_description == 'URN Rejected' || $current_status_description == 'Visa Rejected' || $current_status_description == 'Pending')
    {
        $next_status_display_flag = 0;
        $field_visibility = "disabled";
    }
    else if($current_status_description != 'New' && $current_status_description != 'Pre Application' && $current_status_description != 'Verification')
    {
        $next_status_display_flag = 1;
        $field_visibility = "disabled";
    }
    else
    {
        $next_status_display_flag = 1;
        $field_visibility = "";
    }
    
?>
<div>
<span class="text-primary fw-bold"><?=strtoupper($student_name)?></span>
<span class="text-success fw-bold">  CA<?=strtoupper($urn)?></span>
</div>

<?php include_once("status_progress_bar.php"); ?>

<div class="fs-9">
<?php
if($next_status_display_flag == 1)
{
?>
<span class="text-primary fw-bold"><?=$current_status_description?> >></span>
<span class="text-success fw-bold">>> <?=$next_status_description?></span>
<?php
}
else 
{
?>
<span class="text-danger fw-bold"><?=$current_status_description?></span>
<?php	
}
?>
</div>
</div>