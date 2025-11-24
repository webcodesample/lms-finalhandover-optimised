<?php
$url = $_GET['url'];

if (filter_var($url, FILTER_VALIDATE_URL) === false) {
    die('Invalid URL');
}

$context = stream_context_create(array(
    'http' => array(
        'timeout' => 5,
    ),
));

$content = @file_get_contents($url, false, $context);

if ($content === false) {
    die('Failed to fetch the remote file');
}

if($status==1)
echo "test ok";
else 
echo "test failed";

echo $content;
?>
