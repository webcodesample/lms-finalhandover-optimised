<?php
include_once("common_include.php");

insertData('processing_charges_list',$_REQUEST,$con);

header("Location:lms_features.php?tab=processing_fee_rate");
?>