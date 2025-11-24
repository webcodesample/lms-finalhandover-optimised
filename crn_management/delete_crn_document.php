<?php
unlink($_REQUEST['document']);
header("Location: manage_crn.php?crn=".$_REQUEST['crn']."&tab=documents");
?>