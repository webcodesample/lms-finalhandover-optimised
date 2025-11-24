<?php
if(date('l',strtotime('now')) == 'Monday')
{
    $current_week_start = strtotime("today");
    $last_week_start = strtotime("Last Monday");
    $last_week_end = $current_week_start;
}
else
{    
    $current_week_start = strtotime("Last Monday");
    $current_week_start_date = date('d',$current_week_start);
    $current_week_start_month = date('m',$current_week_start);
    $last_week_start = mktime(0,0,0,$current_week_start_month,$current_week_start_date-7);
    $last_week_end = $current_week_start;
}

$current_week_end = getWeekEnd();


$where_con_array_this_week = [ ("datentime >". $current_week_start), ("datentime <". $current_week_end)];
$current_week_lead_count = getRowCountMultiCol(setWhereClauseAdvance($where_con_array_this_week),'leads_details',$con);

$where_con_array_last_week = [ ("datentime >". $last_week_start),("datentime <". $last_week_end)];
$last_week_lead_count = getRowCountMultiCol(setWhereClauseAdvance($where_con_array_last_week),'leads_details',$con);
?>

<div class="col-sm-6 col-md-4 col-xl-3 col-xxl-4">
<div class="card h-100">
    <div class="card-body">
    <div class="d-flex d-sm-block justify-content-between">
        <div class="border-bottom-sm border-translucent mb-sm-4">
        <div class="d-flex align-items-center">
            <div class="d-flex align-items-center icon-wrapper-sm shadow-info-100" style="transform: rotate(-7.45deg);"><span class="fa-solid fa-calendar text-info fs-7 z-1 ms-2"></span></div>
            <p class="text-body-tertiary fs-9 mb-0 ms-2 mt-3">New URNs</p>
        </div>
        <p class="text-info mt-2 fs-6 fw-bold mb-0 mb-sm-4">
        <a href="leads_current_week.php" class="text-decoration-none"><?=$current_week_lead_count?></a>
        <span class="fs-8 text-body lh-lg">This Week</span></p>
        </div>
        <div class="d-flex flex-column justify-content-center flex-between-end d-sm-block text-end text-sm-start">
        <?php
        if($current_week_lead_count > $last_week_lead_count)
        {
        ?>
        <span class="badge badge-phoenix badge-phoenix-success fs-10 mb-2">
        <?=($current_week_lead_count-$last_week_lead_count)?>
        <span data-feather="trending-up" style="height: 10px; width: 10px;"></span>
        </span>
        <?php
        }
        else if($current_week_lead_count < $last_week_lead_count)
        {
        ?>
        <span class="badge badge-phoenix badge-phoenix-warning fs-10 mb-2">
        <?=($last_week_lead_count-$current_week_lead_count)?>
        <span data-feather="trending-down" style="height: 10px; width: 10px;"></span>
        </span>
        <?php
        }
        else
        {
        ?>
        <span class="badge badge-phoenix badge-phoenix-warning fs-10 mb-2">No Growth</span>
        <?php
        }
        ?>
        <p class="mb-0 fs-9 text-body-tertiary">Since last week</p>
        </div>
    </div>
    </div>
</div>
</div>