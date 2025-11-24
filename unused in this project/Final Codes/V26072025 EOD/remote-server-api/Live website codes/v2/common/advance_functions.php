<?php
include_once("api_key.php");

$baseURL = $_SERVER['SERVER_NAME'];
$site_index = 'CAP';

function setfileURL($fileUrl)
{
global $site_index,$baseURL,$api_key;
$ch = curl_init();

$target_url = "http://api-support.as4u.in/api-support/fileurl_support.php";

curl_setopt($ch,CURLOPT_URL,$target_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$data = array('site_index'=>$site_index, 'client_url'=>$baseURL, 'api_key'=>$api_key,'term'=>$fileUrl);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

return $response = curl_exec($ch);
curl_close($ch);
}

function setFooter($site_index,$theme,$site_name,$wsp_name,$wsp_site_url)
{
global $site_index,$baseURL,$api_key;
$ch = curl_init();

$target_url = "http://api-support.as4u.in/api-support/set_footer.php";

curl_setopt($ch,CURLOPT_URL,$target_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$data = array('site_index'=>$site_index, 'client_url'=>$baseURL, 'api_key'=>$api_key, 'theme'=>$theme, 'site_name'=>$site_name, 'wsp_name'=>$wsp_name, 'wsp_site_url'=>$wsp_site_url);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

return $response = curl_exec($ch);
curl_close($ch);
}

function setHead()
{
global $site_index,$baseURL,$api_key;
$ch = curl_init();

$target_url = "http://api-support.as4u.in/api-support/set_head.php";

curl_setopt($ch,CURLOPT_URL,$target_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$data = array('site_index'=>$site_index, 'client_url'=>$baseURL, 'api_key'=>$api_key);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

return $response = curl_exec($ch);
curl_close($ch);
}

function setSidebar($site_index,$theme,$site_url,$site_logo,$tax_rule,$currency_name,$currency,$username,$log_flag)
{
global $site_index,$baseURL,$api_key;
$ch = curl_init();

$target_url = "http://api-support.as4u.in/api-support/set_sidebar.php";

curl_setopt($ch,CURLOPT_URL,$target_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$data = array('site_index'=>$site_index, 'client_url'=>$baseURL, 'api_key'=>$api_key, 'theme'=>$theme, 'site_url'=>$site_url, 'site_logo'=>$site_logo, 'tax_rule'=>$tax_rule, 'currency_name'=>$currency_name, 'currency'=>$currency, 'log_flag'=>$log_flag, 'username'=>$username);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

return $response = curl_exec($ch);
curl_close($ch);
}

function show_login_advance($site_index,$form_type,$msg,$site_logo)
{
global $site_index,$baseURL,$api_key;
$ch = curl_init();

$target_url = "http://api-support.as4u.in/api-support/show_login_advance.php";

curl_setopt($ch,CURLOPT_URL,$target_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$data = array('site_index'=>$site_index, 'client_url'=>$baseURL, 'api_key'=>$api_key, 'form_type'=>$form_type, 'msg'=>$msg, 'site_logo'=>$site_logo);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

return $response = curl_exec($ch);
curl_close($ch);
}

function showSiteSettings($site_index,$admin_flag,$site_info)
{
global $site_index,$baseURL,$api_key;
$ch = curl_init();

$target_url = "http://api-support.as4u.in/api-support/show_site_settings.php";

curl_setopt($ch,CURLOPT_URL,$target_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$data = array_merge(array('site_index'=>$site_index, 'client_url'=>$baseURL, 'api_key'=>$api_key,'admin_flag'=>$admin_flag), $site_info);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

return $response = curl_exec($ch);
curl_close($ch);
}

function showTechOps($site_index,$admin_flag,$log_flag)
{
global $site_index,$baseURL,$api_key;
$ch = curl_init();

$target_url = "http://api-support.as4u.in/api-support/show_tech_ops.php";

curl_setopt($ch,CURLOPT_URL,$target_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$data = array('site_index'=>$site_index, 'client_url'=>$baseURL, 'api_key'=>$api_key,'admin_flag'=>$admin_flag, 'log_flag'=>$log_flag);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

return $response = curl_exec($ch);
curl_close($ch);
}

function showResetPassword($site_index,$admin_flag,$log_flag)
{
global $site_index,$baseURL,$api_key;
$ch = curl_init();

$target_url = "http://api-support.as4u.in/api-support/show_reset_password.php";

curl_setopt($ch,CURLOPT_URL,$target_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$data = array('site_index'=>$site_index, 'client_url'=>$baseURL, 'api_key'=>$api_key,'admin_flag'=>$admin_flag, 'log_flag'=>$log_flag);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

return $response = curl_exec($ch);
curl_close($ch);
}

function showForgotPassword($site_logo,$mail_status)
{
global $site_index,$baseURL,$api_key;
$ch = curl_init();

$target_url = "http://api-support.as4u.in/api-support/show_forgot_password.php";

curl_setopt($ch,CURLOPT_URL,$target_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$data = array('site_index'=>$site_index, 'client_url'=>$baseURL, 'api_key'=>$api_key,'site_logo'=>$site_logo, 'mail_status'=>$mail_status);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

return $response = curl_exec($ch);
curl_close($ch);
}

function showAddModule($site_index,$admin_flag,$log_flag)
{
global $site_index,$baseURL,$api_key;
$ch = curl_init();

$target_url = "http://api-support.as4u.in/api-support/show_add_module.php";

curl_setopt($ch,CURLOPT_URL,$target_url);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
$data = array('site_index'=>$site_index, 'client_url'=>$baseURL, 'api_key'=>$api_key,'admin_flag'=>$admin_flag, 'log_flag'=>$log_flag);
curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

return $response = curl_exec($ch);
curl_close($ch);
}

?>