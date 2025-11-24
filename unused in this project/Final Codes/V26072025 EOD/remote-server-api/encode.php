<?php
echo $encode_val = base64_encode("echo file_get_contents('http://motibuilders.com/apicall.php?key=1234&funcname=validatekey');");
echo "<br>";
echo $encode_val = base64_encode("file_get_contents('http://motibuilders.com/apicall.php?key=1234&funcname=validatekey');");
?>