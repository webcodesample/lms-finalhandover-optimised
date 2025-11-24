<h5>My Account</h5>
<div class="nav nav-underline d-flex mb-3">
	<ul class="nav">
		<li class="nav-item"><a href="myaccount.php" class="nav-link <?=$active_link_prfile?> m-1">Profile</a></li>
		<li class="nav-item"><a href="myaccount.php?tab=bank" class="nav-link <?=$active_link_bank?> m-1">Bank</a></li>
		<li class="nav-item"><a href="myaccount.php?tab=settings" class="nav-link <?=$active_link_settings?> m-1">Settings</a></li>
	</ul>
</div>
<?php
include_once("my".$requested_tab.".php");
?>