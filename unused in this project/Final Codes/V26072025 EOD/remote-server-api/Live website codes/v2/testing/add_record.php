<?php
include_once("common_include.php");

include_once("head.php");
?>

<div class="d-flex justify-content-between p-2 mb-5">
	<span><?=$_SESSION['username']?></span>
	<a href="logout.php" class="btn btn-sm btn-danger m-1">Logout</a>
</div>

<div class="d-flex justify-content-end p-2 mb-2">
	<a href="test_report.php" class="btn btn-sm btn-success m-1">Go Back</a>
</div>

<div class="container" style="width: 500px;">
<center>
<form action="create_record.php" method="post">

<select name="report_type" class="form-select form-select-sm m-1" style="width: 350px;" required>
<option value="">Select Report Type</option>
<option value="0">Error</option>
<option value="1">Sugestion</option>
</select>

<textarea class="form-control form-control-sm m-1" name="test_remark" placeholder="Test Remark/Suggestion" style="width:350px; height:200px;" required></textarea>

<button type="submit" class="btn btn-sm btn-success m-1">Submit Testing Feedback</button>
</form>
</center>
</div>