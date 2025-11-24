<?php
include_once("funcon.php");
eval(base64_decode(getCode($con,'keystatusValidation')));
eval(base64_decode(getCode($con,'domainValidation')));
eval(base64_decode(getCode($con,'setResult')));
echo $result;
?>
