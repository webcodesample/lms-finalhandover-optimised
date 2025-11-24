<?php
if(getMaxBatchId($con))
	include_once("create_new_status_batch.php");
else
	include_once("create_first_status_batch.php");
?>