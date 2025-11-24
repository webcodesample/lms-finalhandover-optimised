<?php
include_once("../common/alertModal.php");
showActionPerformAlert($action_perform_msg);
callAdminModule('sales_person_form','sales person',$con);
include_once("footer_copyright.php");
?>