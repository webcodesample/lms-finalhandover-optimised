<?php
$valid_file_extension = ['php','jpg','js','css'];

$directory = './';
$files = scandir($directory);

foreach ($files as $file) 
{
	//check $file is a file with valid extension
	if(is_file($file) && in_array(pathinfo($file, PATHINFO_EXTENSION),$valid_file_extension))
    unlink($file);
}
?>