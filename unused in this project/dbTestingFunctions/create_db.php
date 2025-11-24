<?php

if(isset($_REQUEST['db_name']) && $_REQUEST['db_name'])
{
	$ds_con = mysqli_connect('localhost','root','');

	if($ds_con)
	{
		$dbCreationQuery = "CREATE DATABASE ".$_REQUEST['db_name']." CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci";
		if(mysqli_query($ds_con,$dbCreationQuery))
		$msg = "Database Created Successfully";
	}
}

?>
<form method="post">
<input type="text" name="db_name" placeholder="Database Name" required>
<button>Create Database</button>
</form>