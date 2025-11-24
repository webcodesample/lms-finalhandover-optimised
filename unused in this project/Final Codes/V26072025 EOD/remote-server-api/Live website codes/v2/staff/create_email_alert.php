<?php
include_once("common_include.php");

$to_emails = implode(',',$_REQUEST['to_email']);

if(isset($_REQUEST['linked_action']))
$on_actions = implode(',',$_REQUEST['linked_action']);

$email_alert_data = [
						'email_trigger_type' => $_REQUEST['trigger_type'],
						'from_email' => $_REQUEST['from_email'],
						'to_emails' => $to_emails,
						'on_actions' => $on_actions,
					];

insertData('email_alerts_setup',$email_alert_data,$con);

header("Location:email_alerts_settings.php");

?>