<?php
include_once("../common/alertModal.php");
showActionPerformAlert($action_perform_msg);
callAdminModule('staff_form','staff',$con);
include_once("footer_copyright.php");
?>