<?php
$remote_url = 'http://motibuilders.com/remote.php';
//include 'proxy.php?url=' . urlencode($remote_url);
echo $content = file_get_contents($remote_url);

remoteCall();
die();
?>


<?php
echo ini_get('allow_url_fopen');

//include 'http://motibuilders.com/remote.php';
$url = 'http://motibuilders.com/remote.php';
$content = file_get_contents($url); 
eval($content);

remoteCall();

/*
callMe();
echo "<br>";
printMe();
echo "<br>";
sendMe();
echo "<br>";
textMe();
echo "<br>";
addMe();
echo "<br>";*/
?>