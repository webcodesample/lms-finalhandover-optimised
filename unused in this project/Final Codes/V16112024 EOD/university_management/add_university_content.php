<?php
include_once("../common/alertModal.php");
showActionPerformAlert($action_perform_msg);
callAdminModule('university_form','universities',$con);
include_once("footer_copyright.php");
?>