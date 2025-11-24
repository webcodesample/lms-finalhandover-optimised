<?php
if(isset($_REQUEST['name_like']) && $_REQUEST['name_like'])
$requested_name_like = $_REQUEST['name_like'];
else
$requested_name_like = "";
?>
<div class="card rounded-5" style="width:305px;">
<form method="post">
<div class="d-flex">
<input type="text" class="form-control form-control-sm m-1 border-0 rounded-5 focus-ring focus-ring-light" style="width:250px;" name="name_like" required placeholder="Search By Name" value="<?=$requested_name_like?>">
<button type="submit" class="btn btn-sm btn-subtle-light m-1 p-0">
<span class="text-danger" data-feather="search" style="height: 30px; width: 30px;"></span>
</button>
</div>
</form>
</div>

<div class="d-flex mb-3">
	<ul class="nav nav-underline">
		<li class="nav-item"><a href="chat_list.php" class="nav-link <?=$recent_chat_tab?>">Recent</a></li>
		<li class="nav-item"><a href="chat_list.php?tab=bs" class="nav-link <?=$staff_tab?>">Staff</a></li>
		<!--<li class="nav-item"><a href="chat_list.php?tab=cr" class="nav-link <?=$customer_tab?>">Customer</a></li>-->
	<ul>
</div>

<div style="width:310px; height:500px;" class="overflow-auto">

<?php
while($chat = mysqli_fetch_assoc($chat_list))
{
	if(substr($chat['chat_id'],0,2) == 'BS')
	{
		$role_type = getFieldValue('role_type','id',substr($chat['chat_id'],2),'staff_list',$con);
		$chat_user_type = getFieldValue('description','id',$role_type,'login_type_list',$con);
		$chat_name = getFieldValue('name','id',substr($chat['chat_id'],2),'staff_list',$con);
	}
	else if(substr($chat['chat_id'],0,2) == 'CR')
	{
		$chat_user_type = "Customer";
		$chat_name = getFieldValue('name','id',substr($chat['chat_id'],2),'customers_list',$con);
		if(getRowCount('cust_id',$chat['chat_id'],'chat_sessions_list',$con) > 0)
		{
			if(!in_array(getFieldValue('staff_id','cust_id',$chat['chat_id'],'chat_sessions_list',$con),['',$_SESSION['user_ref_id']]))
			continue;
		}
		else
		{
			if(!isset($_REQUEST['tab']))
			continue;
		}
	}
	else
	{
		$chat_user_type = "Yourself";
		$chat_name = $_SESSION['username'];
		$chat['chat_id'] = $_SESSION['user_ref_id'];
	}

	if(file_exists("../profile_pics/".$chat['chat_id'].".jpg"))
		$profile_pic = $chat['chat_id'].".jpg";
	else
		$profile_pic = "default.png";

	if(!isset($_REQUEST['tab']))
		$display_user_type = $chat_user_type;
	else
		$display_user_type = "";
	
	if(isset($_REQUEST['name_like']) && $_REQUEST['name_like'])
		$name_like = "/".$_REQUEST['name_like']."/i";
	else
		$name_like = "//i";
		
	if(preg_match($name_like,$chat_name))
	{
		echo "<div class='bg-primary-subtle border border-secondary-subtle m-1 rounded-5'>
			<a href='chat_history.php?chat_with=".$chat['chat_id']."' target='_blank' class='text-decoration-none d-flex'>
			<img src='../profile_pics/".$profile_pic."' class='rounded-circle bg-primary m-1' height='50px' width='50px'>
			<div class='p-2'>
			<div class='text-primary'>".$chat_name."</div>
			<div class='text-dark fs-9'>".$display_user_type."</div>
			</div>
			</a>
			</div>";
	}
}
?>

</div>

<?php include_once("footer_copyright.php"); ?>
