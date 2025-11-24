<?php
include_once("common_include.php");

validateLoginType($_SESSION['login_type']);

//SELECT * FROM `staff_list` WHERE role_type NOT IN (1,7);

if($_SESSION['login_type'] == 8)
{
	$restricted_login_type = "(1,7,8)";
	$visible_role_type = [3];
}
else if($_SESSION['login_type'] == 1)
{
	$restricted_login_type = "(1,7)";
	$visible_role_type = [3,8];
}
else
{
	$restricted_login_type = "(7)";
	$visible_role_type = [1,3,8];
}

$where_con = " WHERE 1";

$search = [
			'id' => '',
			'name' => '',
			'company_name' => '',
			'email' => '',
			'mobile' => '',
			'ctype' => '',
			'source' => '',
			];

$clear_filter_btn = "";
$search_form_display_class = "d-none";

$charVal = ['name','email','mobile','type'];

if(isset($_REQUEST['action_perform']))
{
	foreach($charVal AS $searchInput)
	{
		if($_REQUEST['search_'.$searchInput])
		{
			if($searchInput == 'type')
			$where_con .= " AND type = ".$_REQUEST['search_'.$searchInput];
			else if($searchInput == 'mobile')
			$where_con .= " AND (".$searchInput." LIKE '%".$_REQUEST['search_'.$searchInput]."%' OR alt_".$searchInput." LIKE '%".$_REQUEST['search_'.$searchInput]."%')";
			else
			$where_con .= " AND ".$searchInput." LIKE '%".$_REQUEST['search_'.$searchInput]."%' OR contact_person LIKE '%".$_REQUEST['search_'.$searchInput]."%'";
		}

		$search[$searchInput] = $_REQUEST['search_'.$searchInput];
	}

	$clear_filter_btn .= "<a href='list.php' class='btn btn-sm btn-subtle-info m-1 px-2'>Clear Filter</a>";
	$search_form_display_class = "";
}
//print_r($_REQUEST); echo $where_con; die();
$introducers_list = mysqli_query($con, "SELECT * FROM introducer_list".$where_con." ORDER BY name");

include_once("content_layout.php");
?>