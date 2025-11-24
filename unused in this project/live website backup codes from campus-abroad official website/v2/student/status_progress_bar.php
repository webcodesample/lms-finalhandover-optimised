<?php
if($current_status_step_order == 1)
{
echo "<div class='progress' style='height:18px; width:350px;'>
      <div class='progress-bar bg-primary rounded-3 fw-bold fs-10' role='progressbar' style='width: 30%' aria-valuenow='25' aria-valuemin='0' aria-valuemax='100'>".$current_status_description."</div>
    </div>";
}
else if($current_status_step_order < 4)
{
echo "<div class='progress' style='height:18px; width:350px;'>
      <div class='progress-bar bg-warning rounded-3 fw-bold fs-10' role='progressbar' style='width: 40%' aria-valuenow='25' aria-valuemin='0' aria-valuemax='100'>".$current_status_description."</div>
    </div>";
}
else if($current_status_step_order >= 4 && $current_status_step_order < 50 && $current_status_description != 'Complete')
{
    $progress_percenteage = 40 + (5*$current_status_step_order);
echo "<div class='progress' style='height:18px; width:350px;'>
      <div class='progress-bar bg-info rounded-3 fw-bold fs-10' role='progressbar' style='width: ".$progress_percenteage."%' aria-valuenow='25' aria-valuemin='0' aria-valuemax='100'>".$current_status_description."</div>
    </div>";
}
else if($current_status_step_order >= 4 && $current_status_step_order < 50 && $current_status_description == 'Complete')
{
echo "<div class='progress' style='height:18px; width:350px;'>
      <div class='progress-bar bg-success rounded-3 fw-bold fs-10' role='progressbar' style='width: 100%' aria-valuenow='25' aria-valuemin='0' aria-valuemax='100'>".$current_status_description."</div>
    </div>";
}
else if($current_status_step_order == 777 || $current_status_step_order == 888 || $current_status_step_order == 999)
{
echo "<div class='progress' style='height:18px; width:350px;'>
      <div class='progress-bar bg-danger rounded-3 fs-10' role='progressbar' style='width: 100%' aria-valuenow='25' aria-valuemin='0' aria-valuemax='100'>".$current_status_description."</div>
    </div>";
}
else if($current_status_step_order == 666)
{
echo "<div class='progress' style='height:18px; width:350px;'>
      <div class='progress-bar bg-warning-dark rounded-3 fs-10' role='progressbar' style='width: 100%' aria-valuenow='25' aria-valuemin='0' aria-valuemax='100'>".$current_status_description."</div>
    </div>";
}

?>