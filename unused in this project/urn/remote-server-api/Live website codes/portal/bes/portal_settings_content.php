<h5>Portal Options</h5>
<div class="d-flex">
	<ul class="nav nav-underline fs-9" id="myTab" role="tablist">
		<li class="nav-item"><a href="portal_settings.php" class="nav-link <?=$lead_status_active?>">Lead Status List</a></li>
		<li class="nav-item"><a href="portal_settings.php?tab=country" class="nav-link <?=$country_active?>">Country List</a></li>
		<li class="nav-item"><a href="portal_settings.php?tab=predefined_documents" class="nav-link <?=$predefined_documents_active?>">Predefined Documents List</a></li>
	</ul>
</div>
<?php
include_once($requested_tab."_list.php");
?>

<?php include_once("footer_copyright.php") ?>