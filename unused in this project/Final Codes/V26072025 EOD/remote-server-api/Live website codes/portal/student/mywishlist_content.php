<h5 class="mb-3">My Wishlist
<span class="fa fa-heart text-danger fs-9"></span>
<span class="fa fa-heart text-danger fs-9"></span>
<span class="fa fa-heart text-danger fs-9"></span>
</h5>

<?php
while($mywishlist = mysqli_fetch_assoc($wishlist))
{
	$where_con_array = [ 'id' => $mywishlist['course_id']];
	$course = mysqli_fetch_assoc(getRowsDataCon('course_list',$where_con_array,$con));

	echo "<div class='card mb-3'>
		<div class='card-body'>
		<div class='d-flex justify-content-between mb-2'>
		<h5 class='mt-2'>".$course['name']."</h5>
		<div>
		<a href='remove_from_wishlist.php?backto=mywishlist&course=".$mywishlist['course_id']."' class='text-decoration-none'>
		<span class='fa fa-heart text-danger fs-7'></span>
		</a>
		<a href='apply.php?course=".$mywishlist['course_id']."' target='_blank' class='btn btn-sm btn-subtle-primary rounded-pill px-2 py-1'>Apply</a>
		</div>
		</div>
		<table class='table table-sm table-borderless fs-9 mb-0'>
		<tr>
		<td width='34%'><img src='../images/univ-pink.png' width='19px'> &nbsp;".strtoupper(getFieldValue('name','id',$course['university_id'],'university_list',$con))."</td>
		<td><img src='../images/country.png' width='19px'> &nbsp;".strtoupper(getFieldValue('name','id',getFieldValue('country_id','id',$course['university_id'],'university_list',$con),'country_list',$con))."</td>
		<td><img src='../images/coursetype.png' width='22px'> &nbsp;".strtoupper($course['type'])."</td>
		</td>
		</tr>
		<tr>
		<td><img src='../images/intake.png' width='19px'> &nbsp;".strtoupper($course['intake'])."</td>
		<td><img src='../images/duration.png' width='19px'> &nbsp;".strtoupper($course['duration'])."</td>
		<td><img src='../images/fee2.png' width='25px'> &nbsp;".strtoupper(getFieldValue('currency','id',getFieldValue('country_id','id',$course['university_id'],'university_list',$con),'country_list',$con))." ".$course['fee']."</td>
		</td>
		</tr>";

	if($course['scholarship_available']) 
	echo "<tr><td class='ps-2'><span class='text-success fw-bold'>&#10003; </span> Scholarship Available</td></tr>";

	echo "</table>
		</div>
		</div>";
}
?>