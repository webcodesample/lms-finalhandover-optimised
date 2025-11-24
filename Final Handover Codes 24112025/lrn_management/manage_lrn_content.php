<?php include_once("name_lrn_status_bar.php"); ?>

<div class="d-flex justify-content-between align-items-center my-2">

<div><?=generateTabsList($requested_tab,$tabs_array,'lrn='.$_REQUEST['lrn'])?></div>

<div class="text-danger fs-9 fw-bold">
<?=setViewOnlyMode($lrn_using_by_me)?>
</div>

<div class="d-flex">
<div class="p-1">
<img src="../portal-icons/viewhistory.png" style="height: 20px; width: 25px; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#lrnActivityHistoryModal" title="View LRN Activity History">
</div>
<a href="print_lrn.php?lrn=<?=$_REQUEST['lrn']?>" title="Print LRN">
<span class="text-info m-1" data-feather="printer" style="height: 20px; width: 20px;"></span>
</a>
<div>
<?php setGoBack("leads.php"); ?>
</div>
</div>

</div>

<?php 
include_once("../lrn_modules/lrn_".$requested_tab.".php");
include_once("../lrn_modules/modals/lrnActivityHistoryModal.php");
include_once("footer_copyright.php");
?>