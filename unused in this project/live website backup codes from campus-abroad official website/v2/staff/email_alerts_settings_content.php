<div class="d-flex justify-content-between mb-3">
<h5 class="mt-2">Email Alert List</h5>
<div class="d-flex">
<span class="text-danger mx-1" data-feather="search" style="height: 25px; width: 25px; cursor:hand;" onClick="searchToggle()"></span>
<a href="add_email_alert_trigger.php"><img src="../portal-icons/add.png" width="25px"></a>
</div>
</div>

<div id="search_form" class="d-flex justify-content-between <?=$search_form_display_class?>">
<form method="post">
<div class="d-flex">
<input type="text" name="search_trigger_type" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Search Email Alert Type" value="<?=$search_trigger_type?>" onBlur="setSearchFlag(this.value)">
<input type="text" name="search_sender" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Search Sender" value="<?=$search_sender?>" onBlur="setSearchFlag(this.value)">
<input type="text" name="search_recipient" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Search Recipient" value="<?=$search_recipient?>" onBlur="setSearchFlag(this.value)">
<input type="hidden" name="action_perform" value="search">
<input type="hidden" id="search_flag" value="0">
<button type="submit" onClick="return validateSearchForm()" class="btn btn-sm btn-subtle-danger m-1 px-2">
<span data-feather="search"></span>
</button>
<?=$clear_filter_btn?>
</div>
</form>
</div>


<table class="table table-sm table-bordered table-hover fs-9">

<thead class="table-info text-center">
<th>#</th>
<th>Type</th>
<th>Sender</th>
<th>Recipients</th>
<th>Action</th>
</thead>

<tbody>

<?php
$i = 0;
while($email_alert = mysqli_fetch_assoc($email_alert_list))
{
	$i++;
	$delete_link = "";

	if($email_alert['on_actions'] == '')
	$delete_link .= "<a href='delete_email_alert_trigger.php?trigger_id=".$email_alert['id']."' onClick='return makeConfirm(&quot;delete&quot;)'><img src='../portal-icons/delete.png' width='20px'></a>";

	echo "<tr>
		<td class='ps-2'>".$i."</td>
		<td>".$email_alert['email_trigger_type']."</td>
		<td>".$email_alert['from_email']."</td>
		<td>".$email_alert['to_emails']."</td>
		<td nowrap>
		<a href='manage_email_alert_trigger.php?trigger_id=".$email_alert['id']."' onClick='return makeConfirm(&quot;edit&quot;)'><img src='../portal-icons/edit.png' width='20px'></a>
		".$delete_link."
		</td>
		</tr>";
}
?>

</tbody>
</table>

<?php include_once("footer_copyright.php"); ?>