<div class="d-flex justify-content-between">
<h5>Campus Abroad Sales Person List</h5>
<a href="add_sales_person.php"><img src="../portal-icons/add.png" width="35px"></a>
</div>

<div class="d-flex mb-2">
<ul class="nav nav-underline fs-9">
	<li class="nav-item"><a class="nav-link <?=$all_sales_person?>" href="sales_person_list.php">All (<?=getRowCountWC('sales_person_list',$con)?>)</a></li>
	<li class="nav-item"><a class="nav-link <?=$active_sales_person?>" href="sales_person_list.php?status=1">Active (<?=getRowCount('status',1,'sales_person_list',$con)?>)</a></li>
	<li class="nav-item"><a class="nav-link <?=$inactive_sales_person?>" href="sales_person_list.php?status=0">Inactive (<?=getRowCount('status',0,'sales_person_list',$con)?>)</a></li>
</ul>
</div>

<form method="post">
<input type="hidden" name="status" value="<?php if(isset($status)) echo $status?>">
<div class="d-flex mb-3">
<input type="text" name="name" placeholder="Name" class="form-control form-control-sm m-1" style="width:150px;" value="<?php if(isset($_REQUEST['name'])) echo $_REQUEST['name']?>">
<input type="text" name="email" placeholder="Email" class="form-control form-control-sm m-1" style="width:150px;" value="<?php if(isset($_REQUEST['email'])) echo $_REQUEST['email']?>">
<input type="text" name="mobile" placeholder="Mobile" class="form-control form-control-sm m-1" style="width:150px;" value="<?php if(isset($_REQUEST['mobile'])) echo $_REQUEST['mobile']?>">
<input type="text" name="whatsapp" placeholder="WhatsApp" class="form-control form-control-sm m-1" style="width:150px;" value="<?php if(isset($_REQUEST['whatsapp'])) echo $_REQUEST['whatsapp']?>">
<input type="submit" value="Search" class="btn btn-subtle-danger m-1">
<a href="<?=$reset_url?>" class="btn btn-subtle-warning m-1">Clear Filter</a>
</div>
</form>

<table class="table table-sm table-hover table-bordered table-striped fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Name</th>
<th>Email</th>
<th>Mobile</th>
<th>WhatsApp</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($sales_person = mysqli_fetch_assoc($sales_person_list))
{
	$i++;

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td><a class='text-decoration-none' href='manage_sales_person.php?sales_person_id=".$sales_person['id']."'>".ucwords($sales_person['name'])."</a></td>
		<td>".$sales_person['email']."</td>
		<td>".$sales_person['mobile']."</td>
		<td>".$sales_person['whatsapp']."</td>
		<td nowrap>";
	if($sales_person['status'] == 1)
	echo "<a href='manage_sales_person_status.php?sales_person_id=".$sales_person['id']."&status=0'><span class='text-danger me-2' data-feather='power' style='height: 18px; width: 18px;'></span></a>";
	else
	echo "<a href='manage_sales_person_status.php?sales_person_id=".$sales_person['id']."&status=1'><span class='text-success me-2' data-feather='power' style='height: 18px; width: 18px;'></span></a>";

	echo "<a href='manage_sales_person.php?sales_person_id=".$sales_person['id']."'><img src='../portal-icons/edit.png' height='20px'></a>
				<a href='chat_history.php?chat_with=SP".$sales_person['id']."' target='_blank' class='mx-1'><span class='text-success' data-feather='message-circle' style='height: 20px; width: 20px;'></span></a>
		</td>
		</tr>";
}

if($i == 0)
	echo "<tr><th colspan='9' class='text-center text-danger'>No Sales Person Available</th></tr>";


?>

</tbody>
</table>

<?php include_once("footer_copyright.php") ?>