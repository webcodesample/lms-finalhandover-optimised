<?php 
	if(validateStaffAccessRight('commission',$con))
	{ 
?>
<h5 class="mb-2">Commission History</h5>

<div class="navbar nav-underline mb-2">
	<ul class="nav d-flex">
		<li class="nav-item m-1"><a href="commission_history.php" class="nav-link <?=$income_tab?>">Income</a></li>
		<li class="nav-item m-1"><a href="commission_history.php?type=payment" class="nav-link <?=$payment_tab?>">Payment</a></li>
	</ul>
</div>

<?php include_once($type."_history.php") ?>

<?php 
}
else
{
	setAccessDeniedMsg();
}
	include_once("footer_copyright.php");
?>