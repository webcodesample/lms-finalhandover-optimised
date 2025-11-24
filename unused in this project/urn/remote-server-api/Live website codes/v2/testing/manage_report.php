<?php
include_once("common_include.php");

$where_con_array = [ 'id' => $_REQUEST['report_id'] ];

$report = mysqli_fetch_assoc(getRowsDataCon('testing_report_list_v2',$where_con_array,$con));

if($report['type'])
{
	$report_type = "Suggestion";
	$text_class = "text-success";
}
else
{
	$report_type = "Error";
	$text_class = "text-danger";
}

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
<form action="update_record.php" method="post">
<input type="hidden" name="report_id" value="<?=$_REQUEST['report_id']?>">

<select name="status" class="form-select form-select-sm m-1" style="width:350px;" required>
<option value="">Select Report Status</option>
<option value="1">Updated</option>

<?php
if($_SESSION['login_type'] == 1 || $_SESSION['login_type'] == 3)
{
	echo "<option value='3'>Complete</option>";
}
?>
<?php
if($_SESSION['login_type'] == 2)
{
	echo "<option value='2'>Rectified</option>
		<option value='3'>Complete</option>";
}
?>

</select>

<input type="text" class="form-control form-control-sm fw-bold m-1 <?=$text_class?>" style="width:350px;" value="<?=$report_type?>" disabled>

<textarea class="form-control form-control-sm m-1" name="test_remark" placeholder="Test Remark/Suggestion" style="width:350px; height:200px;" disabled><?=$report['testing_comment']?></textarea>

<textarea class="form-control form-control-sm m-1" name="update_remark" placeholder="Update Remark/Suggestion" style="width:350px; height:200px;" required></textarea>

<button type="submit" class="btn btn-sm btn-success m-1">Submit Testing Feedback</button>
</form>
</center>
</div>