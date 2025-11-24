<div class="d-flex justify-content-between mb-5">
<ul class="nav nav-underline fs-9">
	<li class="nav-item"><a class="nav-link <?=$profile?>" href="manage_sales_person.php?sales_person_id=<?=$_REQUEST['sales_person_id']?>&tab=profile">Profile</a></li>
	<li class="nav-item"><a class="nav-link <?=$ledger?>" href="manage_sales_person.php?sales_person_id=<?=$_REQUEST['sales_person_id']?>&tab=ledger">Wallet</a></li>
	<li class="nav-item"><a class="nav-link <?=$performance?>" href="manage_sales_person.php?sales_person_id=<?=$_REQUEST['sales_person_id']?>&tab=performance">Performance</a></li>
	<li class="nav-item"><a class="nav-link <?=$withdrawl_request?>" href="manage_sales_person.php?sales_person_id=<?=$_REQUEST['sales_person_id']?>&tab=withdrawl_request">Withdrawl Request</a></li>
</ul>
<?php setGoBack('sales_person_list.php') ?>
</div>

<?php include_once($tab_content_page); ?>