<?php
include_once("../livesearch/con_ajax.php");
include_once("../common/function.php");

echo "<option value=''>To Year</option>".generateYearDropdown($_REQUEST['minVal']+1,$_REQUEST['selectedYear']);
?>