<?php
if($_SESSION['login_type'] == 7)
include_once("menu_modules/submenu_items_list.php");
else
setAccessDeniedMsg();

include_once("footer_copyright.php");
?>