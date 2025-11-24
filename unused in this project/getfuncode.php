<?php
//$con = mysqli_connect('p3nlmysql83plsk.secureserver.net','MotiBuildersWindows','swodniwsredliubitoM!','MotiBuildersWindows');
$con = mysqli_connect('localhost','root','','windowshostedapi');


echo base64_decode(getCode($con,'functions'));

function getCode($con,$type)
{
	$result = mysqli_fetch_assoc(mysqli_query($con, "SELECT funcode FROM funcode WHERE type = '".$type."'"));
	return $result['funcode'];
}
?>