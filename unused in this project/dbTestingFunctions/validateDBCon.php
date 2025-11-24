<?php

if(isset($_REQUEST['db_name']) && $_REQUEST['db_name'])
{
	mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
	try 
	{
		$conn = mysqli_connect($_REQUEST['db_host'],$_REQUEST['db_user'],$_REQUEST['db_pass'],$_REQUEST['db_name']);
		echo "Database Connected successfully";
	} 
	catch (mysqli_sql_exception $e) {
		echo "Connection Failed : Invalid Database Credentials";// . $e->getMessage();
	}
}

?>
<form method="post">
<input type="text" name="db_host" placeholder="Database Host" value="localhost" required>
<input type="text" name="db_user" placeholder="User Name" required>
<input type="text" name="db_pass" placeholder="Password" required>
<input type="text" name="db_name" placeholder="Database Name" required>
<button>Test Database Connection</button>
</form>