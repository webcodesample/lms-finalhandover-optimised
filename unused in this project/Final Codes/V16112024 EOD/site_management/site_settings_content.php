<?php
include_once("../common/alertModal.php");
showActionPerformAlert($action_perform_msg);
callAdminModule('site_info_form','site info',$con,$site);
include_once("footer_copyright.php");
?>