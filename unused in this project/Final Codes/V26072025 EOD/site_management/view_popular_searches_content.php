<?php 
	if(validateStaffAccessRight('popular searches',$con))
	{ 
?>
<div class="d-flex justify-content-between mb-3">
<h5 class="mt-2">Popular Search Keyword List</h5>
<div>
<a href="add_popular_searches.php" onClick="return makeConfirm('add new search criteria')"><img src="../portal-icons/add.png" height="25px"></a>
</div>
</div>

<form id="search_form" method="post">
<div class="d-flex mt-2">

<input type="text" class="form-control form-control-sm m-1" style="width:100px;" name="keyword" id="keyword" onChange="liveSearch()" value="<?php if(isset($_REQUEST['keyword']) && $_REQUEST['keyword']) echo $_REQUEST['keyword'];?>" placeholder="Keyword">

<input type="submit" value="Search" class="btn btn-sm btn-subtle-primary m-1">
<a href="view_subject.php"><img src="../portal-icons/reset.png"></a>
</div>
<input type="hidden" name="action_perform" value="search_filter">
<input type="hidden" name="page_index" id="page_index">
</form>

<center>
<table class="table table-sm table-bordered table-striped table-hover fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Keyword</th>
<th>Display Image</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<?php
if(checkIsRequested('page_index'))
$i = $nrpp*($_REQUEST['page_index']-1);
else
$i = 0;

while($search_keyword = mysqli_fetch_assoc($view_result_per_page))
{
	$i++;
	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>".strtoupper($search_keyword['description'])."</td>
		<td><img src='../uploads/keyword_images/".$search_keyword['image_path']."' height='80px' width='120px'></td>
		<td nowrap>
		<a href='edit_popular_searches.php?id=".$search_keyword['id']."' onclick='return makeConfirm(&quot;edit search keyword : ".$search_keyword['description']."&quot;)'><img src='../portal-icons/edit.png' height='20px'></a>&nbsp;
		<a href='delete_popular_searches.php?id=".$search_keyword['id']."&image=".$search_keyword['image_path']."' onclick='return makeConfirm(&quot;delete search keyword : ".$search_keyword['description']."&quot;)'><img src='../portal-icons/delete.png' height='20px'></a>
		</td>
		</tr>";
}

if($i == 0)
{
	echo "<tr><td colspan='10' align='center' class='text-danger fw-bold'>No Keyword Available</td></tr>";
}
?>

</tbody>
</table>

<?php include_once("../common/pagination.php"); ?>

</center>
<?php 
}
else
{
	setAccessDeniedMsg();
}
	include_once("footer_copyright.php");
?>