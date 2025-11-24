<div class="pb-6 mt-1">
        
    <div id="lealsTable" data-list='{"valueNames":["name","email","phone","contact","company","date"],"page":10,"pagination":true}'>
    <div class="row g-3 justify-content-between mb-4">
        <div class="col-auto">
        <div class="d-md-flex justify-content-between">
            <div>
            <a href="temp_leads.php" class="btn btn-sm btn-primary me-4 p-2"><span class="fas fa-plus me-1"></span>Create Lead</a>
            </div>
            <h5 class="mt-2">Total <?=$total_leads?> URN</h5>
        </div>
        </div>
        <div class="col-auto">
        <div class="d-flex">
            <div class="search-box me-2">
            <form class="position-relative" method="post">
            <div class="d-flex">
                <select name="search_by" class="form-select form-select-sm m-1" style="width:120px;" required>
                <option value="">Search By</option>
                <option value="name" <?php if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'name') echo 'selected'; ?>>Name</option>
                <option value="urn" <?php if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'urn') echo 'selected'; ?>>URN</option>
                <option value="email" <?php if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'email') echo 'selected'; ?>>Email</option>
                <option value="mobile" <?php if(isset($_REQUEST['search_by']) && $_REQUEST['search_by'] == 'mobile') echo 'selected'; ?>>Mobile</option>
                </select>
                <input class="form-control form-control-sm m-1" type="search" name="search_text" placeholder="Search Text" aria-label="Search" required value="<?php if(isset($_REQUEST['search_text'])) echo $_REQUEST['search_text'];?>">
                <input type="hidden" name="status" value="<?php if(isset($_REQUEST['status'])) echo $_REQUEST['status'];?>">
                <button type="submit" class="btn btn-sm btn-subtle-light m-1 p-0">
                <span class="text-danger" data-feather="search" style="height: 25px; width: 25px;"></span>
                </button>
            </div>
            </form>
            </div>            
        </div>
        </div>
    </div>
    <div class="table-responsive scrollbar mx-n1 px-1">
        <table class="table table-sm fs-10 mb-0 leads-table border-top border-translucent">
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
                <div class="d-flex align-items-center px-1 py-1 bg-info-subtle rounded me-2"><span class="text-info-dark" data-feather="book-open"></span></div><span>Course Name</span>
                </div>
            </th>
            <th class="sort align-middle ps-4 pe-5 text-uppercase border-end border-translucent" scope="col" data-sort="company" style="width:15%;">
                <div class="d-inline-flex flex-center">
                <div class="d-flex align-items-center px-1 py-1 bg-warning-subtle rounded me-2"><span class="text-warning-dark" data-feather="grid"></span></div><span>University name</span>
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
        while($leads = mysqli_fetch_assoc($result_view_leads))
        {
	        $i++;
            $application_point = "";
            $course_name = "Not Selected";
            $university_name = "";

            if($leads['course_id'] > 0)
            {
                $course_name = getFieldValue('name','id',$leads['course_id'],'course_list',$con);
                $university_id = getFieldValue('university_id','id',$leads['course_id'],'course_list',$con);
                $university_name = getFieldValue('name','id',$university_id,'university_list',$con);
            }

	        $current_remark = getLatestUpdate('updation_remark','lead_id',$leads['lead_id'],'urn_audit_history',$con);
	        //$student_id = getFieldValue('student_id','id',$leads['lead_id'],'leads_details',$con);
            if($leads['application_point_id'] > 0)
                $application_point .= "<span class='text-danger'>AP : ".getFieldValue('name','id',$leads['application_point_id'],'application_point_list',$con)."</span>";
        ?>

            <tr class="hover-actions-trigger btn-reveal-trigger position-static">
            <td class="name align-middle white-space-nowrap ps-0">
                <div class="d-flex align-items-center">
                    <a href="#!">
                    <div class="avatar avatar-xl me-2">
                    <a href="urn_history.php?lead_id=<?=$leads['lead_id']?>&tab=documents" class="text-decoration-none">
                    <img class="rounded-circle" style="height:40px; width:40px;" src="<?=getLatestURNProfilePic($leads['lead_id'],$leads['urn'],$con)?>" alt="" />
                    </a>
                    </div>
                    </a>
                <div><a class="fs-9 fw-bold link-primary text-decoration-none" href="urn_history.php?lead_id=<?=$leads['lead_id']?>"><?=$leads['student_name']?></a>
                    <div class="d-flex align-items-center">
                    <p class="mb-0 text-body-highlight fw-semibold fs-10 me-2">CA<?=$leads['urn']?></p>
                    <?php
                    $status_description = getFieldValue('description','id',$leads['status_id'],'lead_status_list',$con);
                    
                    if($status_description == "Visa Rejected" || $status_description == "URN Rejected")
                    echo "<span class='badge badge-phoenix badge-phoenix-danger'>".$status_description."</span>";
                    else if($status_description == "Complete" || $status_description == "Visa Approved" ||  $status_description == "URN Approved")
                    echo "<span class='badge badge-phoenix badge-phoenix-success'>".$status_description."</span>";
                    else if($status_description == "Verification" || $status_description == "Applied")
                    echo "<span class='badge badge-phoenix badge-phoenix-warning'>".$status_description."</span>";
                    else if($status_description == "Pre Application")
                    echo "<span class='badge badge-phoenix badge-phoenix-info'>".$status_description."</span>";
                    else
                    echo "<span class='badge badge-phoenix badge-phoenix-primary'>".$status_description."</span>";
                    ?>
                    </div>
                </div>
                </div>
            </td>
            <td class="email align-middle white-space-nowrap fw-semibold ps-4 border border-translucent"><?=$current_remark?></td>
            <td class="phone align-middle white-space-nowrap fw-semibold ps-4 border-end border-translucent"><?=getFieldValue('description','id',$leads['source_id'],'lead_sources_list',$con)?></td>
            <td class="contact align-middle white-space-nowrap ps-4 border-end border-translucent fw-semibold text-body-highlight"><?=$course_name?></td>
            <td class="company align-middle white-space-nowrap text-body-tertiary text-opacity-85 ps-4 border-end border-translucent fw-semibold text-body-highlight"><?=$university_name?></td>
            <td class="date align-middle white-space-nowrap text-body-tertiary text-opacity-85 ps-4 text-body-tertiary"><?=date('d-m-Y',$leads['lead_created_on'])?><br><span class="text-danger"><?=date('H:i:s A',$leads['lead_created_on'])?></span></td>
            <td class="align-middle white-space-nowrap text-end pe-0 ps-4">
                <div class="btn-reveal-trigger position-static">
                <button class="btn btn-sm dropdown-toggle dropdown-caret-none transition-none btn-reveal fs-10" type="button" data-bs-toggle="dropdown" data-boundary="window" aria-haspopup="true" aria-expanded="false" data-bs-reference="parent"><span class="fas fa-ellipsis-h fs-10"></span></button>
                <div class="dropdown-menu dropdown-menu-end py-2">
                    <a class="dropdown-item" href="print_urn.php?lead_id=<?=$leads['id']?>">Print</a>
                    <a class="dropdown-item" href="#!">Export</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item text-danger" href="#!">Remove</a>
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
        <p class="mb-0 d-none d-sm-block me-3 fw-semibold text-body" data-list-info="data-list-info"></p><a class="fw-semibold" href="#!" data-list-view="*">View all<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a><a class="fw-semibold d-none" href="#!" data-list-view="less">View Less<span class="fas fa-angle-right ms-1" data-fa-transform="down-1"></span></a>
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