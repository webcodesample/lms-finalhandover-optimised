<?php
$box_color = ['primary','success','info','info-light','warning','danger'];
$source_list = getRowsData('lead_sources_list',$con);
?>
<div class="col-12 col-xxl-6 mb-3 mb-sm-0">
<div class="row">
    <div class="col-sm-7 col-md-8 col-xxl-8 mb-md-3 mb-lg-0">
        <h3>New Leads by Source</h3>
        <p class="text-body-tertiary">Today's lead count across all sources</p>
        <div class="row g-0">
            
            <?php
            $i = 0;
            $total_lead_count = 0;
            while($source = mysqli_fetch_assoc($source_list))
            {
                $i++;
                $where_con_array = [ ("source_id =". $source['id']), ("datentime >". strtotime('today'))];
                $lead_count = getRowCountMultiCol(setWhereClauseAdvance($where_con_array),'temp_leads',$con);
                $total_lead_count += $lead_count;
                echo "<div class='col-6 col-xl-4'>
                    <div class='d-flex flex-column flex-center align-items-sm-start flex-md-row justify-content-md-between flex-xxl-column p-3 ps-sm-3 ps-md-4 p-md-3 h-100 border-1 border-bottom border-end-md-0 border-end-xl border-translucent'>
                        <div class='d-flex align-items-center mb-1'><span class='fa-solid fa-square fs-11 me-2 text-".$box_color[$i-1]."' data-fa-transform='up-2'></span><span class='mb-0 fs-9 text-body'>".$source['description']."</span></div>
                        <h3 class='fw-semibold ms-xl-3 ms-xxl-0 pe-md-2 pe-xxl-0 mb-0 mb-sm-3'>".$lead_count."</h3>
                    </div>
                    </div>";
            }
            ?>
        </div>
        </div>
    <div class="col-sm-5 col-md-4 col-xxl-4 my-3 my-sm-0">
    <div class="position-relative d-flex flex-center mb-sm-4 mb-xl-0 echart-contact-by-source-container2 mt-sm-7 mt-lg-4 mt-xl-0">
        <div class="echart-contact-by-source" style="min-height:245px;width:100%"></div>
        <div class="position-absolute rounded-circle bg-primary-subtle top-50 start-50 translate-middle d-flex flex-center" style="height:100px; width:100px;">
        <h3 class="mb-0 text-primary-dark fw-bolder"><?=$total_lead_count?></h3>
        </div>
    </div>
    </div>
</div>
</div>



        