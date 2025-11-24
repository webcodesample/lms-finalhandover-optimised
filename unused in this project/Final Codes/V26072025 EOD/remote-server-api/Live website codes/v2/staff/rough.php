<?php
include_once("common_include.php");
include_once("head.php");

$to = "accounts@bafna.net,amit@moticorporation.com,ujasintha1720@gmail.com";

$recipients = explode(',',$to);

$subject = "Test Email";
$message = "Hello! This is a simple email message.";
$headers = "From: info@campus-abroad.co.in";

foreach($recipients as $rec)
{
    mail($rec, $subject, $message, $headers);
}

/*// Send email
if(mail($to, $subject, $message, $headers)) {
    echo "Email sent successfully!";
} else {
    echo "Failed to send email.";
}

/*echo setadditionalRecipients('Withdrawal Approval',$con)

/*
echo "<div class='rounded-circle bg-info border border-5 border-top-1 border-danger' style='height:250px; width:250px;'>Test</div>";




echo strtotime('+15 minutes');
echo date('d-m-Y h:i:s A',strtotime('-10 minutes'));
echo "<br>";
echo date('d-m-Y h:i:s A',strtotime('now')+600);

/*
$predefined_test_name = "GRE";
$predefined_test_name_array = explode(',',$predefined_test_name);
print_r($predefined_test_name_array);
echo count($predefined_test_name_array);
 die();

$predefined_test_list = getRowsData('predefined_test_list',$con);
while($predefined_test = mysqli_fetch_assoc($predefined_test_list))
{
    array_push($predefined_test_name_array, $predefined_test);
}
print_r($predefined_test_name_array);


$query = "SELECT name FROM predefined_test_list";
$result = mysqli_query($con,$query);
//print_r(mysqli_fetch_assoc($result));

/*
$date = strtotime("-7 day");
echo date('M d, Y h:i:s A', $date);
echo "<br>".date('W')."<br>";


echo mktime(0,0,0,7,15,2024);

//print_r($_REQUEST);

/*die();

echo "<form method='post'>";
showAuthorizationOption($con);
echo "<input type='submit' value='submit'></form>";



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
*/
?>

<form method="post">
<input type="email" name="email" id="email" onBlur="checkEmailUniqueness(this.id)" required>
<input type="submit">
</form>

<script>
function checkEmailUniqueness(inputFieldID)
{
    var emailID = $("#"+inputFieldID).val();
    $.ajax({
        url : "../ajax_files/checkEmailUniqueness_ajax.php",
        type: "post",
        data:{
            email: emailID,
        },
        success: function(response)
        {
            if(response == 1)
            {
                alert('Email already exist');
                $("#"+inputFieldID).val('');
            }
        }
    });
}
</script>