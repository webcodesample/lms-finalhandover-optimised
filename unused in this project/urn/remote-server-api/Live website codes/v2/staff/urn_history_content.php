<?php include_once("name_urn_status_bar.php") ?>

<div class="d-flex justify-content-between mb-5 mt-2">

<ul class="nav nav-underline" id="pills-tab" role="tablist">
  <li class="nav-item nav-item-danger" role="presentation">
    <button class="nav-link <?=$profile_active?>" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="true">Profile</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link <?=$documents_active?>" id="pills-documents-tab" data-bs-toggle="pill" data-bs-target="#pills-documents" type="button" role="tab" aria-controls="pills-documents" aria-selected="false">Documents</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link <?=$academic_details_active?>" id="pills-academic-details-tab" data-bs-toggle="pill" data-bs-target="#pills-academic-details" type="button" role="tab" aria-controls="pills-academic-details" aria-selected="false">Academic Details</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link <?=$additional_details_active?>" id="pills-additional-details-tab" data-bs-toggle="pill" data-bs-target="#pills-additional-details" type="button" role="tab" aria-controls="pills-additional-details" aria-selected="false">Additional Details</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link <?=$history_active?>" id="pills-history-tab" data-bs-toggle="pill" data-bs-target="#pills-history" type="button" role="tab" aria-controls="pills-history" aria-selected="false">History</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link <?=$audit_active?>" id="pills-audit-tab" data-bs-toggle="pill" data-bs-target="#pills-audit" type="button" role="tab" aria-controls="pills-audit" aria-selected="false">Audit</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link <?=$communication_history_active?>" id="pills-communication-history-tab" data-bs-toggle="pill" data-bs-target="#pills-communication-history" type="button" role="tab" aria-controls="pills-communication-history" aria-selected="false">Communication</button>
  </li>
</ul>

<div class="mt-3 text-danger fs-9 fw-bold">
<?=$urn_visibility_mode?>
</div>

<div class="d-flex">
<a href="print_urn.php?lead_id=<?=$_REQUEST['lead_id']?>">
<span class="text-info m-1" data-feather="printer" style="height: 20px; width: 20px;"></span>
</a>
<div>
<?php setGoBack("leads.php"); ?>
</div>
</div>

</div>

<div class="tab-content mt-3 mb-5" id="pills-tabContent">
  <div class="tab-pane fade <?=$profile_show?>" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
    <?php include_once("urn_profile.php")  ?>
  </div>

  <div class="tab-pane fade <?=$documents_show?>" id="pills-documents" role="tabpanel" aria-labelledby="pills-documents-tab">
    <?php include_once("urn_documents.php") ?>
  </div>

  <div class="tab-pane fade <?=$history_show?>" id="pills-history" role="tabpanel" aria-labelledby="pills-history-tab">
    <?php include_once("urn_activity_history.php") ?>
  </div>

  <div class="tab-pane fade <?=$audit_show?>" id="pills-audit" role="tabpanel" aria-labelledby="pills-audit-tab">
    <?php include_once("audit_history.php"); ?>
  </div>

  <div class="tab-pane fade <?=$academic_details_show?>" id="pills-academic-details" role="tabpanel" aria-labelledby="pills-academic-details-tab">
    <?php include_once("academic_details.php"); ?>
  </div>

  <div class="tab-pane fade <?=$additional_details_show?>" id="pills-additional-details" role="tabpanel" aria-labelledby="pills-additional-details-tab">
    <?php include_once("additional_details.php"); ?>
  </div>

  <div class="tab-pane fade <?=$communication_history_show?>" id="pills-communication-history" role="tabpanel" aria-labelledby="pills-communication-history-tab">
    <?php include_once("urn_communication_history.php"); ?>
  </div>

</div>

<?php include_once("footer_copyright.php") ?>