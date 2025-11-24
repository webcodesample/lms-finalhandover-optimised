<?php
$current_php_script = explode('.',basename($_SERVER['PHP_SELF']));
$content_pagename_prefix = $current_php_script[0];

include_once("head_crm.php");
?>

<div class="content content-mt">

<?php include_once($content_pagename_prefix."_content.php"); ?>

</div>

<?php include_once("footer_crm.php"); ?>