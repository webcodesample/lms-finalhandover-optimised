<?php
include_once("common_include.php");

print_r($_REQUEST);

echo "<form method='post'>";
showAuthorizationOption($con);
echo "<input type='submit' value='submit'></form>";

die();

//get total lead count as per status description
$query_total_leads_per_status = "SELECT * FROM leads_details AS ld JOIN lead_status_list AS lsl ON ld.status_id = lsl.id WHERE lsl.description = 'Complete'";
$result_total_leads_per_status = mysqli_query($con,$query_total_leads_per_status);
echo $leads_counter = mysqli_num_rows($result_total_leads_per_status);

//createIncomeRecord(1,$con);

//createComissionPaymentRecord(1,$con);

list($width, $height) = getimagesize('../chat_files/images/BS2_BS8_1720844529.jpg');

print_r(getimagesize('../chat_files/images/BS2_BS8_1720844529.jpg'));
if ($width > $height) {
    echo "landscape";
} else {
    echo "portrait";
}

?>