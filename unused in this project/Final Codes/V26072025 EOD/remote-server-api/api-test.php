<?php


function callAPI()
{
	// Using cURL
	$ch = curl_init();
	curl_setopt($ch, CURLOPT_URL, 'http://motibuilders.com/apicall.php?key=1234&funcname=validatekey');
	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
	$response = curl_exec($ch);
	curl_close($ch);
	return $response;
}

function callAPIFGC()
{
	return file_get_contents('http://motibuilders.com/apicall.php?key=12345');
}

if(!callAPIFGC())
{	
	//header("Location:https://moticorporation.com");
	echo 'Invalid API Access';
	die();
}

header("Location:backend");
/*
//echo base64_decode('WldOb2J5Qm1hV3hsWDJkbGRGOWpiMjUwWlc1MGN5Z25hSFIwY0RvdkwyMXZkR2xpZFdsc1pHVnljeTVqYjIwdllYQnBZMkZzYkM1d2FIQS9hMlY1UFRFeU16UW1ablZ1WTI1aGJXVTlkbUZzYVdSaGRHVnJaWGtuS1RzPQ==');
echo "<br>";
echo base64_decode('ZWNobyBmaWxlX2dldF9jb250ZW50cygnaHR0cDovL21vdGlidWlsZGVycy5jb20vYXBpY2FsbC5waHA/a2V5PTEyMzQmZnVuY25hbWU9dmFsaWRhdGVrZXknKTs=');
echo "<br>";
//eval(base64_decode('ZWNobyBmaWxlX2dldF9jb250ZW50cygnaHR0cDovL21vdGlidWlsZGVycy5jb20vYXBpY2FsbC5waHA/a2V5PTEyMzQmZnVuY25hbWU9dmFsaWRhdGVrZXknKTs='));
echo "<br>";
echo file_get_contents('http://motibuilders.com/apicall.php?key=1234&funcname=validatekey');
echo "<br>";
echo file_get_contents('http://motibuilders.com/apicall.php?key=10234&funcname=validatekey');
*/
?>