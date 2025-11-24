<h5 class="text-danger">My Account</h5>
<div class="d-flex">
<a href="myaccount.php" class="btn <?=$btn_class_prfile?>-danger btn-sm m-1">Profile</a>
<a href="myaccount.php?tab=settings" class="btn <?=$btn_class_settings?>-success btn-sm m-1">Settings</a>
</div>
<?php
include_once("my".$requested_tab.".php");
?>