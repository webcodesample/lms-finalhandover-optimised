<?php
$where_con_array_yesterday = [ ("callback_datentime >". strtotime('yesterday')), ("callback_datentime <". strtotime('today'))];
$yesterday_callback_count = getRowCountMultiCol(setWhereClauseAdvance($where_con_array_yesterday),'callback_list',$con);

$where_con_array_today = [ ("callback_datentime >". strtotime('today')),("callback_datentime <". strtotime('tomorrow'))];
$today_callback_count = getRowCountMultiCol(setWhereClauseAdvance($where_con_array_today),'callback_list',$con);
?>
<div class="col-sm-6 col-md-4 col-xl-3 col-xxl-4">
    <div class="card h-100">
        <div class="card-body">
        <div class="d-flex d-sm-block justify-content-between">
            <div class="border-bottom-sm border-translucent mb-sm-4">
            <div class="d-flex align-items-center">
                <div class="d-flex align-items-center icon-wrapper-sm shadow-primary-100" style="transform: rotate(-7.45deg);"><span class="fa-solid fa-phone-alt text-primary fs-7 z-1 ms-2"></span></div>
                <p class="text-body-tertiary fs-9 mb-0 ms-2 mt-3">Outgoing call</p>
            </div>
            <p class="text-primary mt-2 fs-6 fw-bold mb-0 mb-sm-4">
            <a class="text-decoration-none" href="callback_list.php?tab=today"><?=$today_callback_count?></a>
            <span class="fs-8 text-body lh-lg">Calls Today</span>
            </p>
            </div>
            <div class="d-flex flex-column justify-content-center flex-between-end d-sm-block text-end text-sm-start">
            <?php
            if($today_callback_count > $yesterday_callback_count)
            {
            ?>
            <span class="badge badge-phoenix badge-phoenix-danger fs-10 mb-2">
            <?=($today_callback_count-$yesterday_callback_count)?>
            <span data-feather="trending-up" style="height: 10px; width: 10px;"></span>
            </span>
            <?php
            }
            else if($today_callback_count < $yesterday_callback_count)
            {
            ?>
            <span class="badge badge-phoenix badge-phoenix-primary fs-10 mb-2">
            <?=($yesterday_callback_count-$today_callback_count)?>
            <span data-feather="trending-down" style="height: 10px; width: 10px;"></span>
            </span>
            <?php
            }
            else
            {
            ?>
            <span class="badge badge-phoenix badge-phoenix-info fs-10 mb-2">No Changes</span>
            <?php
            }
            ?>
            <p class="mb-0 fs-9 text-body-tertiary">Since Yesterday</p>
            </div>
        </div>
        </div>
    </div>
</div>
