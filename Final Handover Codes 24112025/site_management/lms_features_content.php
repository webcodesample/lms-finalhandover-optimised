<?php 
if(validateStaffAccessRight('features',$con))
{ 
?>
<h5>LMS Features</h5>
<div class="d-flex">
	<?=generateTabsList($requested_tab,$tabs_array)?>
</div>
<?php
include_once($requested_tab."_list.php");
?>

<?php 
}
else
{
	setAccessDeniedMsg();
}
	include_once("footer_copyright.php");
?>