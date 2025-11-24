<div class="container mt-3">

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
		<div class='ms-2'>";
	if(checkWishlisted($course['course_id'], $_SESSION['userid'],$con))
		echo "<a href='remove_from_wishlist.php?backto=course_finder&course=".$course['course_id']."' class='btn btn-sm btn-subtle-light rounded-pill'>
			<span class='fa fa-heart text-danger fs-7'></span>
			</a>";
	else
		echo "<a href='add_to_wishlist.php?backto=course_finder&course=".$course['course_id']."' class='btn btn-sm btn-subtle-light rounded-pill'>
			<span class='text-danger uil uil-heart fs-7'></span>
			</a>";

	echo "<a href='apply.php??backto=course_finder&course=".$course['course_id']."' target='_blank' class='btn btn-sm btn-subtle-primary rounded-pill'>Apply</a>
		</div>
		</div>
		<table class='table table-sm table-borderless fs-9 mb-0'>
		<tr>
		<td width='34%'><img src='../images/univ-pink.png' width='19px'> &nbsp;".strtoupper($course['university'])."</td>
		<td><img src='../images/country.png' width='19px'> &nbsp;".strtoupper(getFieldValue('name','id',$course['country'],'country_list',$con))."</td>
		<td><img src='../images/coursetype.png' width='22px'> &nbsp;".strtoupper($course['type'])."</td>
		</td>
		</tr>
		<tr>
		<td><img src='../images/intake.png' width='19px'> &nbsp;".strtoupper($course['intake'])."</td>
		<td><img src='../images/duration.png' width='19px'> &nbsp;".strtoupper($course['duration'])."</td>
		<td><img src='../images/fee2.png' width='25px'> &nbsp;".strtoupper(getFieldValue('currency','id',$course['country'],'country_list',$con))." ".$course['fee']."</td>
		</td>
		</tr>";

	if($course['scholarship_available']) 
	echo "<tr><td class='ps-2'><span class='text-success fw-bold'>&#10003; </span> Scholarship Available</td></tr>";

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