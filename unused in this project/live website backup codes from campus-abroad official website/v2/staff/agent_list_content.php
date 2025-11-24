<div class="d-flex justify-content-between">
<h5>Campus Abroad Agent List</h5>
<a href="add_agent.php"><img src="../portal-icons/add.png" width="35px"></a>
</div>

<div class="d-flex mb-2">
<ul class="nav nav-underline fs-9">
	<li class="nav-item"><a class="nav-link <?=$all_agents?>" href="agent_list.php">All Agents (<?=getRowCountWC('agent_list',$con)?>)</a></li>
	<li class="nav-item"><a class="nav-link <?=$active_agents?>" href="agent_list.php?status=1">Active Agents (<?=getRowCount('status',1,'agent_list',$con)?>)</a></li>
	<li class="nav-item"><a class="nav-link <?=$inactive_agents?>" href="agent_list.php?status=0">Inactive Agents (<?=getRowCount('status',0,'agent_list',$con)?>)</a></li>
</ul>
</div>

<form method="post">
<input type="hidden" name="status" value="<?php if(isset($status)) echo $status?>">
<div class="d-flex mb-3">
<input type="text" name="name" placeholder="Name" class="form-control form-control-sm m-1" style="width:150px;" value="<?php if(isset($_REQUEST['name'])) echo $_REQUEST['name']?>">
<input type="text" name="email" placeholder="Email" class="form-control form-control-sm m-1" style="width:150px;" value="<?php if(isset($_REQUEST['email'])) echo $_REQUEST['email']?>">
<input type="text" name="mobile" placeholder="Mobile" class="form-control form-control-sm m-1" style="width:150px;" value="<?php if(isset($_REQUEST['mobile'])) echo $_REQUEST['mobile']?>">
<input type="text" name="whatsapp" placeholder="WhatsApp" class="form-control form-control-sm m-1" style="width:150px;" value="<?php if(isset($_REQUEST['whatsapp'])) echo $_REQUEST['whatsapp']?>">
<input type="text" name="company_name" placeholder="Company Name" class="form-control form-control-sm m-1" style="width:150px;" value="<?php if(isset($_REQUEST['company_name'])) echo $_REQUEST['company_name']?>">
<input type="submit" value="Search" class="btn btn-subtle-danger m-1">
<a href="<?=$reset_url?>" class="btn btn-subtle-warning m-1">Clear Filter</a>
</div>
</form>

<table class="table table-sm table-hover table-bordered table-striped fs-9">

<thead class="table-info text-center">
<tr>
<th>#</th>
<th>Name</th>
<th>ID</th>
<th>Email</th>
<th>Mobile</th>
<th>WhatsApp</th>
<th>Company Name</th>
<th>Company Address</th>
<th>Company Website</th>
<th>Action</th>
</tr>
</thead>

<tbody>

<?php
$i = 0;

while($agent = mysqli_fetch_assoc($agent_list))
{
	$i++;

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td><a class='text-decoration-none' href='manage_agent.php?agent_id=".$agent['id']."'>".ucwords($agent['name'])."</a></td>
		<td><a class='text-decoration-none link-danger' href='manage_agent.php?agent_id=".$agent['id']."'>SA".$agent['id']."</a></td>
		<td>".$agent['email']."</td>
		<td>".$agent['mobile']."</td>
		<td>".$agent['whatsapp']."</td>
		<td>".ucwords($agent['company_name'])."</td>
		<td>".strtoupper($agent['company_address'])."</td>
		<td>".$agent['company_website']."</td>
		<td nowrap>";
	if($agent['status'] == 1)
	echo "<a href='manage_agent_status.php?agent_id=".$agent['id']."&status=0' onclick='return makeConfirm(&quot;deactivate ".ucwords($agent['name'])."&quot;)'><span class='text-danger me-2' data-feather='power' style='height: 18px; width: 18px;'></span></a>";
	else
	echo "<a href='manage_agent_status.php?agent_id=".$agent['id']."&status=1' onclick='return makeConfirm(&quot;activate ".ucwords($agent['name'])."&quot;)'><span class='text-success me-2' data-feather='power' style='height: 18px; width: 18px;'></span></a>";

	echo "<a href='manage_agent.php?agent_id=".$agent['id']."' onclick='return makeConfirm(&quot;edit ".ucwords($agent['name'])."&quot;)'><img src='../portal-icons/edit.png' height='20px'></a>
		<a href='chat_history.php?chat_with=SA".$agent['id']."' target='_blank' class='mx-1'  onclick='return makeConfirm(&quot;chat with ".ucwords($agent['name'])."&quot;)'><span class='text-success' data-feather='message-circle' style='height: 20px; width: 20px;'></span></a>
		</td>
		</tr>";
}

if($i == 0)
	echo "<tr><th colspan='9' class='text-center text-danger'>No Agent Available</th></tr>";


?>

</tbody>
</table>

<?php include_once("footer_copyright.php") ?>