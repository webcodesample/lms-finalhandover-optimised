<?php include_once("name_urn_status_bar.php") ?>

<ul class="nav nav-underline my-3" id="pills-tab" role="tablist">
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
  </il>
</ul>

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

</div>

<?php include_once("footer_copyright.php") ?>