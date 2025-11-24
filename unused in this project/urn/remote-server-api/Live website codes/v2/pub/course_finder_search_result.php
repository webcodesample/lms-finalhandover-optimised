<div class="container mt-3 pb-5" style="width:850px;">
<h5 class="ps-2">Total Courses : <?=$total_rows?></h5>

<?php
if(checkIsRequested('page_index'))
$i = $nrpp*($_REQUEST['page_index']-1);
else
$i = 0;

while($course = mysqli_fetch_assoc($view_result_per_page))
{
	$i++;

	echo "<div class='card my-2 bg-light'>
		<div class='card-body'>
		<div class='d-flex justify-content-between'>
		<h5><img src='../images/course.png' width='25px'> &nbsp;".strtoupper($course['course_name'])."</h5>
		<div class='ms-2'>
		<a href='apply.php?course=".$course['course_id']."' class='btn btn-sm btn-subtle-primary rounded-pill'>Apply</a>
		</div>
		</div>
		<table class='table table-sm table-borderless fs-9'>
		<tr>
		<td width='34%' nowrap><img src='../images/univ-pink.png' width='19px'> &nbsp;".strtoupper($course['university'])."</td>
		<td nowrap><img src='../images/country.png' width='19px'> &nbsp;".strtoupper(getFieldValue('name','id',$course['country'],'country_list',$con))."</td>
		<td nowrap><img src='../images/coursetype.png' width='22px'> &nbsp;".strtoupper($course['type'])."</td>
		</td>
		</tr>
		<tr>
		<td nowrap><img src='../images/intake.png' width='19px'> &nbsp;".strtoupper($course['intake'])."</td>
		<td nowrap><img src='../images/duration.png' width='19px'> &nbsp;".strtoupper($course['duration'])."</td>
		<td nowrap><img src='../images/fee2.png' width='25px'> &nbsp;".strtoupper(getFieldValue('currency','id',$course['country'],'country_list',$con))." ".$course['fee']."</td>
		</td>
		</tr>";

	if($course['scholarship_available']) 
	echo "<tr><td class='ps-2' nowrap><span class='text-success fw-bold'>&#10003; </span> Scholarship Available</td></tr>";

	echo "</table>
		</div>
		</div>";
}

if($i == 0)
{
	echo "<div class='text-danger fw-bold'>No Course Available</div>";
}
?>

<div class="d-flex justify-content-center pb-5 mb-3">
<?php include_once("../common/pagination.php"); ?>
</div>
</div>