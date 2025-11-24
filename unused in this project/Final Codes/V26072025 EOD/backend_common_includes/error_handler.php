<?php
$requested_url = $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];

if (!file_exists($requested_url) || is_dir($requested_url)) {
    header("HTTP/1.0 404 Not Found");
    include('../error/access_denied.php');
    exit();
}
?>