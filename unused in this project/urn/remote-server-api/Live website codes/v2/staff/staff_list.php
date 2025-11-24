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

$all_staffs = "";
$active_staffs = "";
$inactive_staffs = "";

$where_con ="";

if(isset($_REQUEST['status']) && $_REQUEST['status'] == 1)
{
	$active_staffs = "active";
	$where_con .= " AND status = ".$_REQUEST['status'];
}
else if(isset($_REQUEST['status']) && $_REQUEST['status'] == 0)
{
	$inactive_staffs = "active";
	$where_con .= " AND status = ".$_REQUEST['status'];
}
else
{
	$all_staffs = "active";
}

$search_id = "";
$search_name = "";
$search_email = "";
$search_mobile = "";
$search_role = "";
$clear_filter_btn = "";
$search_form_display_class = "d-none";

if(isset($_REQUEST['action_perform']))
{
	$_REQUEST['msg'] = "";

	if(isset($_REQUEST['search_id']) && $_REQUEST['search_id'])
	{
		$search_id .= $_REQUEST['search_id'];
		$where_con .= " AND id = ".substr($_REQUEST['search_id'],2);
	}

	if(isset($_REQUEST['search_name']))
	{
		$search_name .= $_REQUEST['search_name'];
		$where_con .= " AND name LIKE '%".$_REQUEST['search_name']."%'";
	}

	if(isset($_REQUEST['search_mobile']))
	{
		$search_mobile .= $_REQUEST['search_mobile'];
		$where_con .= " AND mobile LIKE '%".$_REQUEST['search_mobile']."%'";
	}

	if(isset($_REQUEST['search_email']))
	{
		$search_email .= $_REQUEST['search_email'];
		$where_con .= " AND email LIKE '%".$_REQUEST['search_email']."%'";
	}

	if(isset($_REQUEST['search_role']) && $_REQUEST['search_role'])
	{
		$search_role .= $_REQUEST['search_role'];
		$where_con .= " AND role_type = ".$_REQUEST['search_role'];
	}

	$clear_filter_btn .= "<a href='staff_list.php' class='btn btn-sm btn-subtle-info m-1 px-2'>Clear Filter</a>";
	$search_form_display_class = "";
}

$query_part_common = "SELECT * FROM staff_list WHERE role_type NOT IN ".$restricted_login_type;

$query_staff_list = $query_part_common.$where_con." ORDER BY name ASC";
$result_staff_list = mysqli_query($con, $query_staff_list);

$query_staff_count_total = $query_part_common." ORDER BY name ASC";
$result_staff_count_total = mysqli_query($con, $query_staff_count_total);
$total_staff = mysqli_num_rows($result_staff_count_total);

$query_staff_count_active = $query_part_common." AND status = 1 ORDER BY name ASC";
$total_staff_active = mysqli_num_rows(mysqli_query($con,$query_staff_count_active));

$query_staff_count_inactive = $query_part_common." AND status = 0 ORDER BY name ASC";
$total_staff_inactive = mysqli_num_rows(mysqli_query($con,$query_staff_count_inactive));

include_once("content_layout.php");
?>