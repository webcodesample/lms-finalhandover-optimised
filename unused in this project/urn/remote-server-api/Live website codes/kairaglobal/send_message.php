<?php
$messageSentFlag = 0;

$valid_email_flag = 0;

$email_array = explode('@',$_REQUEST['email']);

if(count($email_array) > 1)
{
	$email_domain_array = explode('.',$email_array[1]);
	if(count($email_domain_array) > 1 && $email_domain_array[1] !== '')
	{
		// Always set content-type when sending HTML email
		$headers = "MIME-Version: 1.0" . "\r\n";
		$headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";

		// More headers
		$headers .= 'From: <info@campus-abroad.co.in>' . "\r\n";

		$messageforKairaglobal = "New Visitor Message Detail <br><br> Visitor Name : ".$_REQUEST['name'].
								"<br>Visitor Email : ".$_REQUEST['email'].
								"<br>Visitor Message : ".$_REQUEST['message']."<br><br>Thanks";

		mail("amit@moticorporation.com","New Visitor Message",$messageforKairaglobal,$headers);
		mail("hr@kairaglobal.co.uk","New Visitor Message",$messageforKairaglobal,$headers);
		$messageSentFlag = 1;
	}
	else
	{
		$messageSentFlag = 2;
	}
}
else
{
	$messageSentFlag = 2;
}

echo $messageSentFlag;
?>