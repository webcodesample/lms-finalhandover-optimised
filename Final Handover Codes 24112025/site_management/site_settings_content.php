<?php
include_once("../common/alertModal.php");
showActionPerformAlert($action_perform_msg);

if($_SESSION['login_type'] == 7)
callAdminModule('site_info_form','site info',$con,$site);
else
callAdminModule('site_info_readonly','site info',$con,$site);

include_once("footer_copyright.php");
?>