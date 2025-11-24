<?php
include_once("../common/alertModal.php");
showActionPerformAlert($action_perform_msg);
callAdminModule('agent_form','agent',$con);
include_once("footer_copyright.php");
?>