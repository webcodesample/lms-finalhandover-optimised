<div class="d-flex mb-3">
	<ul class="nav nav-underline">
		<li class="nav-item"><a href="chat_list_partner.php" class="nav-link <?=$recent_chat_tab?>">Recent</a></li>
		<li class="nav-item"><a href="chat_list_partner.php?tab=bs" class="nav-link <?=$staff_tab?>">Staff</a></li>
		<li class="nav-item"><a href="chat_list_partner.php?tab=st" class="nav-link <?=$student_tab?>">Student</a></li>
	<ul>
</div>

<div style="width:310px;">

<?php
while($chat_id = mysqli_fetch_assoc($result))
{
	if(substr($chat_id['chat_id'],0,2) == 'BS')
	{
		$role_type = getFieldValue('role_type','id',substr($chat_id['chat_id'],2),'staff_list',$con);
		$chat_user_type = getFieldValue('description','id',$role_type,'login_type_list',$con);
		$chat_name = getFieldValue('name','id',substr($chat_id['chat_id'],2),'staff_list',$con);
	}
	else if(substr($chat_id['chat_id'],0,2) == 'SA')
	{
		$chat_user_type = "Agent";
		$chat_name = getFieldValue('name','id',substr($chat_id['chat_id'],2),'agent_list',$con);
	}
	else if(substr($chat_id['chat_id'],0,2) == 'SP')
	{
		$chat_user_type = "Sales Person";
		$chat_name = getFieldValue('name','id',substr($chat_id['chat_id'],2),'sales_person_list',$con);
	}
	else if(substr($chat_id['chat_id'],0,2) == 'ST')
	{
		$chat_user_type = "Student";
		$chat_name = getFieldValue('name','id',substr($chat_id['chat_id'],2),'students',$con);
	}
	else
	{
		$chat_user_type = "Yourself";
		$chat_name = $_SESSION['username'];
		$chat_id['chat_id'] = $_SESSION['user_ref_id'];
	}

	if(file_exists("../profile_pics/".$chat_id['chat_id'].".jpg"))
		$profile_pic = $chat_id['chat_id'].".jpg";
	else
		$profile_pic = "default.png";

	if(!isset($_REQUEST['tab']))
		$display_user_type = $chat_user_type;
	else
		$display_user_type = "";

	echo "<div class='bg-primary-subtle border border-secondary-subtle m-1 rounded-5'>
		<a href='chat_history.php?chat_with=".$chat_id['chat_id']."' target='_blank' class='text-decoration-none d-flex'>
		<img src='../profile_pics/".$profile_pic."' class='rounded-circle bg-primary m-1' height='50px' width='50px'>
		<div class='p-2'>
		<div class='text-primary'>".$chat_name."</div>
		<div class='text-dark fs-9'>".$display_user_type."</div>
		</div>
		</a>
		</div>";
}
?>

</div>