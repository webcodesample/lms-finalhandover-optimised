<?php
include_once("common_include.php");

echo strtotime('today');
echo "<br>";
echo date('d-m-Y h:i:s A',strtotime('today'));
echo "<br>";
echo strtotime('tomorrow');
echo "<br>";
echo date('d-m-Y h:i:s A',strtotime('tomorrow'));

echo session_id();

print_r($_SESSION);
?>