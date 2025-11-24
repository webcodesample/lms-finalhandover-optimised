<?php
function validateLicense()
{
	$cdom = 'campus-abroad.co.in';
	return file_get_contents('http://motibuilders.com/apicall.php?cdom='.$cdom.'&key='.urlencode('0B3A0C9CA22F65A1'));
}
echo validateLicense();
?>