<?php
function validateLicense()
{
	return file_get_contents('http://motibuilders.com/apicall.php?cdom='.$_SERVER['HTTP_HOST'].'&key='.urlencode('QVAxMkNSNTlEWA=='));
}

if(!validateLicense())
{	
	header("Location:../common/invalid_license.php");
	die();
}
?>