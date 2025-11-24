<div class="mb-3">
<?php
if(in_array($_REQUEST['tab'],$subtabs_details))
$requested_subtab = $_REQUEST['tab'];
else
$requested_subtab = 'profile';


echo generateTabsList($requested_subtab,$subtabs_details,'lrn='.$_REQUEST['lrn']);
?>
</div>
<?php
include_once("../lrn_modules/lrn_".$requested_subtab.".php");
?>