<?php
$where_con = "WHERE recipients LIKE '%".$lrn['email']."%' AND subject LIKE '%LA".$lrn['lrn']."%'";

$search_email_type = "";
$search_email_subject = "";
$clear_filter_btn = "";
$search_form_display_class = "d-none";

if(isset($_REQUEST['action_perform']))
{
	$_REQUEST['msg'] = "";

	if(isset($_REQUEST['search_email_type']) && $_REQUEST['search_email_type'])
	{
		$search_email_type .= $_REQUEST['search_email_type'];
		$where_con .= " AND type LIKE '%".$_REQUEST['search_email_type']."%'";
	}

	if(isset($_REQUEST['search_email_subject']) && $_REQUEST['search_email_subject'])
	{
		$search_email_subject .= $_REQUEST['search_email_subject'];
		$where_con .= " AND subject LIKE '%".$_REQUEST['search_email_subject']."%'";
	}

	$clear_filter_btn .= "<a href='urn_history.php?lead_id=".$_REQUEST['lead_id']."&tab=communication' class='btn btn-sm btn-subtle-info m-1 px-2'>Clear Filter</a>";
	$search_form_display_class = "";
}

$email_history_list_query = "SELECT * FROM email_history ".$where_con." ORDER BY datentime DESC";
$email_history_list = mysqli_query($con,$email_history_list_query);

?>



<div class="d-flex justify-content-between mt-5 mb-2">
<div class="d-flex">
<h6 class="mt-1">All Emails</h6>
<input type="checkbox" class="form-check-input m-1" checked onClick="$('#emailList').toggleClass('d-none');$('#searchIcon').toggleClass('d-none');">
</div>
<span class="text-danger mx-1" id="searchIcon" data-feather="search" style="height: 20px; width: 20px; cursor:hand;" onClick="searchToggle()"></span>
</div>

<div id="emailList">
	<div id="search_form" class="d-flex justify-content-between mb-2 <?=$search_form_display_class?>">
	<form method="post">
	<div class="d-flex">
	<input type="text" name="search_email_type" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Email Type" value="<?=$search_email_type?>" onBlur="setSearchFlag(this.value)">
	<input type="text" name="search_email_subject" class="form-control form-control-sm m-1" style="width:150px;" placeholder="Subject" value="<?=$search_email_subject?>" onBlur="setSearchFlag(this.value)">
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
	<th nowrap>Date & Time</th>
	<th>Type</th>
	<th>Subject</th>
	<th>Sender</th>
	</thead>

	<tbody>

	<?php
	$i = 0;
	while($email_history = mysqli_fetch_assoc($email_history_list))
	{
		$i++;
	
		echo "<tr>
			<td class='ps-2'>".$i."</td>
			<td nowrap>".date('d-m-Y h:i:s A',$email_history['datentime'])."</td>
			<td>".$email_history['type']."</td>
			<td>".$email_history['subject']."</td>
			<td>".$email_history['sender']."</td>
			</tr>";
	}

	//echo strtotime("now");
	?>

	</tbody>
	</table>

</div>