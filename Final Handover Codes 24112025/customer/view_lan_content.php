<?php
$lan = getLatestUpdateRow('lan',$_REQUEST['lan'],'lan_audit_history',$con);
?>

<div class="d-flex justify-content-between align-items-center my-2">

<div><?=generateTabsList($requested_tab,$tabs_array,'lan='.$_REQUEST['lan'])?></div>

<div class="text-danger fs-9 fw-bold">
<?=setViewOnlyMode($lan_using_by_me)?>
</div>

<div class="d-flex">
<div class="p-1">
<img src="../portal-icons/viewhistory.png" style="height: 20px; width: 25px; cursor:pointer;" data-bs-toggle="modal" data-bs-target="#lanActivityHistoryModal" title="View LRN Activity History">
</div>
<a href="print_lan.php?lan=<?=$_REQUEST['lan']?>" title="Print LAN">
<span class="text-info m-1" data-feather="printer" style="height: 20px; width: 20px;"></span>
</a>
<div>
<?php setGoBack("leads.php"); ?>
</div>
</div>

</div>

<?php 
include_once("../lan_modules/lan_".$requested_tab.".php");
include_once("../lan_modules/modals/lanActivityHistoryModal.php");
include_once("footer_copyright.php");
?>