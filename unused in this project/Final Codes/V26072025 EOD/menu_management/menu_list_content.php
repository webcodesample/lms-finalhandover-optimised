<?php
if($_SESSION['login_type'] == 7)
include_once("menu_modules/available_menus.php");
else
setAccessDeniedMsg();

include_once("footer_copyright.php");
?>