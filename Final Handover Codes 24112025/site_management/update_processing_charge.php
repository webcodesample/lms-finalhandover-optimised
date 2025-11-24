<?php
include_once("common_include.php");

mysqli_query($con,"UPDATE processing_charges_list SET percentage = ".$_REQUEST['percentage']." WHERE id = ".$_REQUEST['id']);

header("Location:lms_features.php?tab=processing_fee_rate");
?>