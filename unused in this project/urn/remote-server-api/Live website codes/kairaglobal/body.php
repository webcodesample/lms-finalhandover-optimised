<body>

<?php 
$aboutus_link_active = "";
$services_link_active = "";
$contactus_link_active = "";
$joinus_link_active = "";

$requested_page = "about_us.php";

if(isset($_REQUEST['page']) && $_REQUEST['page'] == "services")
{
	$services_link_active = "active";
	$requested_page = "services.php";
}
else if(isset($_REQUEST['page']) && $_REQUEST['page'] == "contact")
{
	$contactus_link_active = "active";
	$requested_page = "contact_us.php";
}
else if(isset($_REQUEST['page']) && $_REQUEST['page'] == "join")
{
	$joinus_link_active = "active";
	$requested_page = "join_us.php";
}
else
{
	$aboutus_link_active = "active";
	$requested_page = "about_us.php";
}

include_once("navbar.php"); 

include_once($requested_page); 
?>

</body>

