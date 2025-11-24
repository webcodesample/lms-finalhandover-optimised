<?php
$requested_status = '';
if(isset($_REQUEST['status']))
$requested_status = $_REQUEST['status'];
?>
<div class="pb-6 mt-1">
        
    <div id="lealsTable" data-list='{"valueNames":["name","email","phone","contact","company","date"],"page":10,"pagination":true}'>
    <div class="row g-3 justify-content-between mb-4">
        <div class="col-auto">
        <div class="d-md-flex justify-content-between">
            <div>
            <a href="temp_lrns.php" class="btn btn-sm btn-primary me-4 p-2"><span class="fas fa-plus me-1"></span>Create lrn</a>
            </div>
            <h5 class="mt-2">Total <?=$total_lrns?> LRN</h5>
        </div>
        </div>
        <div class="col-auto">
        <div class="d-flex">
            <div class="search-box me-2">
            <form class="position-relative" method="post">
            <div class="d-flex">
                <select name="search_by" class="form-select form-select-sm m-1" style="width:120px;" required>
                <?php
                $search_by_options_array = ['name','email','mobile','lrn'];
                $search_by_options = "<option value=''>Search By</option>";
                foreach($search_by_options_array AS $search_by)
                {
                    if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == $search_by)
                    $search_by_options .= "<option value='".$search_by."' selected>".ucwords($search_by)."</option>";
                    else
                    $search_by_options .= "<option value='".$search_by."'>".ucwords($search_by)."</option>";
                }
                echo $search_by_options;
                ?>
                </select>
                <input class="form-control form-control-sm m-1" type="search" name="search_text" placeholder="Search Text" aria-label="Search" required value="<?php if(isset($_REQUEST['search_text'])) echo $_REQUEST['search_text'];?>">
                <input type="hidden" name="status" value="<?=$requested_status?>">
                <button class="btn btn-sm btn-subtle-light m-1 p-0">
                <span class="text-danger" data-feather="search" style="height: 25px; width: 25px;"></span>
                </button>
            </div>
            </form>
            </div>            
        </div>
        </div>
    </div>
    <div class="table-responsive scrollbar mx-n1 px-1">
        <table class="table table-sm fs-10 mb-0 lrns-table border-top border-translucent">
        <thead>
            <tr>
            <th class="sort white-space-nowrap align-middle text-uppercase ps-0" scope="col" data-sort="name" style="width:25%;">
                <div class="d-inline-flex flex-center">
                <div class="d-flex align-items-center px-1 py-1 bg-info-subtle rounded me-2"><span class="text-info-dark" data-feather="user"></span></div><span>Name</span>
                </div>
            </th>
            <th class="sort align-middle ps-4 pe-5 text-uppercase border border-translucent" scope="col" data-sort="email" style="width:15%;">
                <div class="d-inline-flex flex-center">
                <div class="d-flex align-items-center px-1 py-1 bg-success-subtle rounded me-2"><span class="text-success-dark" data-feather="edit"></span></div><span>Remark</span>
                </div>
            </th>
            <th class="sort align-middle ps-4 pe-5 text-uppercase border-end border-translucent" scope="col" data-sort="phone" style="width:5%; min-width: 50px;">
                <div class="d-inline-flex flex-center">
                <div class="d-flex align-items-center px-1 py-1 bg-primary-subtle rounded me-2"><span class="text-primary-dark" data-feather="globe"></span></div><span>Source</span>
                </div>
            </th>
            <th class="sort align-middle ps-4 pe-5 text-uppercase border-end border-translucent" scope="col" data-sort="contact" style="width:15%;">
                <div class="d-inline-flex flex-center">
                <div class="d-flex align-items-center px-1 py-1 bg-info-subtle rounded me-2"><span class="text-info-dark" data-feather="box"></span></div><span>Product Name</span>
                </div>
            </th>
            <th class="sort align-middle ps-4 pe-5 text-uppercase border-end border-translucent" scope="col" data-sort="company" style="width:15%;">
                <div class="d-inline-flex flex-center">
                <div class="d-flex align-items-center px-1 py-1 bg-warning-subtle rounded me-2"><span class="text-warning-dark" data-feather="grid"></span></div><span>Amount Approved</span>
                </div>
            </th>
            <th class="sort align-middle ps-4 pe-5 text-uppercase" scope="col" data-sort="date" style="width:15%;">
                <div class="d-inline-flex flex-center">
                <div class="d-flex align-items-center px-1 py-1 bg-danger-subtle rounded me-2"><span class="text-warning-dark" data-feather="calendar"></span></div><span>Created On</span>
                </div>
            </th>
            <th class="sort text-end align-middle pe-0 ps-4" scope="col"></th>
            </tr>
        </thead>
        <tbody class="list" id="leal-tables-body">

        <?php
        $i = 0;
        while($lrn = mysqli_fetch_assoc($result_view_lrns))
        {
	        $i++;
            $product = 'Not Selected';
            $status_badge_color = "primary";

            if($lrn['product_id'] > 0)
            $product = getFieldValue('description','id',$lrn['product_id'],'product_list',$con);

            $status_description = getFieldValue('description','id',$lrn['status_id'],'lead_status_list',$con);

            if(in_array($status_description,['Customer Rejected','LRN Rejected','Deleted']))
            $status_badge_color = "danger";
            else if($status_description == "Approved")
            $status_badge_color = "success";
            else if($status_description == "Verified")
            $status_badge_color = "warning";
            else if($status_description == "In Verification")
            $status_badge_color = "info";
        ?>

            <tr class="hover-actions-trigger btn-reveal-trigger position-static">
            <td class="name align-middle white-space-nowrap ps-0">
                <div class="d-flex align-items-center">
                    <a href="#!">
                    <div class="avatar avatar-xl me-2">
                    <a href="manage_lrn.php?lrn=<?=$lrn['lrn']?>&tab=documents" class="text-decoration-none">
                    <img class="rounded-circle" style="height:40px; width:40px;" src="<?=getLatestLRNProfilePic($lrn['lrn'],$con)?>" alt="" />
                    </a>
                    </div>
                    </a>
                <div><a class="fs-9 fw-bold link-primary text-decoration-none" href="manage_lrn.php?lrn=<?=$lrn['lrn']?>"><?=$lrn['name']?> - <?php if($lrn['cust_type']==2) echo 'C'; else echo 'I';?></a>
                    <div class="d-flex align-items-center">
                    <p class="mb-0 text-body-highlight fw-semibold fs-10 me-2">LA<?=$lrn['lrn']?></p>
                    <span class="badge badge-phoenix badge-phoenix-<?=$status_badge_color?>"><?=$status_description?></span>
                    </div>
                </div>
                </div>
            </td>
            <td class="email align-middle white-space-nowrap fw-semibold ps-4 border border-translucent"><?=$lrn['updation_remark']?></td>
            <td class="phone align-middle white-space-nowrap fw-semibold ps-4 border-end border-translucent"><?=getFieldValue('description','id',getFieldValue('source_id','lrn',$lrn['lrn'],'lrn_list',$con),'lead_sources_list',$con)?></td>
            <td class="contact align-middle white-space-nowrap ps-4 border-end border-translucent fw-semibold text-body-highlight">
            <?=$product?>
            </td>
            <td class="company align-middle white-space-nowrap text-body-tertiary text-opacity-85 ps-4 border-end border-translucent fw-semibold text-body-highlight">
            <?=$lrn['approved_loan_amount']?>
            </td>
            <td class="date align-middle white-space-nowrap text-body-tertiary text-opacity-85 ps-4 text-body-tertiary"><?=date('d-m-Y',getFieldValue('datentime','lrn',$lrn['lrn'],'lrn_list',$con))?></td>
            <td class="align-middle white-space-nowrap text-end pe-0 ps-4">
                <div class="btn-reveal-trigger position-static">
                <button class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal fs-10" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="fas fa-ellipsis-h fs-10"></span></button>
                <div class="dropdown-menu dropdown-menu-end py-2">
                    <a class="dropdown-item" href="print_lrn.php?lrn=<?=$lrn['lrn']?>">Print</a>
                </div>
                </div>
            </td>
            </tr>
            <?php } ?>
                  
        </tbody>
        </table>
    </div>
    <div class="row align-items-center justify-content-end py-4 pe-0 fs-9">
        <div class="col-auto d-flex">
        <p class="mb-0 d-none d-sm-block me-3 fw-semibold text-body" data-list-info="data-list-info"></p>
        <a class="fw-semibold" href="lrn_list.php<?php if($requested_status) echo '?status='.$requested_status; ?>" data-list-view="*">View all<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a>
        <a class="fw-semibold d-none" href="#!" data-list-view="less">View Less<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a>
        </div>
        <div class="col-auto d-flex">
        <button class="page-link" data-list-pagination="prev"><span class="fas fa-chevron-left"></span></button>
        <ul class="mb-0 pagination"></ul>
        <button class="page-link pe-0" data-list-pagination="next"><span class="fas fa-chevron-right"></span></button>
        </div>
    </div>
    </div>
</div>
<?php include_once("footer_copyright.php") ?>