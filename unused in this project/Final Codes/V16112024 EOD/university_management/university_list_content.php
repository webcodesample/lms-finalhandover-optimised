<?php
$view_result = getRowsData('university_list',$con,'name','ASC');
callAdminModule('university_list','universities',$con,$view_result);
include_once("footer_copyright.php");
?>