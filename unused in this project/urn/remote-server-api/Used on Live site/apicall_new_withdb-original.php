<?php
$con = mysqli_connect('p3nlmysql83plsk.secureserver.net','MotiBuildersWindows','swodniwsredliubitoM!','MotiBuildersWindows');

eval(base64_decode(getCode($con,'keystatusValidation')));
eval(base64_decode(getCode($con,'domainValidation')));

if($keyStatus && base64_decode($_REQUEST['key']) == 'AP12CR59DX' && $_REQUEST['act'] == 'setfun' && $domain_validation)
$result = getCode($con,'functions');
else if($keyStatus && base64_decode($_REQUEST['key']) == 'AP12CR59DX' && $domain_validation)
$result = 1;

echo $result;

function getCode($con,$type)
{
	$result = mysqli_fetch_assoc(mysqli_query($con, "SELECT funcode FROM funcode WHERE type = '".$type."'"));
	return $result['funcode'];
}
?>