<div class="row gy-3 mb-4 justify-content-between">
    <div class="col-xxl-6">
        <h2 class="mb-2 text-body-emphasis">CRM Dashboard</h2>
        <h5 class="text-body-tertiary fw-semibold mb-4">Check your business growth in one place</h5>
        <div class="row g-3 mb-3">              
            <?php include_once("today_calls_section.php"); ?>
            <?php include_once("new_urn_count_section.php"); ?>
            <?php include_once("top5_source.php") ?>
        </div>
        <div class="row g-3 mb-3">              
            <?php include_once("top5_university_section.php") ?>
        </div>
    </div>
    <?php// include_once("new_leads_by_source.php") ?>              
    <?php// include_once("new_urn_plus_leads.php"); ?>
</div>
<?php include_once("footer_copyright.php") ?>