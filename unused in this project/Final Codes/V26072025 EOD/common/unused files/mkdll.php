<?php
$script_arr = explode('/',$_SERVER['PHP_SELF']);

if(isset($_REQUEST['action_btn']))
{
	makeDll();
	include_once("set_con.php");
	$autocreate_sql = file_get_contents('../SQL/autocreate.sql');
	if(mysqli_multi_query($con,$autocreate_sql))
	{
		$con->close();
		echo '<script>window.location="../pub/course_finder.php";</script>';
	}
}

function makeDll()
{
	$myfile = fopen("../dll.txt", "w") or die("Unable to Create DLL");
	$db_credentials = $_REQUEST['db_host'].','.$_REQUEST['db_user'].','.$_REQUEST['db_pswd'].','.$_REQUEST['db_name'];
	fwrite($myfile, $db_credentials);
	fclose($myfile);

	$myfile_instalstatus = fopen("../common/install.txt", "w") or die("Unable to Install");
	$instalstatus = 111;
	fwrite($myfile_instalstatus, $instalstatus);
	fclose($myfile_instalstatus);
}
?>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

<form action="<?= end($script_arr) ?>" method="post">
<div class="container text-center mt-5" style="width:250px;">
<h6 class="text-danger">Enter Database Credentials</h6>
<input type="text" name="db_host" class="form-control mt-1" placeholder="Enter DB Host" required style="width:250px;">
<input type="text" name="db_user" class="form-control mt-1" placeholder="Enter DB Username" required style="width:250px;">
<input type="text" name="db_pswd" class="form-control mt-1" placeholder="Enter DB Password" style="width:250px;">
<input type="text" name="db_name" class="form-control mt-1" placeholder="Enter DB Name" required style="width:250px;">
<input type="submit" name="action_btn" value="Make DLL" class="btn btn-danger mt-1">
</div>
</form>